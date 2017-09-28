/****************************************************/
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "StackMachine.h"
#include "SymbolTable.h"
#include "CodeGen.h"

#define YYDEBUG 1 	

int errors; 		
%}

/****************************************************/
/* Tokens */
%start program_declaration
%token tokID tokPROGRAM tokEND_PROGRAM tokInteger
%token tokASSGNOP

/****************************************************/
/* Operator precedendence */
%left '-' '+'
%left '*' '/' 

/****************************************************/
/* Grammar */
%%

program_type_name : tokID
variable_name : tokID

program_declaration :
tokPROGRAM program_type_name
assignment_statement
tokEND_PROGRAM

assignment_statement :
variable_name tokASSGNOP tokInteger ';'

%%

/****************************************************/
main( int argc, char *argv[] )
{ 
   extern FILE *yyin;
   ++argv; 
   --argc;
   yyin = fopen( argv[0], "r" );

   yydebug = 1;
   errors = 0;
   yyparse ();
   printf ( "Parse Completed\n" );
   
   if ( errors == 0 )
   { 
      print_code ();
      fetch_execute_cycle();
   }
}

/****************************************************/
yyerror ( char *s ) 
{
   errors++;
   printf ("%s\n", s);
}


