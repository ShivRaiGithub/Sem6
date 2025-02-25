%{
    #include <stdio.h>
    extern FILE *yyin;
%}

%x MULTI_COMMENT

%%

"//".*            {}

"/*"              { BEGIN(MULTI_COMMENT); }  /* Enter multi-line comment mode */
<MULTI_COMMENT>"*/"  { BEGIN(INITIAL); }  /* Exit multi-line comment mode */
<MULTI_COMMENT>.|\n  {}  /* Ignore everything inside multi-line comments */

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
