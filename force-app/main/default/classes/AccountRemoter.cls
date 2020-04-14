global with sharing class AccountRemoter {
    public String objectName{get;set;}
    @RemoteAction
    global  static List<Account> getAccount(string objectName) {

        list<Account> accList = new List<Account>();
        String searchString = objectName + '%';
        accList = [select Id,Name,site,owner.name,phone from Account where Name LIKE :searchString]; 
        return accList;
    }
}