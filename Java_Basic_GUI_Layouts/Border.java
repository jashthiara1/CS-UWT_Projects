/** 
 * TCSS 305
 * 
 * Border Layout
 * 
 */
package exercises;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;

import javax.swing.*;

import layouts.BorderLayoutDemo;

/**
 * 
 * @author jthiara
 * @version FALL 2021
 */

public class Border extends JPanel {
    
    /*
     * Recreate the gui given in slide 10 of Intro to GUI Part 2
     * 
     */
    public void start() {
        setLayout(new BorderLayout());
        final JButton north = new JButton("Button 1 North");
        add(north, BorderLayout.NORTH);
        final JButton center = new JButton("Button 2 Center");
        add(center, BorderLayout.CENTER);
        final JButton west = new JButton("Button 3 West");
        add(west, BorderLayout.WEST);
        final JButton east = new JButton("Button 5 East");
        add(east, BorderLayout.EAST);
        final JButton south = new JButton("Button 4 South");
        add(south, BorderLayout.SOUTH);
    }

    public static void main(final String[] theArgs) {
        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                final Border mainPanel = new Border();
                mainPanel.start();
                
                final Dimension frameSize = new Dimension(400, 400);
                
                final JFrame window = new JFrame("Demo BorderLayout");
                window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                window.setContentPane(mainPanel);
                window.setSize(frameSize);
                window.setVisible(true);
               
            }
        });
    }
}
