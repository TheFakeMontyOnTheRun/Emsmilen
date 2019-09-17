#include <stdio.h>
#include <string.h>

int testFunction(char* input) {

  int len = strlen(input);


    puts("I am the big pill");

    for (int c = 0; c < len; ++c ) {
      putchar(input[c]);
      putchar('.');
    }

    return len;

  }

int main( int argc, char** argv ) {

  return testFunction("farofinha");
}