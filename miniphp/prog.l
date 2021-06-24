%{
#include"prog.tab.h"
%}

let [a-z]
dig [0-9]

%%

{let} {printf("ID\n"); return ID;}

{dig} {printf("NUM\n"); return NUM;}
"+" {printf("plus\n"); return '+';}
"*" {printf("mult\n"); return '*';}
\n  {printf("token NL\n"); return NL;}
.   {return yytext[0];}
"<?php" {printf("token Start of block \n"); return Sb;}
"?>"	{printf("token End of block \n"); return Eb;}
%%

int yywrap(void)
{
return 1;
}