/*
 * TCSS 305
 * 
 * Class for inheritence example
 */

package exercises.staticbinding;

/**
 * Represents the child class.
 * 
 * @author jthiara
 * @version Fall 2O21
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
     * overloaded walk.
     * 
     * @param theAnimal parameter e.
     */
    public void walk(final Cat theAnimal) {
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
        
        // OUTPUT:
        // Animal Walking: Animal
        // Animal Walking: Cat
        // Cat Walking: Animal
        // Cat Walking: Cat
        // Animal Walking: Animal
        // Animal Walking: Cat
        // Cat Walking: Cat
        //
    }

}
