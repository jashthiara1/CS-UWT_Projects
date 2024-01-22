/** 
 * TCSS 305
 * 
 * Grid Layout
 * 
 */
package exercises;

import java.awt.EventQueue;
import java.awt.GridLayout;
import javax.swing.JButton;
import javax.swing.JFrame;

/**
 * 
 * @author jthiara
 * @version FALL 2021
 */

public class Grid extends JFrame {
    /*
     * Recreate the gui given in slide 12 of GUI Part 2. 
     * 
     * 
     */
    
    /**
     * 
     */
    private static final long serialVersionUID = 7506577325297837687L;
    
    public void start() {
        setLayout(new GridLayout());
        setTitle("GridLayout");
        add(new JButton("Button 1"));
        add(new JButton("2"));
        add(new JButton("Button 3"));
        add(new JButton("Long-Name Button 4"));
        add(new JButton("Button 5"));
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        pack();
        setResizable(true);
        setVisible(true);
    }
    
        
    public static void main(final String[] theArgs) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Grid().start();
                
            }
        });
    }
}
