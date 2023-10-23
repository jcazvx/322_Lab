/* definitions, e.g., patterns, include libraries */
%%
    /* set of pattern-action rules
        RegularExpression { Action}
        (this comment must be identified)*/
[0-9]+  {printf("<NUMBER,%s>",yytext);}
[-]     {printf("<MINUS>",yytext); }
[+]     {printf("<PLUS>",yytext); }
[ \t\n] {}
.       {printf("<UNKOWN-TOKEN,%s>",yytext); }
%%
/* called by lex when EOF reached */
int yywrap (void) {
    /* convention is to return 1 */
    return 1;
}

int main (void) {
    /* main entry point for lex */
    yylex();
    return 0;
}
