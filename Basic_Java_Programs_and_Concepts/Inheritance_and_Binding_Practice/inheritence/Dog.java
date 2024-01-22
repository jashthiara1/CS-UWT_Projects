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
public class Dog extends AbstractAnimal {

    // Q1. extend the AbstractAnimal class
    // Q2. create a parameterized constructor with theName, it should call superclass
    // paramterized constructor
    public Dog(final String theName) {
        super(theName);
    }
    // Q3. In the main method create an object of dog and call the overloaded walking method
    // with parameter "fast"
    // Q4. Add un-implemented abstract method from parent and print "Woof".
    public void talk() {
        System.out.println("Woof");
    }
    // Q5. call the talk method from main function
   
    public static void main(final String[] theArgs) {
        final Dog otherDog = new Dog("rex");
        
        otherDog.walk("fast");
        otherDog.talk();
    }
}
