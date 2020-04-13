@isTest
public class TestForTestExample {
    public static testMethod void NewAccountCreationTestMethod(){
        ClassForTestExample accountCreation = new ClassForTestExample ();
        Account acc = new Account();
        acc.name = 'NewAccount';
        insert acc;
        accountCreation.save();
    }
}