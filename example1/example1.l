%{
#include <stdio.h>
%}

%%
stop printf("stop command received \n");
start printf("start commnad received \n");
[0-9]+ printf("number received \n");
[a-zA-Z][a-zA-Z0-9]* printf("word received \n");
%%
