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


/*****************************************************/
/* The following support backpatching */
struct lbs /* Labels for data, if and while */
{
    int for_goto;
    int for_jmp_false;
};

struct lbs * newlblrec() /* Allocate space for the labels */
{
    return (struct lbs *) malloc(sizeof(struct lbs));
};

/****************************************************/
/* Insert identifier and check if defined already  */
void install ( char *sym_name )
{
    symrec *s;
    s = getsym (sym_name);
    if (s == 0)
    s = putsym (sym_name);
    else
    {
        errors++;
        printf( "%s is already defined\n", sym_name );
    }
}

/****************************************************/
/* If identifier defined, generate code */
void context_check( enum code_ops operation, char *sym_name )
{
    symrec *identifier;
    identifier = getsym( sym_name );
    if ( identifier == 0 )
    {
        errors++;
        printf( "%s", sym_name );
        printf( "%s\n", " is an undeclared identifier" );
    }
    else
        gen_code( operation, identifier->offset );
}

%}

/****************************************************/
/* Semantic records */
%union
{
   int intval;          /* Integers */
   char *id;            /* Identifers */
   struct lbs *lbls;    /* For backpatching */
}


/****************************************************/
/* Tokens */
%start program_declaration

%token <id> tokID
%token tokPROGRAM tokEND_PROGRAM
%token <intval> tokInteger
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


