%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;
%}

DIGIT       [0-9]
LETTER      [a-zA-Z_]
ID          {LETTER}({LETTER}|{DIGIT})*
NUMBER      {DIGIT}+(\.{DIGIT}*)?

%%

"int"|"float"|"while"|"if"|"else"  { printf("KEYWORD: %s\n", yytext); }
[(){},;]                           { printf("SEPARATOR: %s\n", yytext); }
"="|"+"|"-"|"*"|"/"|"=="|"<="|">="|"<"|">"|"++"|"--" { printf("OPERATOR: %s\n", yytext); }
{ID}                               { printf("IDENTIFIER: %s\n", yytext); }
{NUMBER}                           { printf("NUMBER: %s\n", yytext); }

[ \t\n]                            {  }
.                                  { printf("INVALID: %s\n", yytext); }

%%

int main() {
    FILE *myfile = fopen("index.txt", "r");
    if (!myfile) {
        printf("File not found!\n");
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