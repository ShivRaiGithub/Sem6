%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]*   { printf("Int \n");}
[.0-9]*          {printf("Float\n");exit(1);}
.*           {printf("NaN\n");exit(1);}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter input: ");
    yylex();
    
    return 0;
}
