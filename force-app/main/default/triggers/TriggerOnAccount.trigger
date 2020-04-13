trigger TriggerOnAccount on Account (after insert, before insert) 
{
    LIST<Account>accList = NEW LIST <Account>();
    if(trigger.isbefore)
    {
        if(trigger.isinsert)
        {
            for(Account a :trigger.new)
            {
                {
                    if(a.Allow_Multiple__c!=true)
                    {
                        accList.add(a);    
                    }
                    
                }
            }
            system.debug('trigger inside accout fetched-----------------------------'+accList);
            
            if(accList.size()>0)
            {
                TriggerOnAccountHandler.allowMultipleContact(acclist);
                
            }
        }
    }
    else if (trigger.isAfter &&false)
    {
        if(trigger.isInsert)
        {
            for(Account a :trigger.new)
            {
                {
                    accList.add(a);
                }
            }
            system.debug('trigger inside accout fetched-----------------------------'+accList);
            
            if(accList.size()>0)
            {
                TriggerOnAccountHandler.createFields(acclist);
            }
        }      
    }
}