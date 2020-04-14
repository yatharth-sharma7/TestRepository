@isTest
private class TriggerOnAccountHandlerTest {
    
    @testSetup static void init() {
        Account acc = new Account ();
        acc.Name = 'Test Account';
        acc.NumberOfEmployees = 10;
        insert acc;
        Account acc1 = new Account ();
        acc1.Name = 'Test Account1';
        insert acc1;
        List<Contact> contacts = new List<Contact > ();
        contacts.add(new Contact(LastName= 'Test Contact 1', AccountId = acc.Id));
        contacts.add(new Contact(LastName= 'Test Contact 2', AccountId = acc.Id));
        insert contacts;
    }
    
    
    private static testmethod void allowMultipleContactTest(){
        List<Account> acList = [SELECT Id FROM Account WHERE Name = 'Test Account'];
        System.assert(TriggerOnAccountHandler.allowMultipleContact(acList));
    }
    
    private static testmethod void allowMultipleContactTest1(){
        List<Account> acList = [SELECT Id FROM Account WHERE Name = 'Test Account1'];
        System.assertEquals(TriggerOnAccountHandler.allowMultipleContact(acList), false);
    }
    
    private static testmethod void createFieldsTest(){
	List<Account> acList = [SELECT Id, Name, NumberOfEmployees FROM Account];
	TriggerOnAccountHandler.createFields(acList);
}
}