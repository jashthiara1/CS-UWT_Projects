/*
 * exercises for gui-1
 */

package exercises;

import java.awt.EventQueue;
import javax.swing.ButtonGroup;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;


/**
 * Class extends JFrame and demonstrates GUI using components and an option pane. 
 * 
 * @author jthiara
 * @version FALL 2021
 */
public class MyFrame extends JFrame {
    
    /**
     * class size constant.
     */
    private static final int CLASS_SIZE = 800;

    /**
     * Serial version uid.
     */
    private static final long serialVersionUID = 1L;

    /*
     * Q1. Display a frame of size 800*800 with title "Course 305". You should extend the the
     * JFrame class. The program should exit on clicking the close button
     */
    
    /**
     * Constructor.
     */
    public MyFrame() {
        super("Course 305");
    }
    
    /**
     * Set up.
     */
    public void start() { 
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(CLASS_SIZE, CLASS_SIZE); // class constant used to avoid magic number error
        
        /*
         * Q2. Add a panel called button panel to the frame
         *
         *
         * Q3. Add a button with text "Join" to the button panel
         * 
         */
        
        // creates a panel and a button component to be added to the panel.
        final JPanel buttonPanel = new JPanel();
        buttonPanel.setBounds(0, 100, 100, 100);
        final JButton button1 = new JButton("Join");
        button1.setBounds(0, 30, 100, 30);
        buttonPanel.add(button1);
        add(buttonPanel);
        
        /*
         * Q4. Add a panel called checkbox panel to the frame
         * 
         *
         * 
         * Q5. Add 1 checkbox with label 305 and by default it should be selected
         * 
         * Q6. Add 2 radiobuttons with labels, good, bad. These radio button should belong to the
         * same button group
         * 
         */
        
        final JPanel checkBoxPanel = new JPanel(); // create panel and adds to frame.
        checkBoxPanel.setBounds(200, 100, 100, 150);
        add(checkBoxPanel);
        
        final JCheckBox checkBox1 = new JCheckBox("305", true); //creates checkbox and adds to checkbox panel
        checkBoxPanel.add(checkBox1);
        
        final JRadioButton r1 = new JRadioButton("Good");
        r1.setBounds(0, 30, 100, 30);
        final JRadioButton r2 = new JRadioButton("Bad");
        r2.setBounds(0, 30, 100, 30);
        
        //add radio buttons to same group.
        final ButtonGroup bg = new ButtonGroup();
        bg.add(r1);
        bg.add(r2);
        
        checkBoxPanel.add(r1); // adds buttons to our panel
        checkBoxPanel.add(r2);
        
        /*
         * Q7. Add a textarea to the frame directly (not to any of the panels)
         * 
         * 
         */
        final JTextArea textArea1 = new JTextArea("Welcome to 305");
        add(textArea1);
        
        setVisible(true);
    }
        
        
      

    /*
     * Q8. When you run your program, first a Confirm dialog box (on top of the created frame) with a message
     * "Are you a student" should appear. If response is yes, do nothing If response is no, show
     * a MessageDialog on top of the frame with an error message "please close the program"
     * with icon "bye.jpg"
     * 
     * 
     * 
     */
    public static void main(final String[] theArgs) {
        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                final MyFrame frame = new MyFrame();
                frame.start();
                final int response = JOptionPane.showConfirmDialog(frame, "Are you a student?"); // ask if user is student
                if (response == JOptionPane.NO_OPTION) { // no option
                    final Icon bye = new ImageIcon("bye.jpg");
                    JOptionPane.showMessageDialog(null, "", "Please close the program", JOptionPane.ERROR_MESSAGE, bye); // error message
                }
               
            }
        });
        
            
    }
}
  
