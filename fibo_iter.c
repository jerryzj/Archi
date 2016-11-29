#include <stdio.h>
int fibo(int n);

int main (void){
    int n;
    int result;

    scanf("%d",&n);
    result = fibo(n);
    printf("%d\n",result );

    return 0;
}

int fibo(int n){
    int previous = 0;
    int current = 1;
    int next = 1;


    if(n == 0) return 0;
    for (int i = 1; i <= n; ++i)
    {
        next = current + previous;
        previous = current;
        current = next;
    }
    return next;
}
