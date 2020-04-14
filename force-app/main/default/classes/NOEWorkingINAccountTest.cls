@isTest
public class NOEWorkingINAccountTest {
  
    @isTest
    static void testFuncOfNOEWorkingINAccountTest() {
        List<Account> accList=TestDataFactory.createAccount(10);

        NOEWorkingINAccount NOE = New NOEWorkingINAccount();
        System.AssertEquals(10,NOE.funcOfNOEWorkingINAccount(accList));
    }
}