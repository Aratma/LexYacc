/****************************************************/
%{
#include <string.h> 
#include "iec61131ST.tab.h" 
%}

/****************************************************/
/* Tokens */
ID [a-z][a-z0-9]*
PROGRAM "PROGRAM"
END_PROGRAM "END_PROGRAM"
ASSGNOP ":="
INTEGER [0-9]+

%%

{ID} {return (tokID); }
{PROGRAM} {return (tokPROGRAM);}
{END_PROGRAM} {return (tokEND_PROGRAM);}
{INTEGER} {return (tokInteger);}
{ASSGNOP} { return (tokASSGNOP);}
[ \t\n]+ /* skip whitespace */
. { return(yytext[0]);}

%%

int yywrap(void){}

