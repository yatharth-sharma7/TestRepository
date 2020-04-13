@isTest
public with sharing class CloneOpportunityTest {
    @isTest
    public static void CloneOpportunityTest() {
        List<opportunity> opList = TestDataFactory.createOpportunityAndUpdateEndWithF(10);
        System.assertEquals(10, CloneOpportunity.cloneOpp(opList));
    }
}