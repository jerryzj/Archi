/*EE3450 Computer Architecture Project
  103061232 Chong-yao,Zhang Jian
  Find Fibonacci number by iteration
*/
#include <stdio.h>
int fibo(int n);              //function to calculate fibonacci number

int main (void){
    int n;                    //record input number
    int result;               //record result from fibo(int n)

    scanf("%d",&n);           //read user input
    result = fibo(n);         //calculate
    printf("%d\n",result);    //print

    return 0;
}

int fibo(int n){
    int previous = 0;                 //record Fn-2
    int current = 1;                  //record Fn-1
    int next = 1;                     //record Fn

    if(n == 0) return 0;              //return F0 = 1
    for (int i = 2; i <= n; ++i){
        next = current + previous;    //Fn = Fn-1 + Fn-2
        previous = current;           //Shift for next iteration
        current = next;               //Shift for next iteration
    }
    return next;                      //exit loop,return result 
}