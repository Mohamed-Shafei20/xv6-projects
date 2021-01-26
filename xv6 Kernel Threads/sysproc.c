#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

// Clone system call code to create a new kernel thread in sysproc.c

int sys_clone(void) {
	
	// The clone() system call takes three arguments void *fcn, *arg, *stack. 
	// We'll need to retrieve each of these values.
	// xv6 provides access to these arguments through the argptr() function
	
	void *fcn, *arg, *stack;
	
	// The code below shows how to get the 0th argument, cast to void* and load it into 			*fcn
	// load argument 0 into the fcn pointer and return -1 if it is not void*
	
	if (argptr(0, (void*)&fcn, sizeof(*fcn)) < 0)
	return -1;
	if (argptr(1, (void*)&arg, sizeof(*arg)) < 0)
	return -1;
	if (argptr(2, (void*)&stack, sizeof(*stack)) < 0)
	return -1;
	return clone(fcn, arg, stack);
	}

	// join system call code in sysproc.c to wait for a thread to exite
	
	// join will check the list of currently running processes, looking for a thread 		belonging to the parent process. If it finds such a process, it will "kill" it 
	// join returns -1 if no child thread is found, 
	// and will sleep if it finds a child thread that is still running. 
	
	int
  sys_join(void)
  {
	  return join();
	}
  
////////

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}
