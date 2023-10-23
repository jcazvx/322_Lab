/* definitions, e.g., patterns, include libraries */
%{
    #include "cal.tab.h”
    extern void yyerror(char *s); 
%}
%%
[0-9]+  { printf("<NUMBER,%s>",yytext);
          return NUMBER;}
[-]     { printf("<MINUS>"); return MINUS;}
[+]     { printf("<PLUS>"); return PLUS;}
[\n]    { return *yytext;} //to know an end
[ \t]   {} //skip whitespace
.       { printf("<UNKOWN-TOKEN,%s> ",yytext);
          yyerror("Unknown lexeme"); }
%%
