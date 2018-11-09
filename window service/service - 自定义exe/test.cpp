#include<cstdio>
#include<ctime>
#include<windows.h>
using namespace std;

int main() {
	while(1) {
		time_t t = time(0);
		char s[111];
		strftime( s, sizeof(s), "%Y-%m-%d %H:%M:%S",localtime(&t) );
		
		FILE* f = fopen("test.out", "w");
		fprintf(f, "%s", s);
		fclose(f);
		
		printf("%s\n", s);
		Sleep(5000);
	}
	
	return 0;
}