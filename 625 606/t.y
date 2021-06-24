%{
   #include<stdio.h>
   #include<stdlib.h>
   #include<string.h>

   extern FILE *yyin,*yyout;

%}

%token AND AS DO IF FOR BREAK CASE CONST echo ELSE WHILE THEN ELSEIF GLOBEL RETURN FUNCTION BR Float
%token NUM ID NL SB EB EQ LOB MOB SOB SCB MCB LCB COMMA SEMICOLON STRING Concatination CHARS FunName
%left PLUS MINUS
%left MULTIPLY DIVISON POWER MOD
%left LT GT LE GE EE NE
%start Pb

%% 
Pb	: SB Body EB {printf("\n It's a valid arithmatic exp. \n"); exit(0);}
;
Body : Statement   {printf("Body->ST \n");}
     | Statement Body   {printf("Body->ST Body \n");}
     
;
Statement : singleState           {printf("ST->SS \n");}
	  | singleState Statement   {printf("ST->SS ST \n");}
          | Return                    {printf("ST->Ret \n");}
;
singleState	: arthamticSet             {printf("SS->Arithmetic \n");}
		| assinmentState              {printf("SS->Assignment \n");}
		| echo output SEMICOLON        {printf("SS->echo output SC \n");}
                | conditionalSate                  {printf("SS->IF \n");}
		| repitationState                   {printf("SS->LOOP \n");}
		| funcationSate                         {printf("SS->FUNCTIONST \n");}
		| Funcall                               {printf("SS->FUNCTIONSCALL \n");}
;

Return : RETURN assinmentState                      {printf("Ret->RET Assignment \n");}
       | RETURN arthamticSet 	                       {printf("Ret->RET Arithmetic \n");}
       | RETURN Funcall                                   {printf("Ret->RET FunCall \n");}
       | RETURN	FunName SEMICOLON                            {printf("Ret->RET FunName SC \n");}
;

Funcall : FunName SOB SCB SEMICOLON  {printf("Function Call \n");}
;

funcationSate : FUNCTION FunName SOB SCB MOB Statement MCB {printf("Function creation \n");}
;
repitationState : WHILE SOB BoolExp SCB MOB Statement MCB {printf("While statement \n");}
;

conditionalSate	: IF SOB BoolExp SCB MOB Statement MCB moreconditionalSate {printf("if statement else... \n");}
;

moreconditionalSate : ELSEIF MOB Statement MCB moreconditionalSate          {printf("MCS->ELIF \n");}
		    | ELSE MOB Statement MCB 	                             {printf("MCS->ELSE \n");}
		    | 	
;

output	: STRING outputT                                {printf("output->STR output \n");}
        | ID outputT                                      {printf("output->ID output \n");}
	| FunName outputT 
;

outputT : Concatination output
	|
;

BoolExp : exp Comp exp {printf(" BOOL->exp comp exp \n");}		
	|	
;

arthamticSet	: ID EQ exp SEMICOLON 		{printf("ID = exp \n");}
;

assinmentState 	: ID EQ ID SEMICOLON   		{printf("id = ID \n");}
		| ID EQ NUM SEMICOLON  		{printf("ID = Num \n");}
		| ID EQ Float SEMICOLON  	{printf("ID = Float \n");}
		| ID EQ STRING SEMICOLON 	{printf("ID = STRING \n");}
		| ID EQ CHARS SEMICOLON 	{printf("ID = CHAR STRING \n");}
;

exp : exp operS exp {printf("exp  -> exp opers exp \n");}
    | NUM {printf("exp->Num \n");}
    | ID  {printf("exp->ID \n");}
    | Float {printf("exp->Float \n");}
;

Comp : GT                 {printf("Comp->GT \n");}
     | LT                  {printf("Comp->lT \n");}
     | LE                   {printf("Comp->LE \n");}
     | GE                   {printf("Comp->GE \n");}
     | EE                     {printf("Comp->EE \n");}
     | NE                   {printf("Comp->NE \n");}
;

operS : PLUS                                           {printf("operS->+ \n");}
      | MINUS                                         {printf("operS->- \n");}
      | MULTIPLY                                      {printf("operS->* \n");}
      | DIVISON                                       {printf("operS->/ \n");}
      | POWER                                          {printf("operS->** \n");}
      | MOD                                               {printf("operS->% \n");}
;

%%

