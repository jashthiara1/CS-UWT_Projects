/*
 * streams.
 */
package exercisesStreams;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 
 * 
 * @author jthiara
 * @version 1.0. Stream creation.
 *
 */
public class StreamCExercise {

    /**
     * check if any of the last 10 numbers in the integer list are divisible by 7.
     * 
     * @param theIntList
     * @return boolean
     */
    public boolean checkDivisibility(final List<Integer> theIntList) {
        final int y = 7; // avoid magic number
        
        final boolean found = theIntList.stream().anyMatch(x -> x % y == 0);
        return found;
    }

    /**
     * print all the numbers from one to ten which end with e.
     * 
     */

    public void printNumbers() {
        final List<String> nums = Arrays.asList("one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten");
        nums.stream().map(s -> s.toLowerCase()).filter(s -> s.endsWith("e")).forEach(System.out::println);
    }

    public static void main(final String[] theArgs) {
        final int z = 50; // avoid magic number error.
        
        final StreamCExercise sC = new StreamCExercise();
        final List<Integer> numList = new ArrayList<>();
        for (int x = 0; x < z; x++) { 
            numList.add(x);
        }
        System.out.println(sC.checkDivisibility(numList));
        sC.printNumbers();
    }

}
