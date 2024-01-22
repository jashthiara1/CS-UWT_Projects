/*
 * TCSS 305
 * 
 * File IO example
 */

package exercises;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * This demonstrates I/O using character streams.
 * 
 * @author jthiara
 * @version 1.0
 *
 */
public final class BufferedInputOutputStreamExercise {

    /**
     * private constructor for utility class as no object is going to be created outside the
     * class.
     * 
     */
    private BufferedInputOutputStreamExercise() {

    }

    /**
     * @main function
     * @param theArgs arguments
     * 
     */
    public static void main(final String[] theArgs) {

        /*
         * Use BufferedOutputStream to write the following 2 lines to a new file
         * resources/outputfile2.txt
         * 
         * "I am doing an exercise on BufferedI/O Streams. 
         * Have a nice day"
         */
        try {
            final String workingDirectory = System.getProperty("user.dir");
            final String resourcesPath = workingDirectory + File.separator + "resources";
            final String outputPath = resourcesPath + File.separator + "outputfile.txt";
            
            final FileWriter writer = new FileWriter(outputPath);
            final BufferedWriter bufferedWriter = new BufferedWriter(writer);
            
            bufferedWriter.write("I am doing an exercise on BufferedI/O Streams");
            bufferedWriter.newLine();
            bufferedWriter.write(" Have a nice day ");
            
            bufferedWriter.close();
            writer.close();
        } catch (final IOException e) {
            System.err.print(e);
        }
        
    }

}
