/*
Runs several tests of the kernel threads. 
*/
#include "types.h"
#include "stat.h"
#include "user.h"

// glabal variable

int sharedVal = 0;
int numAdditions = 5;

// lock
struct turnlock lock;

void child_func()
{
  int pid = getpid();
  for (int i = 0; i < numAdditions; i++)
  {
    acquire_lock(&lock);
    printf(1, "\tthread: (%d) in iteration: %d\n", pid, i);
    sharedVal++;
    release_lock(&lock);
  }
  acquire_lock(&lock);
  printf(1, "\tthread: (%d) Finished\n", pid);
  release_lock(&lock);
  exit();
}


void test_cloned_kthread()
{
  init_lock(&lock);
  create_kthread(&child_func, (void*) 0);
  join_kthread(); 
}

void test_three_cloned_kthreads()
{
  init_lock(&lock);
 
  create_kthread(&child_func, (void*) 0);
  create_kthread(&child_func, (void*) 0);
  create_kthread(&child_func, (void*) 0);

  join_kthread();
  join_kthread();
  join_kthread();
}

int main(int argc, char *argv[]) 
{

  printf(1, "Parent: testing cloned kernel thread\n\n");
  test_cloned_kthread();
  printf(1, "\nParent: testing three cloned kernel threads\n\n");
  test_three_cloned_kthreads();
 
  printf(1, "\nParent: shared value is now %d\n", sharedVal);

  exit();
}
