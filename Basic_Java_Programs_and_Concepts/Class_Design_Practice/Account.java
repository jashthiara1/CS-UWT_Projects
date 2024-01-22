/*
 * This is an exercise on class design
 */
package exercises;

/**
 * Class exercise: Create a Class that reflects a bank account
 * It should not have any warnings or errors.
 * 
 * @author jthiara
 * @version 1.0
 * 
 *
 */
public class Account {
    
    /**
     *  account number.
     */
    private String myAccountNumber;
    
    /**
     * name.
     */
    private String myName;
    
    /**
     * bank balance.
     */
    private double myBalance;
    
    public String getMyAccountNumber() {
        return myAccountNumber;
    }
    
    public void setMyAccountNumber(final String theAccountNumber) {
        this.myAccountNumber = theAccountNumber;
    }
    
    public String getMyName() {
        return myName;
    }
    
    public void setMyName(final String theName) {
        this.myName = theName;
    }
    
    public double getMyBalance() {
        return myBalance;
    }
    
    public void setmyBalance(final double theBalance) {
        this.myBalance = theBalance;
    }
   
    public void depositFunds(final double theDeposit) {
        this.myBalance += theDeposit;
    }
    
    public void withdrawFunds(final double theWithdrawal) {
        this.myBalance -= theWithdrawal;
    }
    
    public static void main(final String[] theArgs) {
        final Account bankaccount = new Account();
        bankaccount.setMyAccountNumber("123456xx9");
        bankaccount.setMyName("Jasharn");
        
        final double balance = 100;
        bankaccount.setmyBalance(balance);
        
        final double withdrawal = 20;
        bankaccount.withdrawFunds(withdrawal);
        
        final double deposit = 200;
        bankaccount.depositFunds(deposit);
        
        /**
         * prints greeting and account information to console
         */
        System.out.println("Welcome to the virtual bank " + bankaccount.getMyName() + "!");
        System.out.println("Your account number is " + bankaccount.getMyAccountNumber());
        System.out.println("Your current balance is $" + bankaccount.getMyBalance());
    }
}
