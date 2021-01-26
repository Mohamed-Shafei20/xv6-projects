  ## Project requirements briefly
  
**A.** Building the `clone()` system call to create a kernel thread.

**B.** Building the `join()` system call to wait for a thread to exit then kill it.

**C.** Building a simple turn lock to support multi-threading.  

**D.** Build a little thread library to be on top of the raw system calls, with a `create_thread()`, `join_thread()`, `init_lock()`, `acquire_lock()`, and `release_lock()` functions to provide abstraction. 

**E.** Testing.


  ## A. Building `clone()` system call To create a kernel thread.
  
`clone()` system call creates a new kernel thread which shares the calling process's address space.  It returns the thread PID to the parent and 0 to the child (if successful), -1 otherwise.
  
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


  ## B. Building `join()` system call to wait for a thread to exit then kill it.

`join()` system call will check the list of currently running processes, looking for a thread belonging to the parent process. If it finds such a process, and its state us ZOMBIE it will kill it (clear its entry in the process table), join returns -1 if no child thread is found, and will sleep if it finds a child thread that is still running.

### 1. Implementation in`sysproc.c`file

The wrapper function added in `sysproc.c` does the job of invoking `join()` system call.

```c
int sys_join(void)
{
	return join();
}
```

### 2. Implementation in`proc.c`file

The actual code of the `join()` system call added in `proc.c` file

```c
int join(void)
{
	struct proc *t;
	int haveThreads, pid;
	struct proc *curproc = myproc();
	
	acquire(&ptable.lock);
	for(;;) 
	{
		haveThreads = 0;
		for(t = ptable.proc; t < &ptable.proc[NPROC]; t++)
		{

		if((t->parent != curproc) || (t->parent->pgdir != curproc->pgdir) )
				continue;
	       haveThreads = 1;
	       if(t->state == ZOMBIE) 
	       {	
			pid = t->pid;
			kfree(t->kstack);
			t->kstack = 0;
			t->pid = 0;
			t->parent = 0;
			t->name[0] = 0;
			t->killed = 0;
			t->state = UNUSED;
			release(&ptable.lock);

			return pid;
       }
    }
     if(!haveThreads || curproc->killed)
     {
       release(&ptable.lock);
       return -1;
     }
     sleep(curproc, &ptable.lock);
   }
}
```
### 3. System call glue
Now we have the implementation of the join system call, we need to glue it in to the rest of the operating system. To do this we will need to make changes to the following files:
```c
syscall.h : #define SYS_join  23

syscall.c :
	1- Add an extern definition: extern int sys_join(void);
	2- add an entry to the table: [SYS_join]   sys_join,

usys.S Add an entry for join: SYSCALL(join)
                              
user.h Add a function prototype for the system call: int join(void);
  
defs.h Add a function prototype for the system call: int join(void);
```
Now the clone system call is recognized by the operating system and can be called by user programs.


  ## C. Building a simple `turn lock` to support multi-threaded programs.
  
### Implementation in`user.h`file

```c
typedef struct turnlock
{
	uint flag;
} turnlock;  
```

  ## D. Building a little thread library to be on top of the raw system calls.
  
The thread library should be available as part of every program that runs in xv6. Thus, you should add prototypes to `user.h` and the actual code to implement the library routines in `ulib.c`. 

### 1. Implementation in`user.h`file

```c
int create_kThread(void (*fnc)(void *), void *arg);	 
int join_kThread(void);

void init_lock(struct ticketlock *tlock);
void acquire_lock(struct ticketlock *tlock);
void release_lock(struct ticketlock *tlock);
```

### 2. Implementation in`ulib.c`file

```c
int create_kthread(void (*fnc)(void *), void *arg)
{
	char *stack = sbrk(PGSIZE);
	return clone(fnc,arg,stack);	
} 

int join_kthread(void)
{
    	return join();
}

void init_lock(struct turnlock *xlock)
{
	xlock->flag = 0;
}

void acquire_lock(struct turnlock *xlock)
{
	while(xchg(&xlock->flag, 1) != 0);
}

void release_lock(struct turnlock *xlock)
{
	xchg(&xlock->flag, 0);
}
  ```
  
  ## E. Testing.
  
In order to test your work:

**1.** Add the test files inside xv6: `clonetest.c`, `jointest.c` and `kthreads.c`.</br>
**2.** Find the line `EXTRA=\` inside the `Makefile`, and add `clonetest.c`, `jointest.c` and `kthreads.c` to the list of files:
```c
EXTRA=\
	mkfs.c ulib.c user.h cat.c echo.c forktest.c grep.c kill.c\
	ln.c ls.c mkdir.c rm.c stressfs.c usertests.c wc.c zombie.c\
	printf.c umalloc.c\
	README dot-bochsrc *.pl toc.* runoff runoff1 runoff.list\
	.gdbinit.tmpl gdbutil\
	clonetest.c\
	jointest.c\
	kthreads.c\
```

Then find the line UPROGS=\ inside the `Makefile`. Add your file in the same format as the other entries:
```c
UPROGS=\
	_cat\
	_echo\
	_forktest\
	_grep\
	_init\
	_kill\
	_ln\
	_ls\
	_mkdir\
	_rm\
	_sh\
	_stressfs\
	_usertests\
	_wc\
	_zombie\
	_clonetest\
	_jointest\
	_kthreads\
  ```
To run a test program, start xv6 (as described previously) and run clonetest from the command line in the running xv6 kernel.

If you have followed the previous instructions precisely,

#### The following output after you run the clonetest program:
![clonetest](https://user-images.githubusercontent.com/61950372/105896849-08ee7f80-6020-11eb-96a5-80fbcb2a4ccc.png)
#### The following output after you run the jointest program:
![jointest](https://user-images.githubusercontent.com/61950372/105896877-14da4180-6020-11eb-99f8-c8f35e085fee.png)
#### The following output after you run the kthreads program:
![kthreads](https://user-images.githubusercontent.com/61950372/105897303-a944a400-6020-11eb-886b-f413c6fe3677.png)  

