global with sharing class LeadProcessor implements  Database.Batchable<sObject> {
 
    global Database.QueryLocator start(Database.batchableContext bc){
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    global void execute(Database.BatchableContext bc,List<Lead> scope){
        for(lead l:scope){
            l.LeadSource='DreamForce';
        }
        Database.update(scope,false);
    }

    global void finish(Database.BatchableContext bc){
        system.debug('update Done');
    }
}