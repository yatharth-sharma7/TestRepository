trigger Trigger2Contact on Contact (before insert) 
{
    if(trigger.isbefore)
    {
        if(trigger.isinsert)
        {
            system.debug('inside trigger');
             LIST<Contact>contList = NEW LIST <Contact>();
            system.debug('inside trigger before loop============================>>'+trigger.new);
            for(Contact c :trigger.new)
            {
                {   
                    if(c.SAME_COUNTRY_AS_USER_COMPANY__c!=true)
                    {
                            contList.add(c);  
                    }
                }
            }
            system.debug('trigger inside accout fetched-----------------------------'+contList);
    
            if(contList.size()>0)
            {
                //HandlerOnContact.allowMultipleContact(ContList);
                Class2Trigger.functionOfContact(ContList);
            }
        }
    }
}