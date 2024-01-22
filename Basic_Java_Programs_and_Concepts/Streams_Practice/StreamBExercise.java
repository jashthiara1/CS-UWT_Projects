/*
 * streams.
 */
package exercisesStreams;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * 
 * 
 * @author jthiara
 * @version 1.0. Stream creation.
 *
 */

public class StreamBExercise {

    /**
     * 
     * create a stream map operation to convert a list of numbers to their squares. The return
     * value must be a list
     * 
     * @param theIntList
     * @return intList2
     */
    public List<Integer> mapOperation(final List<Integer> theIntList) {
        final Stream<Integer> stream1 = theIntList.stream().map(x -> x * x);
        final List<Integer> intList2 = stream1.collect(Collectors.toList());
        return intList2;
    }



    /**
     * 
     * create a stream filter operation to remove the even numbers from a given list of numbers.
     * 
     * @param theIntList
     */

    public void filterOPeration(final List<Integer> theIntList) {
        theIntList.stream().filter(x -> x % 2 != 0).forEach(System.out::println);
    }

    /**
     * 
     * create a stream pipeline to count the number of distinct odd numbers after squaring the
     * numbers in a given list.
     * 
     * @return int counter
     * @param theIntList
     */

    public int pipeline(final List<Integer> theIntList) {
        int counter = 0;
        
        final List<Integer> intList = theIntList.stream().map(s -> s * s).collect(Collectors.toList());
        for (int i = 0; i < intList.size() - 1; i++) {
            counter++;
        }
        return counter;
        
    }

    /**
     * 
     * create a stream reduce operation to find the maximum number in a list.
     * 
     * @param theIntList
     */
    public void reduce(final List<Integer> theIntList) {
        final Optional<Integer> maxNumber = theIntList.stream().reduce((int1, int2) -> int1 > int2 ? int1 : int2);
        System.out.println(maxNumber);
    }
    
    /**
     * Main method.
     * 
     * @param theArgs arguments.
     */
    public static void main(final String[] theArgs) {
        final List<Integer> tempList = new ArrayList<Integer>();
        tempList.add(1);
        tempList.add(2);
        tempList.add(3);

        final StreamBExercise str = new StreamBExercise();

        System.out.println(str.mapOperation(tempList));
        str.filterOPeration(tempList);
        System.out.println(str.pipeline(tempList));
        str.reduce(tempList);
    }
}
