#include "types.h"
#include "user.h"
#include "pstat.h"
int main(int argc, char* argv[]){
  struct pstat ps;
     
    
  
    getpinfo(&ps);
    printf(1, "%d running processes\n", NPROC);
    printf(1, "\nPID\tUSED?\tTICKETS\t\tTICKS\n");
    for (int i = 0; i < NPROC ; i++)
    {
     
// selcet used processes and print their information from pstat struct
      if(ps.pid[i] && ps.tickets[i]>0)
        printf(1, "%d\t%d\t%d\t\t%d\n",ps.pid[i], ps.inuse[i], ps.tickets[i], ps.ticks[i]);
    }

    
  
  exit();
  return 0;
}

























