%{
#include<stdio.h>
FILE *yyin;
FILE *out;

%}
del [ \t\n]
let [a-zA-Z]
digit [0-9]



%%
{del}+ {}
"if" {fprintf(out,"<KW,%s>\n",yytext); }
"cout" {fprintf(out,"<KW,%s>\n",yytext); }
"main" {fprintf(out,"<KW,%s>\n",yytext); }
"while" {fprintf(out,"<KW,%s>\n",yytext); }
"for" {fprintf(out,"<KW,%s>\n",yytext); }
"break" {fprintf(out,"<KW,%s>\n",yytext); }
"switch" {fprintf(out,"<KW,%s>\n",yytext); }
"case" {fprintf(out,"<KW,%s>\n",yytext); }
"int"  {fprintf(out,"<>DATATYP,%s>\n",yytext); }
"float"  {fprintf(out,"<>DATATYP,%s>\n",yytext); }
"double"  {fprintf(out,"<>DATATYP,%s>\n",yytext); }
"char"  {fprintf(out,"<>DATATYP,%s>\n",yytext); }
"(" {fprintf(out,"<PUN,%s>\n",yytext); }
"{" {fprintf(out,"<PUN,%s>\n",yytext); }
"[" {fprintf(out,"<PUN,%s>\n",yytext); }
"]" {fprintf(out,"<PUN,%s>\n",yytext); }
"}" {fprintf(out,"<PUN,%s>\n",yytext); }
")" {fprintf(out,"<PUN,%s>\n",yytext); }
";" {fprintf(out,"<PUN,%s>\n",yytext); }
"<" {fprintf(out,"<OP,%s>\n",yytext); }
">" {fprintf(out,"<OP,%s>\n",yytext); }
"<=" {fprintf(out,"<OP,%s>\n",yytext); }
"==" {fprintf(out,"<OP,%s>\n",yytext); }
"=" {fprintf(out,"<OP,%s>\n",yytext); }
"*" {fprintf(out,"<OP,%s>\n",yytext); }
"++" {fprintf(out,"<OP,%s>\n",yytext); }
"+" {fprintf(out,"<OP,%s>\n",yytext); }
"/" {fprintf(out,"<OP,%s>\n",yytext); }
"!" {fprintf(out,"<OP,%s>\n",yytext); }
"&" {fprintf(out,"<OP,%s>\n",yytext); }
"--" {fprintf(out,"<OP,%s>\n",yytext); }
"-" {fprintf(out,"<OP,%s>\n",yytext); }
\"(\\.|[^\\"])*\" {fprintf(out,"<STR,%s>\n",yytext); }
\'(\\.|[^\\'])\' {fprintf(out,"<CHAR,%s>\n",yytext); }
"//"(\.|[^\n])*\n {fprintf(out,"<SL COMM,%s>\n",yytext); }
"/*"(\.|[^"*/"])*"*/" {fprintf(out,"<ML COMM,%s>\n",yytext); }
({let}|"_")({let}|{digit}|"_")*  {fprintf(out,"<ID,%s>\n",yytext); }
 ("+"|"-")?({digit})+"."({digit})+("E"("+"|"-")?({digit})+)?  {fprintf(out,"<FLOATLIT,%s>\n",yytext); }
 ("+"|"-")?({digit})+("."({digit})+)?"E"("+"|"-")?({digit})+  {fprintf(out,"<FLOATLIT,%s>\n",yytext); }
("+"|"-")?({digit})+  {fprintf(out,"<INTLIT,%s>\n",yytext); }
. {fprintf(out,"Error"); return yytext[0];}

%%

int yywrap(void){}

int main()
{
    yyin = fopen("input.c", "r");
    out=fopen("output.txt","w");
    yylex();
    fclose(yyin);
    fclose(out);
    return 0;
}