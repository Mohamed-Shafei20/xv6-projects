# **xv6 projects**

We introduce to you three projects to the Unix version 6 operating system:

### 1. xv6 Lottery Scheduler
### 2. xv6 Virtual Memory
### 3. xv6 Kernel Threads


Let's go in some details <br/>


  ## 1. xv6 Lottery Scheduler

**Operating System XV6 (Unix version 6)**

_This is our Operating systems course project we were assigned by our lecturer to modify UNIX version 6 to get a better sense of how an operating system works, We do implement a few projects inside a real OS kernel._

**Modifications we made to the system:**

- _a lottery scheduler, The basic idea is simple: assign each running process a slice of the processor-based in proportion to the number of tickets it has; the more tickets a process has, the more it runs. Each time slice, a randomized lottery determines the winner of the lottery; that winning process is the one that runs for that time slice._

1. _Add support for tracking the number of “tickets” in a process:
      adding a system call called `settickets` which sets the number of “tickets” for a 
      process with the following prototype: `int settickets(int number).` By default, 
      processes should have 1 tickets._

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

- _`int getpinfo(struct pstat *).`This routine returns some information about all running processes, including how many times each has been chosen to run and the process ID of each. You can use this system call to build a variant of the command line program ps, which can then be called to see what is going on, you can test it by typing `tester 10 &; tester 20 &; tester 30 &; ps`as a command in the system this is a preview of the output:_
![WhatsApp Image 2021-01-23 at 1 29 36 PM (1)](https://user-images.githubusercontent.com/47748059/105577284-3538a080-5d81-11eb-876c-e4fb88cc2415.jpeg)
![WhatsApp Image 2021-01-23 at 1 29 36 PM](https://user-images.githubusercontent.com/47748059/105577286-38cc2780-5d81-11eb-9c06-101cb313c535.jpeg)

 ## 2. xv6 Virtual Memory


 ## 3. xv6 Kernel Threads



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

