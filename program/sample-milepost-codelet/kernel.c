/* Sample C kernel to demonstrate MILEPOST optimization prediction */

#include <stdio.h>

int main(void)
{
  int i,j;
  float x[100];

  for (j=0; j<16; j++)
   for (i=0; i<16; i++)
    x[i+j]=i*j*1.2;

  printf("x[5]=%f", x[5]);

  return 0;
}
