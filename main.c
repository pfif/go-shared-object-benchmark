#include <stdio.h>
#include <stdlib.h>
extern int add(int, int);

int main(int argc, char *argv[]){
  int i = 0;
  while (i < atoi(argv[1])){
    add(2, 2);
    i++;
  }
  return 0;
}
