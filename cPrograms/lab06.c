// Jasharn Thiara
// TCSS 380
// Lab 6

#include <stdio.h>

int sumValues(int v[], int size);

int main(void) {
	
	int val[5], n;

	//Fill the array with the values 1, 4, 9, 16, 25
	for (n = 0; n <= 5; n++)
		val[n] = (n + 1) * (n + 1);
	
	printf("the sum of the entered values is %d", sumValues(val, 5));
	return 0; // the output should be 55
	
}

/* Sum all the values in the input array*/
int sumValues(int a[], int length) {
	
	int sum, i;
	for (i = 0; i < length; i++) {
		sum += a[i];
	}

	return sum;
}
