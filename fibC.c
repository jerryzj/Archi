/*EE3450 Computer Architecture Project
  103061232 Chong-yao,Zhang Jian
  Find Fibonacci number by tail recursion
*/
#include <stdio.h>
int tail_recu(int a,int b, int n);   //function to calculate fibonacci number

int main(void){
    int n;                          //record input number
    int result;                     //record result from fibo(int n)

    scanf("%d",&n);                 //read user input
    result = tail_recu(1, 0, n);    //calculate
    printf("%d\n",result );         //print

    return 0;
}

int tail_recu(int a, int b, int n){
    if (n == 0){
        return b;                   //F0 = 0
    }
    else{
        return tail_recu(a+b, a, n-1);     //call next
    }
}
