@isTest
public with sharing class AccountInAscendingTest {
    @isTest
    public static void funcOfAccountInAscendingTest() {
        List<Account>accList=TestDataFactory.createAccount(10);
        System.Assert(True,AccountInAscending.funcOfAccountInAscending(accList));
    }
}