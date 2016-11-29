/*EE3450 Computer Architecture Project
  103061232 Chong-yao,Zhang Jian
  Find Fibonacci number by recursion
*/
#include <stdio.h>
int fibo(int n);                //function to calculate fibonacci number

int main (void){
    int n;                      //record input number
    int result;                 //record result from fibo(int n)

    scanf("%d",&n);             //read user input
    result = fibo(n);           //calculate
    printf("%d\n",result);      //print

    return 0;
}

int fibo(int n){
    int result;                 //record answer

    if(n < 2){                  //return F0=0, F1=1
        return n;
    }
    else{
        result = fibo(n-1) + fibo(n-2);      //Fn = Fn-1 + Fn-2
    }
    return result;
}
