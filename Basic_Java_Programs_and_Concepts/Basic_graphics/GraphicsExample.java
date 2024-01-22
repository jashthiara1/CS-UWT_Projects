package exercise;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Shape;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Rectangle2D;
import javax.swing.JFrame;
import javax.swing.JPanel;

/**
 * Class demonstrates creating shapes on a panel.
 * 
 * @author jthiara
 * @version FAll 2021
 */
public class GraphicsExample extends JPanel {
    /*
     * 1. draw the shown figure 
     * 
     * 
     * 
     */
    /**
     * Serial version UID.
     */
    private static final long serialVersionUID = 27L;
    
    /**
     * field for width of panel.
     */
    private static final int WIDTH = 600;
    
    /**
     * field for height of panel.
     */
    private static final int HEIGHT = 400;
    
    public GraphicsExample() {
        super();
        setBackground(Color.white);
        setPreferredSize(new Dimension(WIDTH, HEIGHT));
    }
    
    @Override
    public void paintComponent(final Graphics theGraphics) {
        super.paintComponent(theGraphics);
        final Graphics2D g2d = (Graphics2D) theGraphics;
        
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        
        final Shape bigRectangle = new Rectangle2D.Double(0, 0, 100, 400);
        g2d.draw(bigRectangle);
        final Shape smallRectangle = new Rectangle2D.Double(0, 0, 100, 100);
        g2d.fill(smallRectangle);
        g2d.draw(smallRectangle);
        
        final Shape bigEllipse = new Ellipse2D.Double(100, 0, 400, 400);
        g2d.setPaint(Color.black);
        g2d.setStroke(new BasicStroke(1));
        g2d.draw(bigEllipse);
        final Shape smallEllipse = new Ellipse2D.Double(200, 200, 200, 200);
        g2d.draw(smallEllipse);
        g2d.fill(smallEllipse);
        
        final Shape rightRectangle = new Rectangle2D.Double(500, 0, 100, 400);
        g2d.draw(rightRectangle);
        final Shape rightSmallRectangle = new Rectangle2D.Double(500, 300, 100, 100);
        g2d.fill(rightSmallRectangle);
        g2d.draw(rightSmallRectangle);
    }

    public static void main(final String... theArgs) {
        final GraphicsExample drawBoard = new GraphicsExample();
        drawBoard.setSize(HEIGHT, WIDTH);
        final JFrame frame = new JFrame("Graphics Example"); 
        frame.add(drawBoard);
        frame.setLocationByPlatform(true);
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}
