/* definitions, e.g., patterns, include libraries */
cons [b-df-hj-np-tv-z]
%%
    /* set of pattern-action rules
        RegularExpression { Action}
        (this comment must be identified)*/
{cons}*a{cons}*e{cons}*i{cons}*o{cons}*u{cons}* {printf("Token: <IDENTIFIER>; Lexeme:%s\n",yytext);}
. {}
%%
/* called by lex when EOF reached */
int yywrap(void) {
    /* convention is to return 1 */
    return 1;
}
int main(void) {
    /* main entry point for lex */
    yylex();
    return 0;
}