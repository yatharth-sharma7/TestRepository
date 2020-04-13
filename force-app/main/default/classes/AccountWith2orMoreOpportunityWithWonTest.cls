@isTest
public with sharing class AccountWith2orMoreOpportunityWithWonTest {
    @isTest
    public static void funcOfAccountWith2orMoreOpportunityWithWonTest() {
        List<Account> newOpp = TestDataFactory.createAccountsReturnOpportunity(10);
        system.assertEquals(9, AccountWith2orMoreOpportunityWithWon.funcofAccountWith2orMoreOpportunityWithWon(newOpp));

    }
}