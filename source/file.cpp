#include <bits/stdc++.h>
using namespace std;

string arr[] = {"YYYYYYN","NYYNNNN","YYNYYNY","YYYYNNY","NYYNNYY","YNYYNYY","YNYYYYY","YYYNNNN","YYYYYYY","YYYYNYY"};
bool arrq[21];
int q;

void quemar(string& str){
	if (q == 1)
		for (int j = 0; j < 21; j++)
			if (arrq[j]) str[j] = 'N';
	if(q == 2){
		if((rand() % 100 + 1) > 95)
			arrq[rand() % 21] = 1;
		for (int j = 0; j < 21; j++)
			if (arrq[j]) str[j] = 'N';	
	}
}

string timer(int a, int b){
	string str = "[";
	string segundo;
	while (a >= b){
		segundo = arr[a/100] + arr[(a%100)/10] + arr[a%10];
		quemar(segundo);
		str += "\"" + segundo + "\"";
		cerr << a << "\n";
		if (!(a % 100)) a = (a/100 -1) * 100 + 5 * 10 + 9;
		else a--;
		if (a >= b)  str += ",";
	}
	str+= "]";
	return str;
}


int main(){
	srand(time(nullptr));
	int a, b;
	cin >> a >> b >> q;
	// 0. Sin LEDs quemados
	// 1. Generar quemados desde el inicio
	// 2. Generar quemados en caliente
	int l = rand() % 21 + 1;
	if (q == 1)
		while (l--){
			int r = rand() % 10;
			cerr << l << ". " << r << "\n";
			arrq[r] = 1;
		}
	cout << timer(a, b);
	return 0;
}
// 1:59 1:58 ... 1:00 0:59
// 9:99 9:98 ... 9:00 8:59
// 1:90 
