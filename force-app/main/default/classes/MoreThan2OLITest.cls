@isTest
public with sharing class MoreThan2OLITest {
    @isTest
    public static void funcOfMoreThen2OLITest(){
        //MoreThen2OLI mO = NEW MoreThen2OLI();
        List<Opportunity> oppList=TestDataFactory.createOpportunity(5);
        System.AssertEquals(2,MoreThen2OLI.funcOfMoreThan2OLI(oppList));
    }
}