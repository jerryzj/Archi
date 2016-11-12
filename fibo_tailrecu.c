#include <stdio.h>
int tail_recu(int n,int a,int b);

int main(void){
    int n;
    int result;

    scanf("%d",&n);
    result = tail_recu(n-1, 0, 1);
    printf("The N th fibonacci number is : %d\n",result );

    return 0;
}

int tail_recu(int n, int a, int b){
    if (n == 0){
        return a;
    }
    else{
        return tail_recu(n-1, b, a+b);
    }
}
