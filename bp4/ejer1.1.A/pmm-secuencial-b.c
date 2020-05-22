#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

// Declaración de tipos de vectores y matrices

#define VECTOR_DYNAMIC

int main(int argc, char ** argv)
{
	if(argc != 2)
	{
		printf("\nUso: %s <tamaño de las matrices>\n", argv[0]);

		exit(EXIT_FAILURE);
	}

	int N=atoi(argv[1]);

	int i;

	#ifdef VECTOR_DYNAMIC
		double **m1, **m2, **m3;

		m1 = (double**) malloc(N*sizeof(double *)); // se reserva memoria
		m2 = (double**) malloc(N*sizeof(double *)); // para las filas
		m3 = (double **) malloc(N*sizeof(double *));

		for(i=0; i<N; i++)
		{
			m1[i] = (double*) malloc(N*sizeof(double));	  	 // se reserva memoria
			m2[i] = (double*) malloc(N*sizeof(double));		 // para las columnas
			m3[i] = (double *) malloc(N*sizeof(double));
		}

		if ((m1==NULL) || (m2==NULL) || (m3==NULL))
		{
			printf("Error en la reserva de espacio\n");

			exit(EXIT_FAILURE);
		}
	#endif

	// Inicialización de las matrices

	int j,k;
	for(i=0; i<N; i++)
	{
		for(j=0; j<N; j++)
		{
			m1[i][j] = 3.0/5.0;
			m2[i][j] = 23.0/7.0;
			m3[i][j] = 0.0;
		}
	}

	struct timespec ini,fin;
	double total;

	clock_gettime(CLOCK_REALTIME,&ini);

	for(i=0; i<N; i++)
		for(k=0; k<N; k++)
			for(j=0; j<N; j++)
				m3[i][j] += m1[i][k]*m2[k][j];

	clock_gettime(CLOCK_REALTIME,&fin);
  
	total=(double)(fin.tv_sec-ini.tv_sec) +
		 (double)((fin.tv_nsec-ini.tv_nsec)/(1.e+9));

	// Mostrar los tiempos en pantalla
	printf("Tiempo(seg.):%11.9f\n Tamaño matrices:%u\n m1[0][0]+m2[0][0]=m3[0][0](%8.6f+%8.6f=%8.6f) m1[%d][%d]+m2[%d][%d]=m3[%d][%d](%8.6f+%8.6f=%8.6f)\n",
			total,N,m1[0][0],m2[0][0],m3[0][0],N-1,N-1,N-1,N-1,N-1,N-1,m1[N-1][N-1],m2[N-1][N-1],m3[N-1][N-1]);

	// Liberar la memoria reservada
	#ifdef VECTOR_DYNAMIC
		for(i=0; i<N; i++)
		{
			free(m1[i]);
			free(m2[i]);
			free(m3[i]);
		}

		free(m1);
		free(m2);
		free(m3);
	#endif

	return 0;
}
