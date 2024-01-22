
package exercisesLambdaexpressions;

import lambdaexpressions.StringInterface;

/**
 * Create a lambda expression to print the ascii value of the characters in a string
 *         using the StringInterface.
 * 
 * @author jthiara
 * @version Fall 2021 
 *
 */

public final class LambdaExampleD {

    /**
     * private constructor for utility classes.
     */
    private LambdaExampleD() {

    }

    /**
     * Main method.
     * 
     * @param theArgs arguments.
     */
    public static void main(final String[] theArgs) {
        final StringInterface var1 = (String sr) -> {
            String var2 = "";
            
            for (int i = 0; i <= sr.length() - 1; i++) {
                var2 += (int) sr.charAt(i) + " ";
            }
            
            return var2;
        };
        
        final String jasharn = var1.stringprocessing("Jasharn");
        System.out.println(jasharn);
       
    }

}

