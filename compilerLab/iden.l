%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]   {printf("Not valid\n");exit(1);}
[A-Za-z_][A-Za-z_0-9]*    { printf("Identifier valid \n"); }
.            { /* Ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter identifier: ");
    yylex();
    return 0;
}
