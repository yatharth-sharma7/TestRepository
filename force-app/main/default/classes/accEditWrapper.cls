public with sharing class accEditWrapper {
    @AuraEnabled Public Account accRecord {get;set;}
    @AuraEnabled Public boolean isEdited {get;set;}
    
    public accEditWrapper() {
        Account accRecord = new Account();
        boolean isEdited = false;
    }

}