#include <stdio.h>
int fibo(int n);

int main (void){
    int n;
    int result;

    scanf("%d",&n);
    result = fibo(n);
    printf("The N th fibonacci number is : %d\n",result );

    return 0;
}

int fibo(int n){
    if(n == 0){
        return 1;
    }
    else{
        return n * fibo(n-1);
    }
}
