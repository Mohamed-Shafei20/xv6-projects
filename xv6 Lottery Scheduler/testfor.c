
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
