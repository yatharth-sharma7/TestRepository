@isTest
public with sharing class  Q4_TestClassForQ4_Test {
    @isTest
    public static void funcOfQ4_TestClassForQ4_Test() {

        List<Opportunity> oppList= TestDataFactory.createOpportunityAndUpdateEndWithF(200);

        Q4_ScheculableClass Q4 = new Q4_ScheculableClass();
        
        Test.startTest();
        string schedule ='0 48 13 1/1 * ? *';
        System.schedule('Schedule everyday At 12 pm',schedule,Q4);
        Test.stopTest();
    }
}