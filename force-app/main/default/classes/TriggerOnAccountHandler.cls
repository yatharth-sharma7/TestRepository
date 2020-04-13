public class TriggerOnAccountHandler {
    //Method1
    public static Boolean allowMultipleContact(LIST<Account> accList) {
        Map<Id, Integer> accountIdVsContactCount = new Map<Id, Integer> ();
        List<Contact> contacts = [SELECT Id, AccountId FROM Contact WHERE AccountId IN : accList];
        if (!contacts.isEmpty()) {
            for(Contact con : contacts) {
                if (!accountIdVsContactCount.containsKey(con.AccountId)) {
                    accountIdVsContactCount.put(con.AccountId, 1);
                } else {
                    accountIdVsContactCount.put(con.AccountId, accountIdVsContactCount.get(con.AccountId) + 1);                    
                }
            }
            for(Account a : accList) {
                if(accountIdVsContactCount.containsKey(a.Id) && accountIdVsContactCount.get(a.Id) > 1) {
                    system.debug('Cannot Add More than 1 Account');
                    return true;
                }
            }
        }
        return false;
        
    }
    
    //Method2
    public static void createFields(LIST<Account> accList)
    {
        LIST <Contact> conList= NEW LIST <Contact>();
        LIST <Opportunity> oppList= NEW LIST <Opportunity>();
        LIST <Case> caseList= NEW LIST <Case>();
        LIST <OpportunityContactRole> ocrList= NEW LIST <OpportunityContactRole>();
        
        for(Account a:accList)
        {
            for(integer i=0;i<a.NumberOfEmployees;i++)
            {
                Contact c = NEW Contact();
                c.LastName = a.Name+i;
                c.AccountId = a.id;
                conList.add(c);
            }  
            
            Opportunity o = NEW Opportunity();
            o.Name=a.Name+',s Opportunity';
            o.AccountId = a.id;
            o.CloseDate=date.newInstance(2020,10,07);
            o.StageName='Close Won';
            oppList.add(o);
            
            
        }   
        INSERT conList;
        INSERT oppList;
        
        for(Contact c: conList)
        {
            Case cs= NEW Case();
            cs.ContactID=c.id;
            cs.AccountId = c.accountID;
            cs.Status='Working';
            cs.Origin='Web';
            caseList.add(cs);
            
            for(opportunity o: oppList)
            {
                if(o.accountId==c.accountID)
                {
                    OpportunityContactRole ocr =NEW OpportunityContactRole();
                    ocr.ContactId=c.id;
                    ocr.OpportunityId=o.id;
                    ocrList.add(ocr);  
                }
            }
        }
        INSERT ocrList;
        INSERT caseList;
    }
}