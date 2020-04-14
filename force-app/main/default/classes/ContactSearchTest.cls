@isTest
public with sharing class ContactSearchTest {
    @isTest
    public static void ContactSearchTest() {
        List<Contact> conList=TestDataFactory.createContact(10);
        system.assertEquals(1, ContactSearch.searchForContacts('contact1', '123321', conList));
    }
}