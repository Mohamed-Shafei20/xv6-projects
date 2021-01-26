  ## Project requirements
  
**A.** Implement the clone() system call to create a kernel thread.

**B.** Implement the join() system call to wait for a thread to exit then kill it.

**C.** Implement a simple turn lock to support multi-threading.  

**D.** Build a little thread library to be on top of the raw system calls, with a create_thread(), join_thread(), init_lock(), acquire_lock(), and release_lock() functions to provide abstraction. 

  ## A. Building `clone()` system call To create a kernel thread.
  
### 1. Implementation in`sysproc.c`file
The wrapper function added in `sysproc.c` makes sure the user has provided the right number and type of arguments before passing the arguments to the actual system call.
```c
int sys_clone(void)
{
  void *fcn, *arg, *stack;
  if (argptr(0, (void*)&fcn, sizeof(*fcn)) < 0)
  return -1;
  if (argptr(1, (void*)&arg, sizeof(*arg)) < 0)
  return -1;
  if (argptr(2, (void*)&stack, sizeof(*stack)) < 0)
  return -1;
  return clone(fcn, arg, stack);
}
```
### 2. Implementation in`proc.c`file

The actual code of the `clone()` system call added in `proc.c` file

```c
int clone(void (*fcn)(void*), void *arg, void *stack)
{
  int i;
  struct proc *thread;
  struct proc *curproc = myproc();
  if ((curproc->sz - (uint) stack) < PGSIZE || ((uint) stack % PGSIZE) != 0)
  {
    return -1;
  }
  if ((thread = allocproc()) == 0)
  {
    return -1;
  }
  thread->pgdir = curproc->pgdir;
  thread->sz = curproc->sz;
  thread->parent = curproc;
  *thread->tf = *curproc->tf;
  uint user_stack[2];
  user_stack[0] = 0xffffffff; 
  user_stack[1] = (uint) arg;
  uint stack_top = (uint) stack + PGSIZE;
  stack_top -= 8;
  if (copyout(thread->pgdir, stack_top, user_stack, 8) < 0)
  {
    return -1;
  }
  thread->tf->ebp = (uint) stack_top;
  thread->tf->esp = (uint) stack_top;
  thread->tf->eip = (uint) fcn;
  thread->tf->eax = 0;
  for (i = 0; i < NOFILE; i++)
  if (curproc->ofile[i])
  thread->ofile[i] = filedup(curproc->ofile[i]);
  thread->cwd = idup(curproc->cwd);
  safestrcpy(thread->name, curproc->name, sizeof(curproc->name));
  acquire(&ptable.lock);
  thread->state = RUNNABLE;
  release(&ptable.lock);
  return thread->pid;
}
 ```
### 3. System call glue
Now we have the implementation of the clone system call, we need to glue it in to the rest of the operating system. To do this we will need to make changes to the following files:
```c
syscall.h : #define SYS_clone  22

syscall.c :
	1- Add an extern definition: extern int sys_clone(void);
	2- add an entry to the table: [SYS_clone]   sys_clone,

usys.S Add an entry for clone: SYSCALL(clone) 
                              
user.h Add a function prototype for the system call: int clone(void(*fcn)(void*), void *arg, void *stack);
  
defs.h Add a function prototype for the system call: int clone(void(*fcn)(void*), void *arg, void *stack);
```
Now the clone system call is recognized by the operating system and can be called by user programs. 


  ## B. Building join() system call to wait for a thread to exit then kill it.


  ## C. Building a simple turn lock to support multi-threaded programs.

  ## D. Building a little thread library to be on top of the raw system calls.
