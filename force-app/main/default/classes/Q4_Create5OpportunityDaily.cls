global with sharing class Q4_Create5OpportunityDaily implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'Select Id,Name from Opportunity';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope){
        
        List<Opportunity> newOpportunity1= New List<Opportunity>();
        for(integer i=0;i<5;i++){
            Opportunity a = NEW Opportunity();
            a.Name= 'Opportunity' +i;
            a.CloseDate=date.today();
            a.StageName='Closed Won';
            newOpportunity1.add(a);   
        }  
        insert NewOpportunity1;
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