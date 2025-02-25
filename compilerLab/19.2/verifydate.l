%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function to check if a year is a leap year */
int is_leap_year(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

/* Function to check if a date is valid */
int is_valid_date(int day, int month, int year) {
    /* Check year bounds (assuming reasonable range) */
    if (year < 1 || year > 9999)
        return 0;
    
    /* Check month bounds */
    if (month < 1 || month > 12)
        return 0;
    
    /* Check day bounds based on month */
    int max_days = 31; /* Default for months with 31 days */
    
    if (month == 4 || month == 6 || month == 9 || month == 11)
        max_days = 30;
    else if (month == 2) { /* February */
        if (is_leap_year(year))
            max_days = 29;
        else
            max_days = 28;
    }
    
    if (day < 1 || day > max_days)
        return 0;
    
    return 1; /* Date is valid */
}
%}

%option noyywrap

%%

[0-9]{2}"-"[0-9]{2}"-"[0-9]{4} {
    /* Extract day, month, year from the matched string */
    int day, month, year;
    sscanf(yytext, "%d-%d-%d", &day, &month, &year);
    
    if (is_valid_date(day, month, year))
        printf("Valid date: %s\n", yytext);
    else
        printf("Invalid date: %s\n", yytext);
}


.           { printf("Invalid character: %s\n", yytext); }

%%


int main() {
    printf("Enter dates in DD-MM-YYYY format (Ctrl+D to end):\n");
    yylex();
    return 0;
}