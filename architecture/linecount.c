#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  if (argc < 2)
  {
    printf("No argument provided\n");
    exit(1);
  }

  FILE *fptr = fopen(argv[1], "r");

  if (fptr == NULL)
  {
    printf("File read unsuccessful");
    exit(1);
  };

  char c = getc(fptr);
  int linecount = 0;
  while (c != EOF) {
    if (c == '\n') {
      linecount++;
    }
    c = getc(fptr);
  }
  fclose(fptr);

  printf("Line count is: %d\n", linecount);
  return 0;
}
