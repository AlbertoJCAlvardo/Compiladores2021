%{
#include<math.h>
#include<stdio.h>
#include<stdlib.h>

int size(char *c){
	int i=0;
	while(c[i]){
		i++;
	}

	return i;
}

typedef struct nodo{
	char *id;
	int tipo;
	int contenido;
	int datai;
	float dataf;
	char *datas;
	struct nodo *siguiente;

}t_nodo,*Nodo;

typedef struct tabla{
	Nodo inicial;
	Nodo final;
	int length;
}t_tabla,*Tabla;


Nodo crearNodoI(char* idx, int tipox, int val, int contenido){
	Nodo n = NULL;
	n = (Nodo) malloc (sizeof(t_nodo));
	n->id = idx;
	n->contenido = contenido;
	n->datai = val;
	n->tipo = tipox;
	n->siguiente = NULL;
	return n;
}
Nodo crearNodoF(char* idx, int tipox, float val,int contenido){
	Nodo n = NULL;
	n = (Nodo) malloc (sizeof(t_nodo));
	n->id = idx;
	n->contenido = contenido;
	n->dataf = val;
	n->tipo = tipox;
	n->siguiente = NULL;
	return n;
}
Nodo crearNodoS(char* idx, int tipox, char *val,int contenido){
	Nodo n = NULL;
	n = (Nodo) malloc (sizeof(t_nodo));
	n->id = idx;
	n->contenido = contenido;
	n->tipo = tipox;
	n->datas = val;
	n->siguiente = NULL;
	return n;
}


Tabla crearTabla(void){
	Tabla t = NULL;
	
	t  = (Tabla) malloc (sizeof(t_tabla));
	t->inicial = NULL;
	t->final = NULL;
	t -> length = 0;
	
	return t;
}

int insertarNodo(Tabla t, Nodo n){
	if (t->length == 0){
		t->inicial = n;
		t->final = n;
		t->length++;
		return 1;
	}
	else{
		Nodo aux = NULL;
		aux = t->final;
		aux->siguiente = n;
		t->final = n;
		t->length++;
		return 1;
	}
	return 0;
}

int comparar(char *a,char *b){
	int la=0,lb=0;
	
	la = size(a);
	lb = size(b);
	
	if(la == lb){
		int bandera = 1,i=0;
		
		for(i=0;i<la;i++){
			if(a[i] != b[i]){
				bandera = 0;
				break;
			}
		}
		
		return bandera;
	
	}
	else{
		return 0;
	}

}

int inTable(Tabla t,char *name){
	int i = 0;
	
	if(t->length >0){
		Nodo n = t->inicial;
		while(i<t->length){
			if(comparar(n->id,name)){
				return 1;
			}
			n = n->siguiente;
			i++;		
		}
		return 0;
		
	}
}	

int getIVal(Tabla t, char *id){
	int i = 0;
	
	if(t->length >0){
		Nodo n = t->inicial;
		while(i<t->length){
			if(comparar(n->id,id)){
				int val;
				
				val = n->datai;
				
				return val;
				
				
			}
			n = n->siguiente;
			i++;		
		}
		return 0;
		
	}
}

float getFVal(Tabla t, char *id){
	int i = 0;
	
	if(t->length >0){
		Nodo n = t->inicial;
		while(i<t->length){
			if(comparar(n->id,id)){
				float val;
				
				val = n->dataf;
				
				return val;
				
				
			}
			n = n->siguiente;
			i++;		
		}
		return 0;
		
	}
}


char *getSVal(Tabla t, char *id){
	int i = 0;
	
	if(t->length >0){
		Nodo n = t->inicial;
		while(i<t->length){
			if(comparar(n->id,id)){
				char *val;
				
				val = n->datas;
				
				return val;
				
				
			}
			n = n->siguiente;
			i++;		
		}
		return NULL;
		
	}
}
	
int getType(Tabla t, char *id){
		
	  int i=0,bandera=0;
	  Nodo n= NULL;
	  n = t->inicial;
	  while(i<t->length){
	  	if(comparar(n->id,id)){
	  		bandera = 1;
	  		return n->tipo;
	  	}
	  	i++;
	  }
	  return 0;

	}


int setIVal(Tabla t, char *id, int val){

	  int i=0,bandera=0;
	  Nodo n= NULL;
	  n = t->inicial;
	  while(i<t->length){
	  	if(comparar(n->id,id)){
	  		
	  		n->contenido = 1;
	  		n->datai = val;
	  		
	  		return 1;
	  	}
	  	i++;
	  }
	  return 0;

	}

int setFVal(Tabla t, char *id, float val){

	  int i=0,bandera=0;
	  Nodo n= NULL;
	  n = t->inicial;
	  while(i<t->length){
	  	if(comparar(n->id,id)){
	  		
	  		n->contenido = 1;
	  		n->dataf = val;
	  		
	  		return 1;
	  	}
	  	i++;
	  }
	  return 0;

	}
int setSVal(Tabla t, char *id, char *val){

	  int i=0,bandera=0;
	  Nodo n= NULL;
	  n = t->inicial;
	  while(i<t->length){
	  	if(comparar(n->id,id)){
	  		
	  		n->contenido = 1;
	  		n->datas = val;
	  		
	  		return 1;
	  	}
	  	i++;
	  }
	  return 0;

	}



Tabla t;

%}

/* Declaraciones de BISON */

%union{
	int entero;
	double decimal;
	char *cadena;
	
}


%token <entero> ENTERO
%token <decimal> DECIMAL
%token <cadena> CADENA
%token MOD
%token <cadena> TINT
%token <cadena> TFLOAT
%token <cadena> TSTRING
%token <cadena> VAR



%type <entero> expi
%type <decimal> expd
%type <cadena> estring
%type <cadena> dec
%type <cadena> expdecent
%type <cadena> expdecreal
%type <cadena> expdecstring

%left '+' '-'
%left '*' '/' MOD

/* Gramatica */
%%

input: /* cadena vacía*/
	| input line 
;
line:	'\n'	  
	| expi'\n' {printf("\n\tResultado: %d\n\n",$1);}
	| expd'\n'{printf("\n\tResultado: %f\n\n",$1);}
	| estring '\n' {printf("\n\tContenido de la cadena: %s\n\n",$1);}
	| dec '\n' {printf("\nVariable declarada: %s\n\n",$1);}
	
;

dec: 
	TINT expdecent ';'{
					printf("\nVariable Entera");
					$$ = $2;
				}
	| TFLOAT expdecreal ';'{
					printf("\nVariable Flotante");
					$$ = $2;
				}
	| TSTRING expdecstring ';'{
					printf("\nVariable String");
					$$ = $2;
				}
			
;

expdecent:  VAR '=' expi  {		
					if(t == NULL){
						t = crearTabla();
					}	
					printf("\n\nDeclaracion de la variable \"%s\"",$1);
					if(!inTable(t,$1)){
						Nodo n = NULL;
						n = crearNodoI($1,DECIMAL,$3,1);
						insertarNodo(t,n);
						
						printf("\n\tValor de la variable %s:  %d",$1,getIVal(t,$1));
						
						$$ = $1;
					}
					else{
						printf("\nEsta variable ya existe");
					}
				}
	|VAR  {		
					if(t == NULL){
						t = crearTabla();
					}	
					printf("\n\nDeclaracion de la variable \"%s\"",$1);
					if(!inTable(t,$1)){
						Nodo n = NULL;
						n = crearNodoI($1,DECIMAL,0,0);
						insertarNodo(t,n);
						
						
						$$ = $1;
					}
					else{
						printf("\nEsta variable ya existe");
					}
				}

	|VAR '=' expi ',' expdecent{		
					if(t == NULL){
						t = crearTabla();
					}	
					printf("\n\nDeclaracion de la variable \"%s\"",$1);
					if(!inTable(t,$1)){
						Nodo n = NULL;
						n = crearNodoI($1,DECIMAL,$3,1);
						insertarNodo(t,n);
						
						printf("\n\tValor de la variable %s:  %d",$1,getIVal(t,$1));
						
						$$ = $1;
					}
					else{
						printf("\nEsta variable ya existe");
					}
				}
				
	|VAR  ',' expdecent{		
					if(t == NULL){
						t = crearTabla();
					}	
					printf("\n\nDeclaracion de la variable \"%s\"",$1);
					if(!inTable(t,$1)){
						Nodo n = NULL;
						n = crearNodoI($1,DECIMAL,0,0);
						insertarNodo(t,n);
						$$ = $1;
					}
					else{
						printf("\nEsta variable ya existe");
					}
				}

;

expdecreal:  VAR '=' expd  {		
					if(t == NULL){
						t = crearTabla();
					}
					printf("\n\nDeclaracion de la variable \"%s\"",$1);
					if(!inTable(t,$1)){
						Nodo n = NULL;
						n = crearNodoF($1,DECIMAL,$3,1);
						insertarNodo(t,n);
						
						printf("\n\tValor de la variable %s:  %f",$1,getFVal(t,$1));
						$$ = $1;
					}
					else{
						printf("\nEsta variable ya existe");
					}
				}
				
		| VAR	{		
					if(t == NULL){
						t = crearTabla();
					}
					printf("\n\nDeclaracion de la variable \"%s\"",$1,1);
					if(!inTable(t,$1)){
						Nodo n = NULL;
						n = crearNodoF($1,DECIMAL,0,0);
						insertarNodo(t,n);
						
						$$ = $1;
					}
					else{
						printf("\nEsta variable ya existe");
					}
				}		
		|  VAR '=' expd ',' expdecreal {		
							if(t == NULL){
								t = crearTabla();
							}
							printf("\n\nDeclaracion de la variable \"%s\"",$1);
							if(!inTable(t,$1)){
								Nodo n = NULL;
								n = crearNodoF($1,DECIMAL,$3,1);
								insertarNodo(t,n);
								printf("\n\tValor de la variable %s:  %f",$1,getFVal(t,$1));
								$$ = $1;
							}
							else{
								printf("\nEsta variable ya existe");
							}
						}
		|  VAR  ',' expdecreal {		
							if(t == NULL){
								t = crearTabla();
							}
							printf("\n\nDeclaracion de la variable \"%s\"",$1);
							if(!inTable(t,$1)){
								Nodo n = NULL;
								n = crearNodoF($1,DECIMAL,0,0);
								insertarNodo(t,n);
								$$ = $1;
							}
							else{
								printf("\nEsta variable ya existe");
							}
						}
						
					
						
						
;


expdecstring:  VAR '=' estring  {		
					if(t == NULL){
						t = crearTabla();
					}
					printf("\n\nDeclaracion de la variable \"%s\"",$1);
					if(!inTable(t,$1)){
						Nodo n = NULL;
						n = crearNodoS($1,CADENA,$3,1);
						insertarNodo(t,n);
						
						printf("\n\tValor de la variable %s:  %s",$1,getSVal(t,$1));
						$$ = $1;
					}
					else{
						printf("Esta variable ya existe");
					}
				}
				
		| VAR	{		
					if(t == NULL){
						t = crearTabla();
					}
					printf("\n\nDeclaracion de la variable \"%s\"",$1,1);
					if(!inTable(t,$1)){
						Nodo n = NULL;
						n = crearNodoS($1,CADENA,"",0);
						insertarNodo(t,n);
						
						$$ = $1;
					}
					else{
						printf("\nEsta variable ya existe");
					}
				}		
		|  VAR '=' estring ',' expdecreal {		
							if(t == NULL){
								t = crearTabla();
							}
							printf("\n\nDeclaracion de la variable \"%s\"",$1);
							if(!inTable(t,$1)){
								Nodo n = NULL;
								n = crearNodoS($1,CADENA,$3,1);
								insertarNodo(t,n);
								
								printf("\n\tValor de la variable %s:  %s",$1,getSVal(t,$1));
								$$ = $1;
							}
							else{
								printf("\nEsta variable ya existe");
							}
						}
		|  VAR  ',' expdecreal {		
							if(t == NULL){
								t = crearTabla();
							}
							printf("\n\nDeclaracion de la variable \"%s\"",$1);
							if(!inTable(t,$1)){
								Nodo n = NULL;
								n = crearNodoS($1,CADENA,0,0);
								insertarNodo(t,n);
								
								$$ = $1;
							}
							else{
								printf("\nEsta variable ya existe");
							}
						}
						
					
						
						
;

expi:  ENTERO {$$ = $1;}
	|VAR {
		int i;
		if(getType(t,$1)==ENTERO){
			i = getIVal(t,$1);
			$$ = i;
		}
			$$ = 0;
		}
	| expi '+' expi 	{$$ = $1 + $3;	}
	| expi '-' expi 	{$$ = $1 - $3;	}
	| expi '*' expi	{$$ = $1 * $3;	}
	| expi '/' expi	{$$ = $1 * $3;	}
	| expi '/' expd	{
				  if((int)$3 !=0){
				  	$$ = (int)($1 /(int)$3);
				  }
				  else{
				  	$$ = $1;
				  	printf("Error matematico");
				  }
				  
				}
	| MOD'('expi','expi')'{$$ = $3% $5;}
	| '('expi')' {$$ = $2;};
;



expd:  DECIMAL {$$ = $1;}
	| VAR 	{
			float f;
			if(getType(t,$1)==DECIMAL){
				f = getFVal(t,$1);
				$$ = f;
			}
			$$ = 0;
		
		}
	| expd '+' expd 	{$$ = $1 + $3;	}
	| expd '-' expd 	{$$ = $1 - $3;	}
	| expd '*' expd	{$$ = $1 * $3;	}
	| expd '/' expd	{$$ = $1 / $3;	}
	
	| expi '+' expd 	{$$ = $1 + $3;	}
	| expi '-' expd 	{$$ = $1 - $3;	}
	| expi '*' expd	{$$ = $1 * $3;	}
	
	| expd '+' expi 	{$$ = $1 + $3;	}
	| expd '-' expi 	{$$ = $1 - $3;	}
	| expd '*' expi	{$$ = $1 * $3;	}
	| expd '/' expi	{$$ = $1 / $3;	}
	
	| MOD'('expd','expd')'{$$ = $3 - (int) ($3/$5)* $5;}
	| MOD'('expi','expd')'{$$ = $3 - (int) ($3/$5)* $5;}
	| MOD'('expd','expi')'{$$ = $3 - (int) ($3/$5)* $5;}
	| '('expd')' {$$ = $2;};
;

estring: CADENA {$$ = $1;}
	| estring '+' estring {
	
					char *a,*b,*c;
					int la,lb,i=0,lc;

					a =$1;
					b =$3;				
					la = size(a);
					lb = size(b);
					
					lc = la+lb;
					
				c = (char*) malloc (lc*sizeof(char));
		for(i=0;i<lc;i++){
			if(i<la-2){
				c[i] = a[i];
			}
			if(i>la-2){
				c[i] = b[i];
			}
		}			
		$$ = c;	
				
				}
		
%%

int main(){
		
	yyparse();
	return 0;
}

int yyerror(char *s){
	printf("\n--%s--\n",s);
}
int yywrap(){
	return 1;
}
