@isTest
public with sharing class LeadListTest {
    @isTest
    public static void LeadListTest() {
        List<Lead> lds= TestDataFactory.createLead(10);
        system.assertEquals(10, LeadList.funcOfLeadList(lds));
    }
}