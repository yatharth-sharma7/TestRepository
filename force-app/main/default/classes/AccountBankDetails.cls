public with sharing class AccountBankDetails {
    
    @AuraEnabled  
    public static LIST<Account> fetchAccount() {
        system.debug('FetchData');
        LIST <Account> AcList = [SELECT Id,Name,BankName__c,Addres__c,TotalAmount__c,IFSC__c FROM Account WHERE BankName__c != null LIMIT 1];
        return AcList;
    }
    @AuraEnabled
    public static LIST<Account> updateData(integer amount){
        system.debug('updateData');
        LIST <Account> AcList = [SELECT Id,Name,BankName__c,Addres__c,TotalAmount__c,IFSC__c FROM Account WHERE name like 'Yatharth%' LIMIT 1];
        for(Account a : AcList){
            a.TotalAmount__c+=amount;
        }
        Update AcList;
        return AcList;
    }
}