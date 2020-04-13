@isTest
public with sharing class UpdateOpportunityWithFTest {
    @isTest
    public static void UpdateOpportunityWithFTest() {
        List<Opportunity> oppList = TestDataFactory.createOpportunityAndUpdateEndWithF(10);
        System.assertEquals(10,UpdateOpportunityWithF.funcOfUpdateOpportunityWithF(oppList));

    }
}