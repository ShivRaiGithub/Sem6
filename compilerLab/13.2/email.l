%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[A-Za-z_0-9]+[@][A-Za-z_0-9]+.[A-Za-z_0-9]+.in    { printf("Valid \n");}
[A-Za-z_0-9]+[@][A-Za-z_0-9]+.com    { printf("Valid \n");}
.*            {printf("Not valid\n");}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter input: ");
    yylex();
    
    return 0;
}
