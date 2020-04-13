@isTest
public with sharing class AccountProcessorTest {
    @isTest
    public static void funcOfAccountProcessorTest() {
        Test.startTest();
        List <ID> AccountIDs=TestDataFactory.CreateAccountAndContact(10);
        Test.stopTest();
        AccountProcessor.countContacts(AccountIDs);
    }
}