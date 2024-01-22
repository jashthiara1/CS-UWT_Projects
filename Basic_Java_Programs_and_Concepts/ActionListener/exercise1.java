/** 
 * TCSS 305
 * 
 * exercise 1
 * 
 */
package exercises;

import java.awt.Color;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import listerners.ListnerExample1;
/**
 * 
 * @author jthiara
 * @version FALL 2021
 */

public class exercise1 extends JFrame {

    /*
     * Q1. create a frame 400*400, add a panel, add a button to a panel named
     * "click me"
     * 
     *  Q2. create a label with text "Is clicked?" and add it to the panel
     *  
     *  Q3. when the button is
     * clicked, the labels text should be changed to "Yes"
     * 
     * Q4. when the button is clicked, a MessgageDialog with information message
     * "You have clicked the box" should appear.
     * 
     */
    
    /**
     * size constant.
     */
    private static final int SIZE = 400; // prevents magic number error

    public exercise1() {
        super();
    }
    
    public void start() {
        setSize(SIZE, SIZE);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
        
        final JPanel panel = new JPanel();
        add(panel);
        panel.setVisible(true);
        
        final JButton but1 = new JButton("Click me");
        panel.add(but1);
        panel.setVisible(true);
        
        final JLabel lab = new JLabel("Is Clicked?");
        lab.setVisible(true);
        panel.add(lab);
        
        but1.addActionListener(new ActionListener() {
            public void actionPerformed(final ActionEvent theEv) {
                lab.setText("Yes");
                JOptionPane.showMessageDialog(null, "You have clicked the box");
            }
        });                 
    }
        
    public static void main(final String[] theArgs) {
        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                final exercise1 frame = new exercise1();
                frame.start();
                  
            }
        }); 
    }

}
