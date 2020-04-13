@isTest
public  class StringRevTest {
    @isTest
    public static void funcOfStringRevTest() {
        List<Account> accList= TestDataFactory.createAccount(10);
        system.assertEquals(10, StringRev.funcOfstringRev(accList));
    }
}