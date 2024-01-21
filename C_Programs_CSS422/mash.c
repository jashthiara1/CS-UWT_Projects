// Jasharn Thiara
// TCSS 422
// Assignment 1
// Extra Credit Features: EC1

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>

#define COMMAND_SIZE 65
#define FILE_SIZE 63

int main() {
	int counter1 = 0;
	int counter2 = 0;
	int counter3 = 0;
    char command1[COMMAND_SIZE];
	char command2[COMMAND_SIZE];
	char command3[COMMAND_SIZE];
	char file[FILE_SIZE];
	char *arguments1[100];
	char *arguments2[100];
	char *arguments3[100];

	// Get command and arguments
	// filters out new line characters
    printf("Mash-1>");
    fgets(command1, sizeof(command1), stdin);
	command1[strcspn(command1, "\n")] = '\0';

	printf("Mash-2>");
    fgets(command2, sizeof(command2), stdin);
	command2[strcspn(command2, "\n")] = '\0';

	printf("Mash-3>");
    fgets(command3, sizeof(command3), stdin);
	command3[strcspn(command3, "\n")] = '\0';

	// Get file path 
	printf("file>");
    fgets(file, sizeof(file), stdin);
	file[strcspn(file, "\n")] = '\0';

	
	// create threads
	pid_t f1 = fork();
	pid_t p2;
	pid_t p3;

	// create time struct
	struct timespec start_of_threads, end_threads;
	clock_gettime(CLOCK_MONOTONIC, &start_of_threads);

	if (f1 == 0) {
		// split by spaces
		char* temp = strtok(command1, " ");

		// move words into array of arguments to pass execvp
		while (temp != NULL) {
			arguments1[counter1] = temp;
			counter1++;
			temp = strtok(NULL, " ");
		}
		// append file and NULL to array
		arguments1[counter1] = file;
		arguments1[counter1 + 1] = NULL;
		execvp(arguments1[0], arguments1);
		perror("CMD1:[Shell 1] Status Code=-1\n");
		return 1; 

	} else if (f1 < 0) {
		perror("error");
	} else {

		// forks another thread
		printf("--------------------------------------------------------------------------------\n");
		printf("First process finished...\n");
		printf("--------------------------------------------------------------------------------\n");

		p2 = fork();
		if (p2 == 0) {
			char* temp = strtok(command2, " ");

			// coppy words into arguments array
			while (temp!= NULL) {
				arguments2[counter2] = temp;
				//strcpy(arguments2[counter2], word);
				counter2++;
				temp = strtok(NULL, " ");
			}
			//append file and null value to array
			arguments2[counter2] = file;
			arguments2[counter2 + 1] = NULL;
			execvp(arguments2[0], arguments2);
			perror("CMD2:[Shell 2] Status Code=-1\n");

		} else if (p2 < 0) {
			perror("FORK ERROR");
		} else {

			// fork another thread
			printf("--------------------------------------------------------------------------------\n");
			printf("Second process finished...\n");
			printf("--------------------------------------------------------------------------------\n");
			p3 = fork();
			if (p3 == 0) {
				char* temp = strtok(command3, " ");

				// add arguments and command to array
				while (temp != NULL) {
					arguments3[counter3] = temp;
					counter3++;
					temp=strtok(NULL, " ");
				}

				// append file and null to  array
				arguments3[counter3] = file;
				arguments3[counter3 + 1] = NULL;
				execvp(arguments3[0], arguments3);
				perror("CMD3:[Shell 3] Status Code=-1\n");
			} else if (p3 < 0) {
				perror("FORK ERROR");
			} else {
				// parent waits for all threads to finish to exit gracefully
				int status3;
				wait(&status3);
			}
		}
	}
	printf("--------------------------------------------------------------------------------\n");
	printf("Third process finished...\n");
	printf("--------------------------------------------------------------------------------\n");

	//print out IDs OF processes
	printf("Children process IDs: %d, %d, %d\n", f1, p2, p3);

	// Get end of thread 1
	clock_gettime(CLOCK_MONOTONIC, &end_threads);
	long long time_thread1 = (end_threads.tv_nsec-start_of_threads.tv_nsec);
	double time_ms = time_thread1 / 1000000.0;
	printf("Total elapsed time: %.2f ms\n", time_ms);
	
}

// method was going to be used to append dashes, but would mess with arguments array and execvp call
// therefore was not used.
void delimiter(int num, char* temp) {

	int length = strlen(temp);
	int remainingDashes = 80 -length;
	printf("-----CMD %d: %s", num, temp);
	while (remainingDashes > 0) {
		printf("-");
		remainingDashes--;
	}
	printf("\n");
}