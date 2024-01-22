
package exercisesLambdaexpressions;

import lambdaexpressions.FunctionalInterface;

/**
 * create individual lambda expressions for +, -, /, * using the functional interface.
 * 
 * @author jthiara
 * @version fall 2021
 */
public final class LambdaExampleB {

    /**
     * private constructor for utility classes.
     */
    private LambdaExampleB() {

    }
/**
 * Main method.
 * 
 * @param theArgs arguments.
 */
    public static void main(final String[] theArgs) {
        final int x = 5;
        final int y = 10; // avoids magic number error
        final int z = 20;
        
    
        final FunctionalInterface f1  = n -> n + n;
        final FunctionalInterface f2  = n -> n - 1;
        final FunctionalInterface f3  = n -> n / x;
        final FunctionalInterface f4  = n -> n * y;
    
        System.out.println(f1.calculate(2)); 
        System.out.println(f2.calculate(x));
        System.out.println(f3.calculate(z));
        System.out.println(f4.calculate(y));
    }
}
