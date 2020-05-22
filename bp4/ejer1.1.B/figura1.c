#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct {
  int a;
  int b;
} s[5000];

int main() {
  int ii, i, X1, X2;
  int *R;
  const int TAM = 40000;
  const int TAM2 = 5000;
  struct timespec ini, fin;
  double total;
  R = (int *)malloc(TAM * sizeof(int));

  clock_gettime(CLOCK_REALTIME, &ini);

  for (ii = 0; ii < TAM; ii++) {
    X1 = 0;
    X2 = 0;
    for (i = 0; i < TAM2; i++)
      X1 += 2 * s[i].a + ii;
    for (i = 0; i < TAM2; i++)
      X2 += 3 * s[i].b - ii;
    if (X1 < X2)
      R[ii] = X1;
    else
      R[ii] = X2;
  }
  clock_gettime(CLOCK_REALTIME, &fin);
  
  total = (double)(fin.tv_sec - ini.tv_sec) +
         (double)((fin.tv_nsec - ini.tv_nsec) / (1.e+9));

  printf("\nTiempo (seg): %11.9f\n", total);

  free(R);
}
