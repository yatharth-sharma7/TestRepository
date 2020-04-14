@isTest
public with sharing class QuantityOfAccountsTest{
    @isTest
    public static void QuantityOfAccountsTest(){
        List<Account> acList = TestDataFactory.CreateAccountsOportunityAndItsLineItem(10);
       System.assertEquals(10, QunatityOfAccount.funcofQunatityOfAccount(acList));

    }

}