/*
	Passar como parâmetro um número suficientemente grande para verificar a corretude do escalonador.
	Redirecionar a saída para um arquivo para melhor visualização do escalonamento.
	Exemplo de execução:
		./teste 10000 > arquivo_teste
*/

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "param.h"


int stoi(char * str_num)
{
        int k = 0;
        char * ptr = str_num;
        while(*ptr)	{
                k *= 10;
				k += *ptr-'0';
                ptr++;
        }
        return k;
}

void test(int T, int i, char * name){
		int j;
                int k;
//printf(1,"T %d \n",T);

		for(j = 0; j < 1; j++)
                {
				
				printf(1, "%s - %d tickets\n", name, i); 
                                for(k = 0; k < T; k++);
		}
		exit();
}


int main(int argc, char **argv)
{
  int PID, T;
      // T = stoi(argv[1]);
       T=190000000;

       PID = fork( N_TICKETS,1);
        if(PID == 0) {
			test(T,  N_TICKETS, "process p1" );   
		}else if(PID > 0)        {
				PID = fork( N_TICKETS, 1);
				if(PID == 0)	{
					test(T, N_TICKETS, "process p2");
				}else if(PID > 0)	{
						PID = fork( N_TICKETS, 1);
						if(PID == 0){
								test(T, N_TICKETS, "process p3");
						}        
				}
		}
exit();
		
        return 0;
}
