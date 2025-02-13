%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[A-Za-z_0-9]+[@][A-Za-z_0-9]+.com    { printf("Identifier valid \n");}
.*            {printf("Not valid\n");exit(1);}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter identifier: ");
    yylex();
    
    return 0;
}
