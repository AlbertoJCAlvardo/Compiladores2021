
%{
#include "gramatica.tab.h"
%}

NUMERO [1-9][0-9]*|0

%%

{NUMERO} {printf("\nNumero entero ");
		 yylval.entero = atoi(yytext);		
		 return (ENTERO);}

{NUMERO}\.{NUMERO}+ {printf("\nNumero decimal ");
		 yylval.decimal = atof(yytext);		
		 return (DECIMAL);}

"+"|"*"|"-"|"/" {printf("\nSigno op ");
	return yytext[0];}

"," {printf("\nComa ");
	return yytext[0];}
			 

"(" {printf("\nSigno Parentesis ");
	return yytext[0];}
")" {printf("\nSigno Parentesis ");
	return yytext[0];}
	
[Mm][Oo][Dd] {	printf("\nModulo"); 
			return (MOD);
		}	
					




"\n" {printf("\nSalto de linea ");
	return (yytext[0]);}

\"[a-zA-Z0-9]*\" {
			printf("\nCadena");
			char *c = NULL,*a = NULL;
			
			c = strdup(yytext);
			a = strtok(c,"\"");
			yylval.cadena = a;
			return (CADENA);
			}

%%


