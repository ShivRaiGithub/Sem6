%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;

int c = 0;
int w = 0;
int white = 0;

%}

%%

[a-zA-Z]+   { w++; c += yyleng;}

[ \t\n]+     { white++;c++; }

.   { c++; }

%%

int main() {
    FILE *myfile = fopen("input.txt", "r");
    if (!myfile) {
        printf("File not found!\n");
        return -1;
    }
    yyin = myfile;
    
    yylex();  // Start lexing (will trigger the rules above)
    
    // Print the results
    printf("Total Characters: %d\n", c);
    printf("Total Words: %d\n", w);
    printf("Total Whitespace Sequences: %d\n", white);
    
    fclose(myfile);
    return 0;
}

int yywrap() {
    return 1;
}
