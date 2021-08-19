#include<iostream>
#include<list>
#include<string>
#include<vector>
using namespace std;

class Trancision{
	public:
		 string e_act, e_sig, simbolo;
	
		 Trancision(string , string , string );
};

Trancision::Trancision(string nea, string nSimbolo, string nef){
			e_act = nea;
			e_sig = nef;
			simbolo = nSimbolo;
};


class AFD{
	
	private: 	
		vector<string> alfabeto;
		vector<string> estados;
		vector<Trancision> delta;
		string q0;
		vector<string> F;
	 
	
	public:
			AFD(vector<string>, vector<string> , vector<Trancision> , string , vector<string>);
			
			int procesar(vector<string> cadena);
					
			void show(void){
				cout<<"Automata Finito Determinista:   \nAlfabeto: {";
				for(string x: alfabeto)
					cout<<x<<", ";
				cout<<"}\nEstados: {";
				for(string x: estados){
					cout<<x<<", ";
				}
				cout<<"}\nFunciones de trancision: {\n\t";
				
				for(Trancision x: delta){
					cout<<x.e_act<<"("<<x.simbolo<<") -> "<<x.e_sig<<"\n\t";
				}
				
				cout<<"\n}\nEstado inicial: "<<q0;
				cout<<"\nEstados de aceptacion: {";
				for(string x:F)
					cout<<x<<", ";
				cout<<"}\n\n";	
			}
			
			int verificarAFD(void){
				int cont = 0;
				
				for(string e:estados){
					cont = 0;
					for(string s:alfabeto){
						for(Trancision x:delta){
							if(e.compare(x.e_act) == 0 && s.compare(x.simbolo))
								cont++;	
						}
					}
					if(cont != alfabeto.size()){
						return 0;
					}
					
				}
				
				return 1;
			}
			   
	
	
	
	
};


AFD::procesar(vector<string> cadena){
				int i=0, j=0, k=0, piv = 0;
				string e_act = q0;
				
				cout<<"\n\nProcesamiento de la cadena: '";
				for(string x: cadena)
					cout<<x;
				cout<<"'\n\n";
				for(i = 0; i< cadena.size(); i++){
						piv = 0;
						
						for(k=0; k< F.size() ; k++){
								if(e_act.compare(F[k]) == 0){
									
									cout<<"\nSubcadena Aceptada\n";
									piv = 1;
								}
						}
						
						
						for(j = 0; j< delta.size(); j++){
								
							if(e_act.compare(delta[j].e_act)  == 0 && cadena[i].compare(delta[j].simbolo) == 0){
								cout<<e_act<<"("<<cadena[i]<<") -> "<<delta[j].e_sig<<"\n";
								e_act = delta[j].e_sig;
								break;
							}		
							
						}
						
				}
				
			return piv;
	}	


AFD::AFD(vector<string> nAlfabeto, vector<string> nEstados, vector<Trancision> nDelta, string nq0, vector<string> nF){
				alfabeto = nAlfabeto;
				estados = nEstados;
				delta = nDelta;
				q0 = nq0;
				F = nF;
}





class AFN{
	
	private: 	
		vector<string> alfabeto;
		vector<string> estados;
		vector<Trancision> delta;
		string q0;
		vector<string> F;
	 
	
	public:
			AFN(vector<string>, vector<string> , vector<Trancision> , string , vector<string>);
			
			int procesar(vector<string> cadena);
					
			void show(void){
				cout<<"Automata Finito No Determinista:   \nAlfabeto: {";
				for(string x: alfabeto)
					cout<<x<<", ";
				cout<<"}\nEstados: {";
				for(string x: estados){
					cout<<x<<", ";
				}
				cout<<"}\nFunciones de trancision: {\n\t";
				
				for(Trancision x: delta){
					cout<<x.e_act<<"("<<x.simbolo<<") -> "<<x.e_sig<<"\n\t";
				}
				
				cout<<"\n}\nEstado inicial: "<<q0;
				cout<<"\nEstados de aceptacion: {";
				for(string x:F)
					cout<<x<<", ";
				cout<<"}\n\n";	
			}   
	
	
	
};

AFN::procesar(vector<string> cadena){
				int i=0, j=0, k=0, piv = 0;
				string e_act = q0;
				
				cout<<"\n\nProcesamiento de la cadena: '";
				for(string x: cadena)
					cout<<x;
				cout<<"'\n\n";
				for(i = 0; i< cadena.size(); i++){
						piv = 0;
						
						for(k=0; k< F.size() ; k++){
								if(e_act.compare(F[k]) == 0){
									
									cout<<"\nSubcadena Aceptada\n";
									piv = 1;
								}
						}
						
						
						for(j = 0; j< delta.size(); j++){
								
							if(e_act.compare(delta[j].e_act)  == 0 && cadena[i].compare(delta[j].simbolo) == 0){
								cout<<e_act<<"("<<cadena[i]<<") -> "<<delta[j].e_sig<<"\n";
								e_act = delta[j].e_sig;
								break;
							}		
							
						}
						
				}
				
			return piv;
	}	


AFN::AFN(vector<string> nAlfabeto, vector<string> nEstados, vector<Trancision> nDelta, string nq0, vector<string> nF){
				alfabeto = nAlfabeto;
				estados = nEstados;
				delta = nDelta;
				q0 = nq0;
				F = nF;
}




int main(void){
	vector<string> alfabeto = {"0", "1"};
	vector<string> estados = {"q0", "q1", "q2"};
	
	
	
	Trancision d1("q0", "0", "q0");
	Trancision d2("q0", "1", "q1");
	Trancision d3("q1", "0", "q1");
	Trancision d4("q1", "1", "q2");
	Trancision d5("q2", "0", "q1");
	Trancision d6("q2", "1", "q0");
	
	vector<Trancision> delta = {d1, d2, d3, d4, d5, d6};
	
	vector<string> F = {"q2"};
	
	
	AFD a11(alfabeto, estados, delta, "q0", F);
	
	if(a11.verificarAFD())
		cout<<"El automata introducido es un AFD\n\n";
	
	
	a11.show();
	
	vector<string> cadena = {"0","1","0","1","1","0","1","1"};
	
	
	
	
	if(a11.procesar(cadena)){
		cout<<"\nEl autómata aceptó la cadena completa\n";
	}
	
	
	//El automata finito no determinista tiene una implementacion igual a la del finito determinista
	//Solamente que este no requiere la verificacion que exista una funcion de trancision para cada estado con cada simbolo
	
	 
}
