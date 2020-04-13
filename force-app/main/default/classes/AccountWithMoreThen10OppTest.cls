@isTest
public  class AccountWithMoreThen10OppTest {
    @isTest
    public static void AccountWithMoreThen10OppTest() {
        List<Account> acList=TestDataFactory.createAccount(1);
        System.AssertEquals(11,AccountsWithMoreThan10Opp.getAccounts(acList));
    }
}