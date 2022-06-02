
%{
#include "gramatica.tab.h"


%}

NUMERO [1-9][0-9]*|0
NVAR [a-zA-Z][a-zA-Z0-9_]*



%%





int { printf("\nTipo de datos int");
	return TINT;}
float {printf("\nTipo de datos float");
		return TFLOAT;}
string {
		printf("\nTipo de datos string");
		return TSTRING;}

[Mm][Oo][Dd] {	printf("\nModulo"); 
			return (MOD);
		}	

{NVAR} {
			printf("\nVariable");
			char *c = NULL;
			int s;
			s = size(yytext);
			c = (char*) malloc (s*sizeof(char));
			
			int i = 0;
			for(i = 0; i<s; i++){
				c[i] = yytext[i];
			}
			
			yylval.cadena = c;
			return (VAR);
	}

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
	
";" {printf("\nOp. Cierre");
	return yytext[0];}
	
"=" {printf("\nOp. Asig");
	return yytext[0];}
	
					


"\n" {printf("\nSalto de linea ");
	return (yytext[0]);}

\"[a-zA-Z0-9]*\" {
			printf("\nCadena");
			char *c = NULL;
			int s;
			s = size(yytext);
			c = (char*) malloc (s*sizeof(char)-2);
			
			int i = 0;
			for(i = 0; i<s-2; i++){
				c[i] = yytext[i+1];
			}
			
			yylval.cadena = c;
			return (CADENA);
			}

%%


