@isTest
public with sharing class Q11_TestClassFroQ11_Test {
    @isTest
    public static void funcOfQ11_TestClassFroQ11_Test() {
        List<user> usrList = TestDataFactory.createUser();
        List<Lead> leadList = TestDataFactory.createLead(20,usrList);
        String CRON_EXP = '0 0 0 1/1 * ? *';
        Q11_SchedulableClassForQ11 Q11 = new Q11_SchedulableClassForQ11();
        Test.startTest();
        System.schedule('updateAccountEvery5Minutes',CRON_EXP,Q11);
        Test.stopTest();
        
    }
    @isTest
    public static void funcOfQ11_TestClassFroQ11Batch_Test() {
        List<user> usrList = TestDataFactory.createUser();
        List<Lead> leadList = TestDataFactory.createLead(1,usrList);
        Q11_FetchLeadAndSendEmail Q12 = new Q11_FetchLeadAndSendEmail();
        Test.startTest();
        Database.executeBatch(Q12);
        Test.stopTest();
    }

}