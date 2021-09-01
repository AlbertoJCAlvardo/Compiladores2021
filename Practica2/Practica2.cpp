//Standard utilizado: -ansi

#include<list>
#include<string>
#include<vector>

using namespace std;

struct transicion {				//Estructura de datos que denota una trancisión
	int s1;
	int s2;
	char simbolo;
};



class AFN{
	
	public:
			vector<char> Sigma;				//Alfabeto del automata
			vector<int> estados;			//Conjunto de estados
			vector<transicion> delta;		//Trancisiones del AFN
			int F;							//Estado final del AFN

	AFN(){										//Constructor vacio del AFN, inicializa el alfabeto de la 'a' a la 'z'
					
		int i=0;								// 		e incluye el caracter 'E' como epsilon (cadena vacía)
		char c = 'a';
		vector<char> alfabeto;
												
		while(i<26){
			alfabeto.push_back(c);
			c++;
			i++;
		}
		
		alfabeto.push_back('E');
		
		Sigma = alfabeto;
	}
	
	int getNoEstados(){
		return estados.size();
	}
	
	void setEstados(int noEstados){
		for(int i = 0; i < noEstados; i++){
			estados.push_back(i);
		}
	}
	
	void setTransicion(int s1, int s2, char simbolo){
		
		transicion tr;
		tr.s1 = s1;
		tr.s2 = s2;
		tr.simbolo = simbolo;
		delta.push_back(tr);
		
	}
	
	void setF(int sf){
		F = sf;
	}
	
	int getF(void){
		return F;
	}
	
	
	
};


AFN concatenar(AFN a, AFN b){
	
	AFN c.setEstados(a.getNoEstados() + b.getNoEstados());
	int i = 0;
	transicion = tr;
	
	for(i=0; i < a.delta.size(); i++){
		
		trans = a.delta.at(i);
		c.setTransicion(tr.s1, tr.s2, tr.simbolo);
		
	}
	
	c.setTransicion(a.getF(), a.getNoEstados(), 'E');
	
	for(i = 0; i < b.delta.size(); i++){
		tr = b.delta.at(i);
		c.setTrancision(tr.s1 + a.getNoEstados(), tr.s2 + a.getNoEstados(), tr.simbolo);
	}
	
	c.setF(a.getNoEstados() + b.getNoEstados() - 1);
	
	return c;
	
}


AFN kleene(ANF a){
	
}

int main(void){
	
}
