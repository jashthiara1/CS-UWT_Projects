/** 
 * TCSS 305
 * 
 * Compositie Layout
 * 
 */

package exercises;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

/**
 * 
 * @author jthiara
 * @version FALL 2021
 */

public class Composite extends JPanel{
    /*
     * Recreate the gui given in slide 16 of GUI Part 2
     * 
     */
    
    public Composite() {
        super();
    }
    
    public void setUpComponents() {
        setLayout(new BorderLayout());
        final JPanel jP = new JPanel();
        jP.setLayout(new FlowLayout());
        final JButton but1 = new JButton("Button 1");
        final JButton but2 = new JButton("Button 2");
        jP.add(but1);
        jP.add(but2);
        
        final JButton but3 = new JButton("Center Button");
        add(jP, BorderLayout.NORTH);
        add(but3, BorderLayout.CENTER);
        
    }
    
    public static void main(final String[] theArgs) {
        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                final Composite panel = new Composite();
                panel.setUpComponents();
                final Dimension size = new Dimension(400, 400);
                final JFrame window = new JFrame("Composite Exercise");
                window.setSize(size);
                window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                window.setContentPane(panel);
                window.setVisible(true);
                
            }
        });
    }
}
