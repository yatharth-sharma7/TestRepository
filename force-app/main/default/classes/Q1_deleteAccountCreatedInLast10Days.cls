global with sharing class Q1_deleteAccountCreatedInLast10Days implements Database.Batchable<sObject>  {
    
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'Select Id,Name from Account Where CreatedDate<=Last_N_Days:10 LIMIT 50000';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope){
        
        Database.delete(scope,false) ;
    }

    global void finish(Database.BatchableContext BC){
        System.debug('Delete done');
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

mail.setToAddresses(new String[] {'yatharth.sharma@cloudanalogy.com'});
mail.setreplyto('yatharth.sharma@cloudanalogy.com');
mail.setSenderDisplayName('Batch Processing');
mail.setSubject('Batch Process Completed');
mail.setPlainTextBody('Batch Process has completed');

Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

}