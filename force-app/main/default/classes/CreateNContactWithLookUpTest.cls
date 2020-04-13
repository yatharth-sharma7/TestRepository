@isTest
public with sharing class CreateNContactWithLookUpTest {
    @isTest
    public static void funOfCreateNContactWithLookUpTest(){
        List<Account> accList =TestDataFactory.createAccount(10);
        system.assertEquals(10, CreateNContactWithLookUp.funcOfCreateNContactWithLookUp(accList));
    }
}