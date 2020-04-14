public with sharing class CopyAttachmentToAsoContacts {

    public static List<Attachment> copyAttch(List<Account> accList){
         // List<Account> accList = new List<Account>();
        // accList = [SELECT Id FROM Account LIMIT 100];
        List<Attachment> atList1 = new List<Attachment>();
        if(accList.size()>0){

                List<Attachment> atList = new List<Attachment>();
                atList = [SELECT Name,ParentId,body FROM Attachment WHERE ParentId IN: accList];
                system.debug('attache;==>\t'+atList);

                List<Contact> ccList = new List<Contact>();
                ccList = [SELECT AccountId FROM Contact WHERE AccountId IN: accList];
                System.debug('Contact==>\t'+ccList);

                for(Contact c : ccList)
                {
                    for(Attachment a: atList)
                    {
                        Attachment newAt = new Attachment(Name = a.Name, ParentId = c.Id, Body = a.body);
                        atList1.add(newAt);
                    }
                }
                INSERT atList1;
                
            }
           /* else{
                CalloutException e = new CalloutException();
                e.setMessage('ACCOUNT LIST EMPTY');
                if(!Test.isRunningTest()){
                    throw e;
                }
            }*/
            return atList1;
        }
}