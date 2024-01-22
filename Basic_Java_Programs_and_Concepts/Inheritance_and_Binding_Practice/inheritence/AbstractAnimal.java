/*
 * TCSS 305
 * 
 * Class for inheritence example
 */

package exercises.inheritence;

/**
 * Represents the parent class.
 * 
 * @author jthiara
 * @version FALL 2021
 *
 */
public abstract class AbstractAnimal {

   
    
    /**
     * class field name of animal.
     */
    private String myName;

    /**
     * Parameterized constructor.
     * 
     * @param theName parameter name
     */
    public AbstractAnimal(final String theName) {
        this.myName = theName;
    }

    /**
     * getter for myName.
     * 
     * @return myName
     */
    public String getMyName() {
        return myName;
    }

    /**
     * Setter for myName.
     * 
     * @param theName parameter.
     */
    public void setMyName(final String theName) {
        this.myName = theName;
    }
    
    // Q1 create a function walk() -- print animal walks
    public void walk() {
        System.out.println("Animal walks");
    }
    
    // Q2 create a overloaded function walk with parameter String -- print animal walks + string
    /**
     * overloaded walk method.
     * @param theString
     */
    public void walk(final String theString) {
        System.out.println("Animal walks " + theString);
    }
    
    // Q3 create a abstract function talk()
    public abstract void talk();
    

}
