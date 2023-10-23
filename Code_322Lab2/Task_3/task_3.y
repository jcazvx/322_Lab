/* definitions, e.g., included libraries, variables, tokens... */
%{
    #include <stdio.h>
    void yyerror(char *);
    int yylex(void);
%}
    /* set of pattern-action rules
        RegularExpression { Action}
        (this comment must be identified)*/
%union {
    double dval;
}
%token <dval> NUMBER
%token PLUS MINUS TIMES DIVIDED_BY
%%
program:
    program expr '\n' { printf("Result: %.2lf\n", $2); }
    |
    ;
expr:
    NUMBER { $$ = $1; }
    | expr PLUS expr { $$ = $1 + $3; }
    | expr MINUS expr { $$ = $1 - $3; }
    | expr TIMES expr { $$ = $1 * $3; }
    | expr DIVIDED_BY expr { 
        if ($3 == 0) {
            yyerror("Division by zero");
            $$ = 0.0;
        } else {
            $$ = $1 / $3;
        }
    }
    ;
%%
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}
int main(void) {
    yyparse();
    return 0;
}