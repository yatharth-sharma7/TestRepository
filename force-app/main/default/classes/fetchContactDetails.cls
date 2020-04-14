public class fetchContactDetails {
    @AuraEnabled
    public static List<Contact> fetchContactList(){
        return  [select Id, name, Account.name, Email from contact limit 10];
    }
}