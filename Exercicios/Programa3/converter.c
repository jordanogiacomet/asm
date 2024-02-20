#include <stdlib.h>
#include <stdio.h>

extern int str_to_int(char*);
extern char* int_to_str(char*, char*, int);


int str_to_int(char* str){
    return atoi(str);
}

char* int_to_str(char* input, char* fmt, int val){
    sprintf(input, fmt, val);
    return input;
}


