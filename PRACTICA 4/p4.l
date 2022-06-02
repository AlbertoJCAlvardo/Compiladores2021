CASO1 [a-zA-Z_][a-zA-Z_0-9]*@[a-zA-Z_][a-zA-Z_0-9]*\.com
CASO2 [a-zA-Z_][a-zA-Z_0-9]*@[a-zA-Z_][a-zA-Z_0-9]*\.mx
CASO3 [a-zA-Z_][a-zA-Z_0-9]*@[a-zA-Z_][a-zA-Z_0-9]*\.com\.mx

RANGO [0-9][0-9]|[0-9][a-fA-F]|[a-fA-F][a-fA-F]|[a-fA-F][0-9]

%% 
int|char|double {printf("tipo de datos");}
[a-zA-Z_][a-zA-Z_0-9]* {printf("Nombre de variable");}
\"[^\".]*\" {printf("Cadena valida");}
{CASO1}|{CASO2}|{CASO3} {printf("Correo Valido");}
{RANGO}\.{RANGO}\.{RANGO}\.{RANGO} {printf("Direccion MAC");}

