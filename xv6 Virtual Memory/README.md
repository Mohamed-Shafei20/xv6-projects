# Null pointer dereference</br>
The main problem here is that in xv6, the VM system uses a simple two-level page table as discussed in class. As it currently is structured, user code is loaded into the very first part of the address space. Thus, if you dereference a null pointer, you will not see an exception (as you might expect); rather, you will see whatever code is the first bit of code in the program that is running. So the solution is to shift the paging by one page so when a program is been loaded in the memory, it loaded into the memory from the second page not from the address zero , when null pointer is defined it will try to access an invalid address so the program will trap and get error and then the process will be killed .
</br>
### The change to do this paging shift : </br>
• To force the program to be loaded into the memory from the second page we change in Makefile </br>
```ruby
#### $ (LD) $ (LDFLAGS) −N −e main −Ttext 0 x1000 −o $@ $ </br>
```
• Then we change the exec.c which have the variable SZ which indicates the beginning of the program memory so we need to change this variable to 4096(PGSIZE) to make the program to be loaded from the second page </br>
```ruby
Load program into memory.
sz = PGSIZE;
for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
     if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
```
• And to make the same changes when a fork occurs we need to make changes in vm.c to the function copyuvm() to make the child process copy the address space of the parent process from the second page</br>
```ruby
// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = PGSIZE; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
      kfree(mem);
      goto bad;
    }
  }
  return d;

bad:
  freevm(d);
  return 0;
}
```
## test code
```ruby
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   int ppid = getpid();

   if (fork() == 0) {
      uint * nullp = (uint*)0;
      printf(1, "null dereference: ");
      printf(1, "%x %x\n", nullp, *nullp);
      // this process should be killed
      printf(1, "TEST FAILED\n");
      kill(ppid);
      exit();
   } else {
      wait();
   }

   printf(1, "TEST PASSED\n");
   exit();
}
```
it is all about trying to access null pointer (trying to access the page number zero of the program)</br> 
but because we make the program address space begins from the second page</br> 
then it will not find the page and then it will trap (page fault)</br> 
but because it is not exsit it will cause an error</br>
___________________________________________________________________________________________________________________________________________
# Read only code</br> 
The main problem here is that in xv6 code is marked as readable and writeable so any program can overwrite its code</br>
so we need to change the protection bits of some pages of the page table to make it read only and we should return it back to its original state To do this we need to make two system calls : 1) First one is int mprotect (void *addr, int len) to change the protection bits of the pages from that addr up to that addr plus that len to be read only
2) Second one is int munprotect (void *addr, int len) to change the protection bits of the pages from that addr up to that addr plus that len to be readable and writeable
</br>
#### To make these two system calls we need some definitions in some files</br>
#### but the main files is vm.c we need to add the two main functions in it</br>
```ruby
//mprotect system call makes page table entries only readable, non-writable
int
mprotect(void *addr, int len){
  struct proc *curproc = myproc();
  
  // cprintf("\ncurrent : 0x%p\n", curproc);

  //Check if addr points to a region that is not currently a part of the address space
  if(len <= 0 || (int)addr+len*PGSIZE>curproc->sz){
    cprintf("\nwrong len\n");
    return -1;
  }

  //Check if addr is not page aligned
  if((int)(((int) addr) % PGSIZE )  != 0){
    cprintf("\nwrong addr %p\n", addr);
    return -1;
  }  
  //loop for each page
  pte_t *pte;
  int i;

  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
    // Getting the address of the PTE in the current process's page table (pgdir)
    // that corresponds to virtual address (i)
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
      *pte = (*pte) & (~PTE_W) ; //Clearing the write bit 
      cprintf("\nPTE : 0x%p\n", pte);
    } else {
      cprintf("\n error happend");
      return -1;
    }
  }
  //Reloading the Control register 3 with the address of page directory 
  //to flush TLB
  lcr3(V2P(curproc->pgdir));  
return 0;
}
```
####  _________________________________________________________
```ruby
//mprotect system call makes page table entries both readable and writable
int
munprotect(void *addr, int len){
  struct proc *curproc = myproc();

  //Check if addr points to a region that is not currently a part of the address space
  if(len <= 0 || (int)addr+len*PGSIZE>curproc->sz){
    cprintf("\nwrong len\n");
    return -1;
  }

  //Check if addr is not page aligned
  if((int)(((int) addr) % PGSIZE )  != 0){
    cprintf("\nwrong addr %p\n", addr);
    return -1;
  }

  //loop for each page
  pte_t *pte;
  int i;
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
    // Getting the address of the PTE in the current process's page table (pgdir)
    // that corresponds to virtual address (i)
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
      *pte = (*pte) | (PTE_W) ; //Setting the write bit 
      cprintf("\nPTE : 0x%p\n", pte);
    } else {
      return -1;
    }
  }
  //Reloading the Control register 3 with the address of page directory 
  //to flush TLB
  lcr3(V2P(curproc->pgdir));
  
  return 0;
}
```
## The explanation of these functions:</br>
• first we create a pointer to point to the current process (curproc)</br>
• then check if the length of pages we want to change its protection bits is less than zero or if there is some address we want to access but it is greater than the size of the whole process the call will return -1 indecating that there is some error</br>
• then we check if the address beginning is not a page beginning then again the call will return -1 indecating that there is an error</br>
• then we make a poniter to point to the virtual address of the page we want to chnage its protection bits then we loop for all pages in the addresses we want to change its protection bits and use the function walkpgdir() to look at the virtual address of the page number i and find where it should be mapped to according to page table of the current process and return the virtual address of the index 0 of that page and make the pointer pte points to it .</br>
• and for each page of these addresses we check if the pte is not zero because if the function walkpgdir failed it will return zero so if the pte is zero then the call will return -1 indecating that there is an error and check if this address is available in user space if it is not then the call will return -1 indecating that there is an error .</br>
• and then check if it is valid if not then the call will return -1 indecating that there is an error after that we change the protection bits in mprotect .we make *pte = (*pte) & (~PTE_W); • to negate the PTE_W (the writeable bit) which is defined to be 2 so we get 1111 1111 1111 1101 then we make bitwise and between this address and this value then the address will be the same but its protection bit will be zero so this address will be read only</br> 
• in munprotect () we make *pte = (*pte) | (PTE_W); </br>
• we make bitwise or between this address and the value of PTE_W 0000 0000 0000 0010 then the address will be the same but its protection bit will be one so this address will be readable and writeable at the end we want to make the hardware know about these changes so we use the function lcr3() and pass the pysical address of the of the page dirctory of the current process and to convert it we use the function V2P();</br>
• then return 0 indecating that the call is done successfully</br>
## test code
```ruby
#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"
int
main(int argc, char *argv[])
{
  
  char *start = sbrk(0);
  sbrk(PGSIZE);
  *start=100;
  mprotect(start, 1) ;
  int child=fork();
  if(child==0){
	printf(1, "protected value = %d\n",*start); 
        munprotect(start, 1) ;  
        *start=5;
        printf(1, "After unprotecting the value became = %d\n",*start); 
        exit();
  }
  else if(child>0){
        wait();
        printf(1, "\nWatch this,I'll trap now\n"); 
        *start=5; 
        printf(1, "\nThis statement will not be printed\n");
        exit(); 
  } 
 exit();
}
``` 
here it is all about trying to access the code segment </br>
we will access a pointer which point to some location in the code segment</br>
we write down 100 on it</br>
then we call the mprotect system call</br>
then we make a fork </br>
and the parent will wait until the child process ends</br>
and in the child process we will call munprotect</br>
and try to access this pointer again writing down 5 on it</br>
then the parent process will begin</br>
but we do not make munprotect in it</br>
then we try to access this pointer again</br>
but because it is read only segment now </br>
so it will trap and exit</br>
