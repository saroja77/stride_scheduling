#include "types.h"
#include "stat.h"
#include "user.h"
int main(void)
{
   int i;
   hello(5);
   int PID;

       PID = fork(1000,1);
        if(PID == 0) 
                {
			for(i=0;i<100000000;i++); 
		}
   exit();
    return 0;
}
