global with sharing class Q11_FetchLeadAndSendEmail implements Database.Batchable<SObject>{
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id,OwnerID FROM Lead');

    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        Profile p = [SELECT Id,Name FROM Profile WHERE Name = 'System Administrator'];
        List<User> usrList = [SELECT id, Email,ProfileId FROM User WHERE ProfileId = :p.id];
        for(lead l :scope){
        for(User u: usrList){
          
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {u.Email};
            mail.setToAddresses(toAddresses);

            mail.setPlainTextBody('You have leads with no phone number...');
            mail.setSenderDisplayName('Lead Notifier');
            mail.setSubject('Blank Lead.Phone Field');
            if(Test.isRunningTest()){
                Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
            }
            
        }
    }
    }

    global void finish(Database.BatchableContext bc){
       
        System.debug('Lead Fetch Detail Done');
    }
}