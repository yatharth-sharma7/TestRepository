@isTest
public with sharing class AccountHandlerTest {
    @isTest
    public static void AccountHandlerTest() {
        system.assertEquals('xyz',AccountHandler.insertNewAccount('xyz') );
    }
}