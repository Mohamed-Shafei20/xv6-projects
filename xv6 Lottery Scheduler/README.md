- _**Here are the code modified in xv6:**_
- _First, Support the process in `proc.h` with tickets & tickes properties_
```
struct proc {
  uint sz;                     // Size of process memory (bytes)
  pde_t* pgdir;                // Page table
  char *kstack;                // Bottom of kernel stack for this process
  void *threadstack;            // Address of thread stack to be freed
  enum procstate state;        // Process state
  int pid;                     // Process ID
  struct proc *parent;         // Parent process
  struct trapframe *tf;        // Trap frame for current syscall
  struct context *context;     // swtch() here to run process
  void *chan;                  // If non-zero, sleeping on chan
  int killed;                  // If non-zero, have been killed
  struct file *ofile[NOFILE];  // Open files
  struct inode *cwd;           // Current directory
  char name[16];               // Process name (debugging)

  int tickets;//updated
  int ticks;//updated
};
```
1. _**Intialize each new process with at leaset _1 tickets & 0 tickes**_
```
 static struct proc*
allocproc(void)
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;

  p->tickets = 1;    //updated
  p->ticks = 0;  // updated

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
```

2. _**Get total number of tickets for runnable processes**_
```
int
getrpt(void){   // get total number of tickets for runnable processes
  struct proc *p;   // Per-process state
  int total_process_tickets=0;
//loop over process table and increment total tickets by runnable process tickets 
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)  //You have access to the entire xv6 source presumably, which means that you can add a function in proc.c
  {						      //to iterate over this ptable and access the table to loop through and find running processes	
    if(p->state==RUNNABLE){
      total_process_tickets+=p->tickets;  
    }
  }
  return total_process_tickets;          
}

```
3. **_Modify scheduler to support random tickets_**
```
void
scheduler(void)
{
  struct proc *p;
  struct cpu *c = mycpu();  // Per-CPU state
 
  c->proc = 0;
  
  for(;;){
    // Enable interrupts on this processor.
    sti();
    
	  // define 2 vars one for total count of runnable process till reach the winner one , second to hold random nubmer ( winner ticket )
	   long count = 0;
  	   long win = 0;

    // for concurrency issues
    acquire(&ptable.lock);                 
    win = random_at_most(getrpt());       //You will need to add a psuedorandom number generator to the kernel to get a random number between 1 and total_tickets
                                          // xv6 does not support floating point, so you will need to do your random selection without floats or doubles.

//When there are no runnable processes, your schduler should release the process table lock to give interrupts (like for keypresses) a chance to make programs    runnable, then reacquire that lock and iterate through the process table again.
   
// Loop over process table looking for process to run.
 for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
     
	 if(p->state == RUNNABLE)  count += p->tickets;  // sum of tickets of runnable process
	 else continue;  // check next process
         
        if (count > win){   //  It is the chosen process job  / release ptable.lock / then reacquire it before jumping back to us.
             c->proc = p;
             switchuvm(p);     //The OS loads the process information to run it. After having loaded the process  
             p->state = RUNNING; // The process is marked running
             p->ticks++;   // increase no of times that processes has been chosen
             swtch(&(c->scheduler), p->context);   // the processor switches to execute it
             switchkvm();     //  When the process comes back to scheduler (so after the swtch) the kernel load its memory
             
	}
	 else continue;  // check next process
    }
    release(&ptable.lock);
  }
}
```
4. **_Support set tickets to the process_**
```
int 
settickets(int tickets){

  struct proc *proc = myproc(); //Disable interrupts so that we are not rescheduled; while reading proc from the cpu structure
  if(tickets<0)
       return -1;
  acquire(&ptable.lock);
  ptable.proc[proc-ptable.proc].tickets = tickets;
  release(&ptable.lock);
 
  return 0;
}
```
**_Added the provided file `pstate.h`_** 
```
#ifndef _PSTAT_H_
#define _PSTAT_H_

#include "param.h"

struct pstat {
  int inuse[NPROC];   // whether this slot of the process table is in use (1 or 0)
  int tickets[NPROC]; // the number of tickets this process has
  int pid[NPROC];     // the PID of each process 
  int ticks[NPROC];   // the number of ticks each process has accumulated 
   
};

#endif // _PSTAT_H_
```
2. **Add System call--getpinfo(struct pstate)**
```
int
getpinfo(struct pstat* ps) {
  int i = 0;
  struct proc *p;
  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
    ps->pid[i] = p->pid;
    if(p->state!= UNUSED)ps->inuse[i] = p->state ;
    ps->tickets[i] = p->tickets;
    ps->ticks[i] = p->ticks;
     
    i++;
  }
  release(&ptable.lock);
  return 0;
}
```

- Modify `fork()` to make child processes support tickets
```
int
fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->tickets = curproc->tickets; // updated 
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}
```

- **Finally we have 3 test files:**

1. _**`tester.c` to test `settickets(int n)`**_
```
#include "types.h"
#include "user.h"
#include "date.h"
int main(int argc, char* argv[]){
    int tickets_number =  atoi(argv[1]);
    settickets(tickets_number);
    while (1); 
    exit();
    return 0; 
}
```
2. _**`ps.c` to test `getpinfo(struct pstat)`**_
```
#include "types.h"
#include "user.h"
#include "pstat.h"
int main(int argc, char* argv[]){
  struct pstat ps;  
    getpinfo(&ps);
    printf(1, "\nPID\tUSED?\tTICKETS\t\tTICKS\n");
    for (int i = 0; i < NPROC ; i++)
    { 
        // selcet used processes and print their information from pstat struct
      if(ps.pid[i] && ps.tickets[i]>0)
        printf(1, "%d\t%d\t%d\t\t%d\n", ps.pid[i], ps.inuse[i], ps.tickets[i], ps.ticks[i]);
    }
  exit();
  return 0;
}
```
3. _**`testfor.c` to test `fork()`**_
```
#include "types.h"
#include "user.h"
#include "date.h"
int main(int argc, char* argv[]){
    
    settickets(atoi(argv[1]));
    int f = fork();
    if(f == 0){
        printf(1,"\n process is forking. \n");
        
    }else if(f < 0){
        printf(1,"\n process is fail in forking.\n");
        exit();
    }
    while (1);
    exit();
    return 0;
}
```

You can use this system call to build a variant of the command line program ps, which can then be called to see what is going on, you can test it by typing `tester 10 &; tester 20 &; tester 30 &; ps`as a command in the system this is a preview of the output:
![WhatsApp Image 2021-01-23 at 1 29 36 PM (1)](https://user-images.githubusercontent.com/47748059/105577284-3538a080-5d81-11eb-876c-e4fb88cc2415.jpeg)
![WhatsApp Image 2021-01-23 at 1 29 36 PM](https://user-images.githubusercontent.com/47748059/105577286-38cc2780-5d81-11eb-9c06-101cb313c535.jpeg)
![WhatsApp Image 2021-01-26 at 4 38 36 PM](https://user-images.githubusercontent.com/47748059/105862894-f90f7500-5ff8-11eb-8af4-182b2c8ff642.jpeg)
