/* definitions, e.g., patterns, include libraries */
%{
    #include "cal.tab.h"
    extern int yylex(void);
    extern void yyerror(char *s);
%}
%%
    /* set of pattern-action rules
        RegularExpression { Action}
        (this comment must be identified)*/
[0-9]+  { 
    yylval.dval = atoi(yytext);
    printf("<NUMBER,%s>",yytext);
    return NUMBER; 
}
"-"     { printf("<MINUS>",yytext); return MINUS; }
"+"     { printf("<PLUS>",yytext); return PLUS; }
"*"     { printf("<TIMES>",yytext); return TIMES; }
"/"     { printf("<DIVIDED_BY>",yytext); return DIVIDED_BY; }
[\n]    { return '\n'; } 
[ \t]   {} // skip whitespace
.       { yyerror("Unknown lexeme"); }
%%