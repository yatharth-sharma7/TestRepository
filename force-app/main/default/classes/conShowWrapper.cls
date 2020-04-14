public with sharing class conShowWrapper {

    @AuraEnabled Public Contact conRecord {get;set;}
    @AuraEnabled Public boolean isEdited {get;set;}
    
    public conShowWrapper() {
        Contact conRecord= new Contact();
        boolean isEdited = false;
    }
}