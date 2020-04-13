@isTest
public with sharing class CopyAttachementToAsoContactTest {
    @isTest
    private static void copyAttachWithAcc() {

        List<Account> accList = TestDataFactory.createAccount(1);
        List<Attachment> attList = TestDataFactory.createAttchment(accList);
        List<Contact> conList = TestDataFactory.createContactAssoWithAcc(accList);
        List<Attachment> actual = CopyAttachmentToAsoContacts.copyAttch(accList);
        System.assertEquals(attList[0].Name, actual[0].Name);
    }
}