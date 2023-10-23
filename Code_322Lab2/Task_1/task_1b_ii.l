/* definitions, e.g., patterns, include libraries */
digit [0-9]
%%
    /* set of pattern-action rules
        RegularExpression { Action}
        (this comment must be identified)*/
{digit}+ { printf("Token: <NUMBER>; Lexeme:%s\n", yytext); }
{digit}+"."{digit}+ { printf("Token: <NUMBER>; Lexeme:%s\n", yytext); }
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
