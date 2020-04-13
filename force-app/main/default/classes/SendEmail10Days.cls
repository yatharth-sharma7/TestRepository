public with sharing class SendEmail10Days {
    public static Integer funcOfSendEmail10Days(List<Account> accList) {
        // List<Account> acclist = [SELECT Id, name FROM Account LIMIT 5];
        List<Contact> ccList = [SELECT id, AccountId, Email,name FROM Contact WHERE Email!=NULL AND AccountId IN: accList LIMIT 5];
        List<Opportunity> opList = [SELECT id, AccountId, name, StageName,CloseDate FROM Opportunity WHERE AccountId IN: AccList AND  CloseDate <= NEXT_N_DAYS:10];
        integer i=0;
        for(Opportunity op : opList)
        {
            for(Contact c : ccList)
            {
                if(op.AccountId == c.Accountid)
                {
                    i++;
                    /*Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    
                    List<String> sendTo = new List<String>();
                    sendTo.add(c.Email);
                    mail.setToAddresses(sendTo);
                    
                    mail.setSubject('Opportunity Details');
                
                    String body = 'Dear\t'+c.name+',<br>Your opportunity'+op.name+'\t is closing on\t'+op.CloseDate+'that is on\t'+op.StageName;     
                    mail.setHtmlBody(body);
                    
                    Messaging.Email[] mails = new Messaging.Email[]{mail};
                    Messaging.SendEmail(mails);*/
                }
            }
        }
        return i;
    }
}