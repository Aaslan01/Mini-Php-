%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token NUM ID NL Sb Eb
%left '+'
%left '*'

%% 
Pb	: Sb grammar Eb {printf("\n It's a valid arithmatic exp. \n"); exit(0);}
;
grammar : exp NL 
;
exp:exp '+' exp {printf("exp-> exp + exp \n");}
   |exp '*' exp {printf("exp-> exp * exp \n");}
   |NUM 	{printf("exp-> NUM \n");}
   |ID		{printf("exp-> ID \n");}
;

%%

int main()
{
	printf("Enter Arithmetic Expression: \n");
	yyparse();
	return 0;
}
yyerror()
{
	printf("\nInvalid String:\n");
}