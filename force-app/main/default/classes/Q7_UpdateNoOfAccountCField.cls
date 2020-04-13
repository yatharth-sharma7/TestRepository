global with sharing class Q7_UpdateNoOfAccountCField implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id,Name,(SELECT Id FROM Contacts) FROM Account LIMIT 5';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> scope){
        list<Account> accList = new list<Account>();
        for(Account acc: scope){
            acc.Number_of_Contacts__c= acc.Contacts.size();
            accList.add(acc);
            }
        system.debug('accList — '+ accList);
        update accList;
    }
    global void finish(Database.BatchableContext BC){
        System.debug('Insertion done');
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        mail.setToAddresses(new String[] {'yatharth.sharma@cloudanalogy.com'});
        mail.setreplyto('yatharth.sharma@cloudanalogy.com');
        mail.setSenderDisplayName('Batch Processing');
        mail.setSubject('Batch Process Completed');
        mail.setPlainTextBody('Batch Process has completed');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}