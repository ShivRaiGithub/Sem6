%{
    #include <stdio.h>

    int ca = 0;  
    int cb = 0;  
    int valid = 1;
%}

%%

a           { ca++; }
b           { cb++; }
[^ab\n]     { valid = 0;  }
\n {return 0;}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter input: ");
    yylex(); 

    if (!valid) {
        printf("Invalid input");
    } else if (ca % 2 == 0 && cb % 2 == 0) {
        printf("Accepted\n");
    } else {
        printf("Rejected\n");
    }

    return 0;
}