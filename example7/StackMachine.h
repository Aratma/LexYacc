/*****************************************************************/
/* OPERATIONS: Internal Representation */

enum code_ops
{
  HALT,
  STORE, 
};

char *op_name[] =
{
   "halt", 
   "store"
};

struct instruction
{
   enum code_ops op;
   int arg;
};

/* CODE Array */
struct instruction code[999];

/* RUN-TIME Stack */
int stack[999];


/*-------------------------------------------------------------------------
Registers
-------------------------------------------------------------------------*/
int pc = 0;
struct instruction ir;
int ar = 0;
int top = 0;
char ch;


/*=========================================================================
Fetch Execute Cycle
=========================================================================*/
void fetch_execute_cycle()
{
    do
    {
        /*printf( "PC = %3d IR.arg = %8d AR = %3d Top = %3d,%8d\n",
        pc, ir.arg, ar, top, stack[top]); */

        /* Fetch */
        ir = code[pc++];

        /* Execute */
        switch (ir.op)
        {
            case HALT : printf( "halt\n" );
            break;
            default : printf("Internal Error\n" );
            break;
        }
    }
    while (ir.op != HALT);
}
