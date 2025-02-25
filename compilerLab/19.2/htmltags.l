%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;
%}

%%

"<"[^>]*">"     { }
[^<]+           { printf("%s", yytext); } 

%%

int main() {
    FILE *myfile = fopen("index.html", "r");
    if (!myfile) {
        printf("I can't open the file!\n");
        return -1;
    }
    yyin = myfile;
    
    yylex();
    fclose(myfile);
    return 0;
}

int yywrap() {
    return 1;
}