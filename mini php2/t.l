%{
#include"t.tab.h"
FILE *fp;
%}

%option yylineno
let [a-z]
dig [0-9]
del [ \t\n]
str_literal  \"([^\"\n])*\"
char_literal \'([^\"\n])*\'
%%


[Aa][Nn][Dd]	{fprintf(yyout,"AND \n"); return AND;} 
[Aa][Ss]	{fprintf(yyout,"AS \n"); return AS;}
[Dd][Oo]	{fprintf(yyout,"DO \n"); return DO;}
[Ii][Ff]	{fprintf(yyout,"IF \n"); return IF;}
[Ff][Oo][Rr]	{fprintf(yyout,"FOR\n"); return FOR;}
[Bb][Rr][Ee][Aa][Kk]	{fprintf(yyout," BREAK\n"); return BREAK;}
[Cc][Aa][Ss][Ee]	{fprintf(yyout,"CASE\n"); return CASE;} 
[Cc][Oo][Nn][Ss][Tt]	{fprintf(yyout,"CONST\n"); return CONST;}
[Ee][Cc][Hh][Oo]	{fprintf(yyout,"ECHO\n"); return echo;}
[Ee][Ll][Ss][Ee]	{fprintf(yyout,"Else\n"); return ELSE;}
[Ww][Hh][Ii][Ll][Ee]	{fprintf(yyout,"while\n"); return WHILE;}
[Tt][Hh][Ee][Nn]	{fprintf(yyout,"then\n"); return THEN;}
[Ee][Ll][Ss][Ee][Ii][Ff]	{fprintf(yyout,"elseif\n"); return ELSEIF;}
[Gg][Ll][Oo][Bb][Aa][Ll]	{fprintf(yyout,"globel\n"); return GLOBEL;} 
[Rr][Ee][Tt][Uu][Rr][Nn]	{fprintf(yyout,"return\n"); return RETURN;}
[Ff][Un][Nn][Cc][Tt][Ii][Oo][Nn]	{fprintf(yyout,"Function\n"); return FUNCTION;}

"<br>" {fprintf(yyout,"line break \n"); return BR;}
"[" {fprintf(yyout,"Pun \n"); return LOB;}
"{" {fprintf(yyout,"Pun \n"); return MOB;}
"(" {fprintf(yyout,"Pun \n"); return SOB;}
")" {fprintf(yyout,"Pun \n"); return SCB;}
"}" {fprintf(yyout,"Pun \n"); return MCB;}
"]" {fprintf(yyout,"Pun \n"); return LCB;}
"," {fprintf(yyout,"Pun \n"); return COMMA;} 
";" {fprintf(yyout,"Pun \n"); return SEMICOLON;}
"." {fprintf(yyout,"Concatinate \n"); return Concatination;}

"+" {fprintf(yyout,"plusOp \n"); return PLUS;}
"*" {fprintf(yyout,"multOp \n"); return MULTIPLY;}
"**" {fprintf(yyout,"powerO p\n"); return POWER;}
"/" {fprintf(yyout,"divOp\n"); return DIVISON;}
"-" {fprintf(yyout,"minusOp\n"); return MINUS;}
"%" {fprintf(yyout,"modOp\n"); return MOD;}
"<" {fprintf(yyout,"cLess\n"); return LT;}
"<=" {fprintf(yyout,"lesE\n"); return LE;}
">"  {fprintf(yyout,"cGreater\n"); return GT;}
">="  {fprintf(yyout,"greaterE\n"); return GE;}
"==" {fprintf(yyout,"EE\n"); return EE;}
"!=" {fprintf(yyout,"NEE\n"); return NE;}
"="   {fprintf(yyout,"Assinment OP: \n"); return EQ;} 
{del}+  {fprintf(yyout," delimeter\n");}
"<?php" {fprintf(yyout," Start of block \n"); return SB;}
"?>"	{fprintf(yyout," End of block \n"); return EB;}


{char_literal}  {fprintf(yyout,"string\n"); return CHARS;}
({str_literal}) {fprintf(yyout, "string\n"); return STRING;}
("$")({let}|"_")({let}|{dig}|"_")* {fprintf(yyout,"ID\n"); fprintf(fp,yytext); return ID;}
({let}|"_")({let}|{dig}|"_")* {fprintf(yyout,"Function Name\n"); return FunName;}
{dig}+  {fprintf(yyout,"Num\n");return NUM;}
.   {return yytext[0];}

%%


int yywrap(void)
{
return 1;
}
int main()
{
	fp= fopen("ID.txt","w");
	yyin=fopen("source.txt", "r");
    	yyout=fopen("token.txt", "w");
    	yyparse();
    	return 0;	
	printf("Enter Expression: \n");
	yyparse();
	return 0;
}
yyerror()
{
	printf("Invalid String:\n");
}
