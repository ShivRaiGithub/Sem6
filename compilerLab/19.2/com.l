%{
    #include <stdio.h>
    extern FILE *yyin;
%}


%%

"//".*            {}

"/"\*([^*]|\*+[^*/])*\*+"/" {}

.|\n              { printf("%s", yytext); } /* Print everything else */

%%

int yywrap() {
    return 1;
}

int main() {
    FILE *myfile = fopen("my.c", "r");
    if (!myfile) {
        printf("I can't open the file!\n");
        return -1;
    }
    yyin = myfile;
    yylex();
    fclose(myfile);
    return 0;
}
