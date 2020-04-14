public with sharing class AccountController_LWC {
    
    @AuraEnabled 
    public static List<Account> fetchAccount() {
        return [SELECT id,Name,Phone,Website,NumberOfEmployees FROM Account LIMIT 25];
    }

    @AuraEnabled
    public static List<Contact> fetchContacts(string PassId){
        System.debug(PassId);
        System.debug('inside FetchContact');
        return [SELECT id,Name,Title,Phone,Email,AccountId FROM Contact WHERE accountID=:PassId];
    }

    @AuraEnabled
    public static Boolean deleteRecord(string PassId){
        System.debug(PassId);
        System.debug('inside DeleteRecord');
        try{
            List<Account> accToDel = [SELECT Name FROM Account WHERE Id =: PassId ];
            System.debug(accToDel);
            Delete accToDel;
            return true;
        }
        catch(Exception e){
            system.debug(e);
            return false;
        }   
    }
    @AuraEnabled
    public static Account saveRecord(Account obj){
        System.debug(obj);
        update(obj);
        return obj;
    }
}