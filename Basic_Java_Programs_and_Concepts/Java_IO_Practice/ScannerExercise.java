/*
 * TCSS 305
 * 
 * File IO example
 */

package exercises;

import java.util.Scanner;

/**
 * This demonstrates I/O using Scanner.
 * 
 * @author jthiara
 * @version 1.0
 *
 */
public final class ScannerExercise {

    /**
     * private constructor for utility class as no object is going to be created outside the
     * class.
     * 
     */
    private ScannerExercise() {

    }

    /**
     * @main function
     * @param theArgs arguments
     * 
     */
    public static void main(final String[] theArgs) {

        // Using Scanner for Getting 2 integer inputs from user
        // Add the 2 integers 
        // print the added result to the console
        
        final Scanner input = new Scanner(System.in);
        
        // Get input from user
        System.out.println("Enter your first integer: ");
        final int intVal = input.nextInt();
        System.out.println("Enter your second integer: ");
        final int intVal2 = input.nextInt();
        
        // show added result of input
        System.out.println("The result after adding the two integers is: " + (intVal + intVal2));
        
        input.close();

    }

}
