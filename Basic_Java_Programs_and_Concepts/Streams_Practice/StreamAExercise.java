/*
 * streams.
 */

package exercisesStreams;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * 
 * 
 * @author jthiara
 * @version 1.0. Stream creation.
 *
 */

public class StreamAExercise {

    /**
     * return a stream from a list of strings, if the list is empty, return an empty stream.
     * 
     * @param theStrList
     * @return stream
     */
    public Stream<String> createStream1(final List<String> theStrList) {
        Stream<String> stream1 = Stream.empty();
        if (theStrList.isEmpty()) {
            return stream1;
        } else {
            stream1 = theStrList.stream();
            return stream1;
        }

    }

    /**
     * create a stream of 10 contiguous odd numbers starting from 101 and print them.
     * 
     */

    public void createStream2() {
        final int x = 101; //variables to eliminate magic number error.
        final int y = 10;
        Stream.iterate(x, a -> a + 2).limit(y).forEach(a -> System.out.println(a + " "));

    }

    /**
     * 
     * using iterate print the following series upto 20 elements 0 1 1 2 3 5 .....
     * 
     * 
     */

    public void series() {
        final int z = 20; // avoid magic number error
        Stream.iterate(new int[] {0, 1}, n -> new int[] {n[1], (n[0]) + n[1]}).limit(z).forEach(x -> System.out.println(x[0]));
    }

    /**
     * Main method.
     * 
     * @param theArgs arguments.
     */
    public static void main(final String[] theArgs) {
        final StreamAExercise s = new StreamAExercise();
        // s.createStream1(new ArrayList<String>());
        s.series();
        // s.createStream2();

    }
}
