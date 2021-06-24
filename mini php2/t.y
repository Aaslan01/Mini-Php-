%{
   #include<stdio.h>
   #include<stdlib.h>
   #include<string.h>

   extern FILE *yyin,*yyout;

%}

%token AND AS DO IF FOR BREAK CASE CONST echo ELSE WHILE THEN ELSEIF GLOBEL RETURN FUNCTION BR 
%token NUM ID NL SB EB EQ LOB MOB SOB SCB MCB LCB COMMA SEMICOLON STRING Concatination CHARS FunName
%left PLUS MINUS
%left MULTIPLY DIVISON POWER MOD
%left LT GT LE GE EE NE
%start Pb

%% 
Pb	: SB Body EB {printf("\n It's a valid arithmatic exp. \n"); exit(0);}
;
Body : Statement
     | Statement Body
     
;
Statement : singleState
	  | singleState Statement
          | Return
;
singleState	: arthamticSet 
		| assinmentState 
		| echo output SEMICOLON
                | conditionalSate
		| repitationState 
		| funcationSate
		| Funcall
;

Return : RETURN assinmentState 
       | RETURN arthamticSet 	
       | RETURN Funcall
       | RETURN	FunName SEMICOLON  
;

Funcall : FunName SOB SCB SEMICOLON  {printf("Function Call \n");}
;

funcationSate : FUNCTION FunName SOB SCB MOB Statement MCB {printf("Function creation \n");}
;
repitationState : WHILE SOB BoolExp SCB MOB Statement MCB {printf("While statement \n");}
;

conditionalSate	: IF SOB BoolExp SCB MOB Statement MCB moreconditionalSate {printf("if statement else... \n");}
;

moreconditionalSate : ELSEIF SOB BoolExp SCB MOB Statement MCB moreconditionalSate 
		    | ELSE MOB Statement MCB 	
		    | 	
;

output	: STRING output
        | ID output
        | Concatination output
	| BR output
	|
;

BoolExp : exp Comp exp {printf(" exp comp exp \n");}		
	|	
;

arthamticSet	: ID EQ exp SEMICOLON 		{printf("ID = exp \n");}
;

assinmentState 	: ID EQ ID SEMICOLON   		{printf("id = ID \n");}
		| ID EQ NUM SEMICOLON  		{printf("ID = Num \n");}
		| ID EQ STRING SEMICOLON 	{printf("ID = STRING \n");}
		| ID EQ CHARS SEMICOLON 	{printf("ID = CHAR STRING \n");}
;

exp : exp operS exp {printf("exp  = exp opers exp \n");}
    | NUM {printf("Num \n");}
    | ID  {printf("ID \n");}
;

Comp : GT
     | LT
     | LE
     | GE
     | EE
     | NE
;

operS : PLUS 
      | MINUS
      | MULTIPLY 
      | DIVISON 
      | POWER 
      | MOD
;

%%

