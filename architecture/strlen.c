#include <stdio.h>
#include <stdlib.h>

// counts the number of characters in the first string argument
int main (int argc, char *argv[]) {
  // program name counts as 1 in argument count
  if (argc < 2 ) {
    printf("No argument provided\n");
    exit(1);
  }
  
  printf("Starting to count...\n");

  int i;
  for (i = 0; argv[1][i] != 0; i++);

  printf("string length is: %d\n", i);

  return 0;
}
