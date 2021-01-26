#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "pstat.h"

int
sys_fork(void)
{
  return fork();
}

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

int
sys_mprotect(void){
  int d;
  int n = 0;
  // cprintf("done done done ") ;
  if(argint(0, &d)<0 || argint(1, &n)<0)
    return -1;
  return mprotect((void *)d,n);
}

int
sys_munprotect(void){
  int d;
  int n = 0;
  if(argint(0, &d)<0 || argint(1, &n)<0)
    return -1;
  return munprotect((void *)d,n);

}

int
sys_settickets(void) {
  int n;
  if(argint(0, &n) < 0) {      //if n is negtive return error  // argint(0, &n) pass argument from user space to kernel space ; 
    return -1;
  }
  else {
    settickets(n);                // call settickets from proc.c to assign number of tickets
  }
  return 0;
}

int
sys_getpinfo(void){
    struct pstat *d;
  if (argptr(0, (char **)&d, sizeof(struct pstat)) < 0)   // argptr() pass pstat pointer and saves the given pointer in a local (function scope) pointer variable.
      return -1;                                          // all arguments were fetched can be used by the kernel implementation
                                                          // the struct size must be postive 
  getpinfo(d);                                    
  return 0;
}
