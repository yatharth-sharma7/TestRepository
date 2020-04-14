@isTest
public with sharing class DeleteAccountWithATest {
    @isTest
    public static void DeleteAccountWithATest() {
        List<Contact> contList = TestDataFactory.createContact(10);
        System.assertEquals(0, DeleteAccountWithA.fucnOfDeleteAccountWithA(contList));
    }
}