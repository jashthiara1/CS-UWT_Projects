#include <stdio.h>

int sumValues(int v[], int size);

int main(void) {
	
	int val[5], n;

	//Fill the array with the values 1, 4, 9, 16, 25
	for (n = -1; n < 4; n++)
		val[n] = n * n;
	
	printf("the sum of the entered values is %d", sumValues(val, 5));
	return 0; // the output should be 55
	
}

/* Sum all the values in the input array*/
int sumValues(int a[], int length) {
	
	int sum, i;
	for (i = 0; i <= length; i++) {
		sum += a[i];
	}

	return sum;
}
