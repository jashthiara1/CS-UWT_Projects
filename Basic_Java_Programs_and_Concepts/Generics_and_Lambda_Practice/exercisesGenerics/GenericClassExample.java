
package exercisesGenerics;

/**
 * 
 * 
 * @author jthiara
 * @version Fall 2021
 *
 *@param <T>
 *@param <K>
 */
public class GenericClassExample<T, K> {
    /**
     * generic field of type T.
     */
    private T myElement;
    
    /**
     * generic field of type K.
     */
    private K myElement2;
    
    
    /**
     * Constructor.
     * 
     * @param theObj
     * @param theObj2
     */
    public GenericClassExample(final T theObj, final K theObj2) {
        this.myElement = theObj;
        this.myElement2 = theObj2;
    }
    
    /**
     * getter.
     * 
     * @return T.
     */
    public T getElement() {
        return myElement;
    }
    
    /**
     * getter.
     * 
     * @return K.
     */
    public K getElement2() {
        return myElement2;
    }
}
