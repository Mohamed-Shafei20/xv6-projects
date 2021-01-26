# **xv6 projects**

We introduce to you three projects to the Unix version 6 operating system:

### 1. xv6 Lottery Scheduler
### 2. xv6 Virtual Memory
### 3. xv6 Kernel Threads


Let's go in some details <br/>


  ## 1. xv6 Lottery Scheduler

**Operating System XV6 (Unix version 6)**

This is our Operating systems course project we were assigned by our lecturer to modify UNIX version 6 to get a better sense of how an operating system works, We do implement a few projects inside a real OS kernel.

**Modifications we made to the system:**

- a lottery scheduler, The basic idea is simple: assign each running process a slice of the processor-based in proportion to the number of tickets it has; the more tickets a process has, the more it runs. Each time slice, a randomized lottery determines the winner of the lottery; that winning process is the one that runs for that time slice.

1. Add support for tracking the number of “tickets” in a process:
      adding a system call called `settickets` which sets the number of “tickets” for a 
      process with the following prototype: `int settickets(int number).` By default, 
      processes should have 1 tickets.

2. Add a system call called `getpinfo `with the following prototype 
  `int getpinfo (struct pstat *);` where pstate defined as:
   `struct pstate {
        int num_processes;
        int pids[NPROC];       
        int ticks[NPROC];      
        int tickets[NPROC];   
    }; `

- setting `num_processes `to the total number of non-UNUSED processes in the process table
- for each i from 0 to num_processes, setting:
  `pids[i]` to the pid of ith non-UNUSED process in the process table;
  `ticks[i]` to the number of times this proces has been scheduled since it was created;
  `tickets[i]` to the number of tickets assigned to each process.

- Add support for a lottery scheduler to xv6, by:
  changing the scheduler in `proc.c` to use the number of tickets to randomly 
  choose a process to run based on the number of tickets it is assigned;

- `int getpinfo(struct pstat *).`This routine returns some information about all running processes, including how many times each has been chosen to run and the process ID of each.

 ## 2. xv6 Virtual Memory
 
Null pointer dereference
 	The main problem here is that in xv6, the VM system uses a simple two-level page table as discussed in class. As it currently is structured, user code is loaded into the very first part of the address space. Thus, if you dereference a null pointer, you will not see an exception (as you might expect); rather, you will see whatever code is the first bit of code in the program that is running.
	So the solution is to shift the paging by one page so when a program is been loaded in the memory, it loaded into the memory from the second page not from the address zero , when null pointer is defined it will try to access an invalid address so the program will trap and get error and then the process will be killed .
	
The change to do this paging shift :
    • To force the program to be loaded into the memory from the second page we change in Makefile
	 138 $ (LD) $ (LDFLAGS) −N −e main −Ttext 0 x1000 −o $@ $
    • Then we change the exec.c which have the variable SZ which indicates the beginning of the 
      program memory so we need to change this variable to 4096 to make the program to be loaded 
      from the second page
    • And to make the same changes when a fork occurs we need to make changes in vm.c to the 
      function copyuvm() to make the child process copy the address space of the parent process from 
      the second page
      




Read only code
	The main problem here is that in xv6 code is marked as readable and writeable so any program can overwrite its code so we need to change the protection bits of some pages of the page table to make it read only and we should to return it back to its original state
To do this we need to make two system calls : 
    1) First one is int mprotect (void *addr, int len) to change the protection bits of the pages from that 
       addr up to that addr plus that len to be read only    
    2) Second one is int munprotect (void *addr, int len) to change the protection bits of the pages 
       from that addr up to that addr plus that len to be readable and writeable
       
 To make these two system calls we need some definitions in some files but the main files is vm.c we need to add the two main functions in it 

The explanation of these functions:
    • first we create a pointer to point to the current process (curproc)  
    •  then check if the length of pages we want to change its protection bits is less than zero or if 
      there is some address we want to access but it is greater than the size of the whole process the 
      call will return -1 indecating that there is some error    
    • then we check if the address beginning is not a page beginning then again the call will return -1 
      indecating that there is an error  
    • then we make a poniter to point to the virtual address of the page we want to chnage its 
      protection bits then we loop for all pages in the addresses we want to change its protection bits 
      and use the function walkpgdir() to look at the virtual address of the page number i and find 
      where it should be mapped to according to page table of the current process and return the 
      virtual address of the index 0 of that page and make the pointer pte points to it .   
    • and for each page of these addresses we check if the pte is not zero because if the function 
      walkpgdir failed it will return zero so if the pte is zero then the call will return -1 indecating that 
      there is an error and check if this address is available in user space if it is not then the call will 
      return -1 indecating that there is an error .   
    • and then check if it is valid if not then the call will return -1 indecating that there is an error 
      after that we change the protection bits  in mprotect .we make
      	 *pte = (*pte) & (~PTE_W); 
    • to negate the PTE_W (the writeable bit) which is defined to be 2 so we get 1111 1111 1111 
      1101 then we make bitwise and between this address and this value then the address will be the 
      same but its protection bit will be zero  so this address will be read only 
    • in munprotect () we make
      	 *pte = (*pte) | (PTE_W); 
    • we make bitwise or between this address and the value of PTE_W 0000 0000 0000 0010 then 
      the address will be the same but its protection bit will be one  so this address will be readable 
      and writeable at the end we want to make the hardware know about these changes so we use the 
      function lcr3() and pass the pysical address of the of the page dirctory of the current process and 
      to convert it we use the function V2P();   
    • then return 0 indecating that the call is done successfully
 
 


 ## 3. xv6 Kernel Threads
### Project requirements:
In this project, you'll be adding kernel threads support to xv6, to achieve this we must do the following implementations:

**1-** Implement `clone()` system call should look like this: `int clone(void(*fcn)(void *), void *arg, void *stack)` to create a new kernel thread which shares the calling process's address space, the new thread also uses stack as its parent stack. The stack should be one page in size and page-aligned. The new thread starts executing at the address specified by fcn. As with fork(). It It returns the thread PID to the parent and 0 to the child (if successful), -1 otherwise.

**2-** Implement join() system call should look like this: `int join(void **stack)` to wait for a child thread that shares the address space with the calling process to exit then kill it.

**3-** Implement a simple turn lock to support multi-threaded programs. There should be a type turnlock that one used to declare a lock, and three routines: `void init_lock(turnlock *)`, `void acquire_lock(turnlock *tlock)`, and `void release_lock(turnlock *tlock)` which initialize, acquire and release the lock. The turn lock should use the xchg atomic add to avoid concurrency bugs.

**4-** Build a little thread library to be on top of these raw system calls, with a create_thread(), join_thread(), init_lock(), acquire_lock(), and release_lock() functions to provide abstraction to user. 

## Resources


**Tools**


**Resources**



## **Team Members**

Implementations of xv6 Lottery Scheduler by:
- [Muhammad Salah](https://github.com/MohamedSalahApdElzaher)
- [Mohamed Abd-El-Nasser](https://github.com/Mohamed-Abd-El-Nasser)

Implementations of xv6 Virtual Memory by:
- [Muhammad Adel Sharkawy](https://github.com/mohamed-el-sharkawy)
- [Youseef Magdy](https://github.com/youssefmagdy1)

Implementations of xv6 Kernel Threads by:
- [Muhammad Mohie](https://github.com/muhammadmohie98)

