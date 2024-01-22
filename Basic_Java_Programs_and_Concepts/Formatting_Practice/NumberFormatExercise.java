/*
 * TCSS 305
 * 
 * Class for numberformat, big decimal examples
 */

package exercises;

import java.text.NumberFormat;
import java.util.Locale;

/**
 * Demonstrates the use of Number format.
 * 
 * @author jthiara
 * @version 1.0
 *
 */
public final class NumberFormatExercise {

    /**
     * private constructor for utility class.
     * 
     */
    private NumberFormatExercise() {

    }

    /**
     * @main function
     * @param theArgs arguments
     * 
     */
    public static void main(final String[] theArgs) {

        final double number1 = 56890.34589;
        
        // 1. Print the above number in US format
        NumberFormat nf = NumberFormat.getInstance(Locale.US); // formatter for the US Locale
        System.out.println(nf.format(number1)); // prints number in US format
        
        // 2. Print the above number in chinese format
        nf = NumberFormat.getInstance(Locale.CHINA); // formatter for the China Locale
        System.out.println(nf.format(number1));
        
        // 3. Print the above number in US dollars
        nf = NumberFormat.getCurrencyInstance(Locale.US); // formatter for US Locale Currency
        System.out.println(nf.format(number1));
        
    }
}
