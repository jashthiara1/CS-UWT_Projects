/*
 * TCSS 305
 * 
 * Class for inheritence example
 */

package exercises.dynamicbinding;

/**
 * Represents the child class.
 * 
 * @author jthiara
 * @version Fall 2021
 *
 */
public class Cat extends Animal {

  

    /**
     * parameterized constructor.
     * 
     * @param theName parameter representing animal name.
     */
    public Cat(final String theName) {
        super(theName);
    }


    
    /**
     * overided walk.
     * 
     * @param theAnimal parameter e.
     */
    @Override
    public void walk(final Animal theAnimal) {
        System.out.println("Cat Walking: " + theAnimal.getMyName());
    }


    /**
     * @main function
     * @param theArgs arguments
     * 
     */
    public static void main(final String[] theArgs) {
        
        final Animal animal = new Animal("Animal");
        final Cat cat = new Cat("Cat");
        final Animal catAsAnimal = new Cat("CatAsAnimal");
        
        //what will be the output for:
        animal.walk(animal);
        animal.walk(cat);
        cat.walk(animal);
        cat.walk(cat);
        catAsAnimal.walk(animal);
        catAsAnimal.walk(cat);
        ((Cat) catAsAnimal).walk(cat);
        
        //output:
        // Animal Walking: Animal
        // Animal Walking: Cat
        // Cat Walking: Animal
        // Cat Walking: Cat
        // Cat Walking: Animal
        // Cat Walking: Cat
        // Cat Walking: Cat
    }

}
