%{
	#include<stdio.h>
	#include<string.h>
	char line[100];
%}

let [a-zA-Z]
dig [0-9]
del [ \t\n]+
int_literal {dig}+
str_literal  \"([^\"\n])*\"
str2_literal \“([^\"\n])*\”
char_literal \'([^\"\n])*\'

%%

[Aa][Nn][Dd]	{fprintf(yyout,"Token KW: %s \n", yytext);} 
[Aa][Ss]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Dd][Oo]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Ii][Ff]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Ff][Oo][Rr]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Bb][Rr][Ee][Aa][Kk]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Cc][Aa][Ss][Ee]	{fprintf(yyout,"Token KW: %s \n", yytext);} 
[Cc][Oo][Nn][Ss][Tt]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Ee][Cc][Hh][Oo]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Ee][Ll][Ss][Ee]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Ww][Hh][Ii][Ll][Ee]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Tt][Hh][Ee][Nn]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Ee][Ll][Ss][Ee][Ii][Ff]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Gg][Ll][Oo][Bb][Aa][Ll]	{fprintf(yyout,"Token KW: %s \n", yytext);} 
[Rr][Ee][Tt][Uu][Rr][Nn]	{fprintf(yyout,"Token KW: %s \n", yytext);}
[Ff][Un][Nn][Cc][Tt][Ii][Oo][Nn]	{fprintf(yyout,"Token KW: %s \n", yytext);}
"="                             {fprintf(yyout,"Assinment OP: %s \n", yytext);}
"<"|"<="|">"|">="|"=="		{fprintf(yyout,"Comparison OP: %s \n", yytext);}
"*"|"**"|"+"|"/"|"-"|"%"	{fprintf(yyout,"Arthmetic OP: %s \n", yytext);}
"!=" {printf("OP: %s \n", yytext);}
"["|"{"|"("|")"|"}"|"]"|";"|","  {fprintf(yyout,"PUN: %s \n", yytext);}
     
"#"|"//" 
{del}*                  {fprintf(yyout,"Delimeter \n");}
("$")({let}|"_")({let}|{dig}|"_")*	 {fprintf(yyout,"Token ID: %s \n", yytext);}
{int_literal}           {fprintf(yyout,"Token IntLit: %s \n", yytext);}
({dig}+)"."{dig}+       {fprintf(yyout,"Token FloatLit: %s \n", yytext);}
({str_literal})+	{fprintf(yyout,"Token String_Lit: %s \n", yytext);}
({str2_literal})+	{fprintf(yyout,"Token String_Lit: %s \n", yytext);}
({char_literal})+	{fprintf(yyout,"(can be Char Or string)Token Char_Lit: %s \n", yytext);}
.                       {fprintf(yyout,"Error  \n"); return 0;}

%%

int yywrap(void){return 1;}

int main()
{ 
printf("Enter the String \n");
	yylex();
	return 0;  
  extern FILE *yyin, *yyout; 
    yyin = fopen("code.txt", "r"); 
    yyout = fopen("Output.txt", "w"); 
    yylex(); 
    return 0;	

}