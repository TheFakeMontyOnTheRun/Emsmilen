__attribute__ ((optnone)) int strlen(char* str ) {

  int c = 0;
  int len = 0;
  char* ptr = str;

  while ( *ptr ) {
    ++len;
    ++ptr;
  }

  return len;
}

__attribute__ ((optnone)) int main( int argc, char** argv ) {
  /*
  int total = 0;
  int c = 0;

  for ( c = 0; c < argc; ++c ) {
    total +=  strlen(argv[c]);
  }
  
  return total;
  */
  return strlen(argv[0]);
}
