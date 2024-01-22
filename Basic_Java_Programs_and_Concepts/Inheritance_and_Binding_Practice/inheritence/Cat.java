/*
 * TCSS 305
 * 
 * Class for inheritence example
 */

package exercises.inheritence;


/**
 * Represents the child class.
 * 
 * @author jthiara
 * @version Fall 2021
 *
 */
public class Cat extends AbstractAnimal {

    // Q1. extend the AbstractAnimal class
    // Q2. create a parameterized constructor with theName, it should call superclass
    // paramterized constructor
    public Cat(final String theName) {
        super(theName);
    }
    // Q3. In the main method create an object of cat and call the overloaded walking method
    // with parameter "slow"
    // Q4. Add un-implemented abstract method from parent and print "meow".
    public void talk() {
        System.out.println("meow");
    }
    // Q5. call the talk method from main function
    
    public static void main(final String[] theArgs) {
        final Cat otherCat = new Cat("lion");
        
        otherCat.walk("slow");
        otherCat.talk();
        
    }
    

}
