
/***************************************************************************
/* Scanner for the IEC61131-3 ST */

%{
#include <stdio.h>
%}

/* Scanner - Letters, digits and identifier
letter [a-zA-Z]
digit [0-9]
identifier [a-zA-Z_][a-zA-Z0-9_]*
integer {digit}+

/* Scanner - Letters, digits and identifier

%%

{identifier} 		{ printf("identifier \n"); }
{integer} 		{ printf("integer \n"); }

%%




