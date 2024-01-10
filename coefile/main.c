#include <stdio.h>
#include <string.h>

int main(){
    char str[100];
    FILE * f = fopen("model.coe", "r+");
    fscanf(f, "%s", str);
    fscanf(f, "%s", str);
    FILE * o = fopen("arr.text", "w+");

    int cnt = 0;
    while(fscanf(f, "%s", str) != EOF){
        if(strcmp(str, "9DE,")){
            str[3] = ';';
            fprintf(o, "%d: out = 12'h%s\n", cnt, str);
        }
        cnt++;
    }
}
