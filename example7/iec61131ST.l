/****************************************************/
%{
#include <string.h> 
#include "iec61131ST.tab.h" 
%}

/****************************************************/
/* Tokens */
ID [a-z][a-z0-9]*

%%

PROGRAM  { return tokProgram; }
END_PROGRAM { return tokEndProgram;}

{ID} {return(tokID); }

[ \t\n]+ /* skip whitespace */

. { return(yytext[0]);}

%%

int yywrap(void){}

