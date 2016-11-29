/*EE3450 Computer Architecture Project
  103061232 Chong-yao,Zhang Jian
  Find Fibonacci number by tail recursion
*/
#include <stdio.h>
int tail_recu(int n,int a,int b);   //function to calculate fibonacci number

int main(void){
    int n;                          //record input number
    int result;                     //record result from fibo(int n)

    scanf("%d",&n);                 //read user input
    result = tail_recu(n, 0, 1);    //calculate
    printf("%d\n",result );         //print

    return 0;
}

int tail_recu(int n, int a, int b){
    if (n == 0) {return a;}         
    if (n == 1) {return b;}
    else{
        return tail_recu(n-1, b, a+b);
    }
}
