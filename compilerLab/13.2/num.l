%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
^[0-9]+ {
    printf("INTEGER\n");
}

^[0-9]*\.[0-9]+ {
    printf("FLOAT\n");
}

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
