%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;
%}

%%

"<"[^>]*">"     { /* Do nothing, removes tags */ }
[^<]+           { printf("%s", yytext); } /* Print everything else */

%%

int main() {
    // open a file handle to a particular file:
    FILE *myfile = fopen("index.html", "r");
    // make sure it's valid:
    if (!myfile) {
        printf("I can't open the file!\n");
        return -1;
    }
    // set lex to read from it instead of defaulting to STDIN:
    yyin = myfile;
    
    // lex through the input:
    yylex();
    fclose(myfile);
    return 0;
}

int yywrap() {
    return 1;
}