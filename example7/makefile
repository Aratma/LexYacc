all: iec61131ST

iec61131ST: iec61131ST.output
	 gcc -o iec61131ST iec61131ST.tab.o lex.yy.o -lm
 
iec61131ST.output: iec61131ST.y iec61131ST.l
	bison -dv iec61131ST.y
	gcc -c iec61131ST.tab.c
	flex iec61131ST.l
	gcc -c lex.yy.c
     
clean:
	 rm iec61131ST iec61131ST.output iec61131ST.tab.c iec61131ST.tab.o iec61131ST.tab.h lex.yy.c lex.yy.o 
