  ## Project requirements
  
**A.** Implement the clone() system call to create a kernel thread.

**B.** Implement the join() system call to wait for a thread to exit then kill it.

**C.** Implement a simple turn lock to support multi-threading.  

**D.** Build a little thread library to be on top of the raw system calls, with a create_thread(), join_thread(), init_lock(), acquire_lock(), and release_lock() functions to provide abstraction. 

  ## A. Building `clone()` system call To create a kernel thread.
  
### 1. Implementation in`sysproc.c`
The wrapper function added in `sysproc.c` makes sure the user has provided the right number and type of arguments before passing the arguments to the actual system call.
```c
int sys_clone(void) {
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
### 1. Implementation in`proc.c`






  ## B. Building join() system call to wait for a thread to exit then kill it.


  ## C. Building a simple turn lock to support multi-threaded programs.

  ## D. Building a little thread library to be on top of the raw system calls.
