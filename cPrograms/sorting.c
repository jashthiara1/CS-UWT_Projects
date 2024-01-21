#include <stdio.h>
#define SIZE 10

void insertionSort(int[], int);
void printArray(int[], int);
void swap(int *, int *);

int main(void)
{
	int x = 13, y = 42;
	printf("x:%d y:%d\n", x, y);
	swap(&x, &y);
	printf("x:%d y:%d\n", x, y);

	int nums[] = {15, 1, -7, 99, 42, 2, 0, -13, 13, 10};

	printArray(nums, SIZE);
	insertionSort(nums, SIZE);
	printArray(nums, SIZE);

	return 0;
}

void printArray(int arr[], int length)
{
	int i;

	for (i = 0; i < SIZE; i++)
	{
		printf("%d ", arr[i]);
	}
	printf("\n");
}

void insertionSort(int arr[], int length)
{
	int i = 1, j;
	while (i < length)
	{
		j = i;
		while (j > 0 && arr[j - 1] > arr[j])
		{
			swap(&arr[j -1], &arr[j]);
			
			j--;
		}
		i++;
	}
}

void swap(int *ptr1, int *ptr2)
{
	int temp = *ptr2;
	*ptr2 = *ptr1;
	*ptr1 = temp;
}
