/*
 * TCSS 305
 * 
 * File IO example
 */

package exercises;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * This demonstrates I/O using byte streams.
 * 
 * @author jthiara
 * @version 1.0
 *
 */
public final class FileInputOutputStreamExercise {

    /**
     * private constructor for utility class as no object is going to be created outside the
     * class.
     * 
     */
    private FileInputOutputStreamExercise() {

    }

    /**
     * @main function
     * @param theArgs arguments
     * 
     */
    public static void main(final String[] theArgs) {

        // append characters 'a' to 'z' to the END of outputfile.txt using FileOutputStream
        FileOutputStream out = null;
        
        try {
            final String workingDirectory = System.getProperty("user.dir");
            final String resourcesPath = workingDirectory + File.separator + "resources";
            final String outputPath = resourcesPath + File.separator + "outputfile.txt";
            
            out = new FileOutputStream(outputPath, true);
            
            final int asciiLetterA = 97;
            final int asciiLetterZ = 122;
            
            for (int i = asciiLetterA; i <= asciiLetterZ; i++) {
                out.write((char) i);
            }
            out.close();
        } catch (final IOException e) {
            System.out.println(e);
        }
        
    }

}
