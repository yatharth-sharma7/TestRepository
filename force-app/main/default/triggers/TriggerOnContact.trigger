trigger TriggerOnContact on Contact (Before insert,Before Update,Before delete,after insert,after Update)  
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
                HandlerOnContact.allowSameCountry(ContList);
            }
        }
      /*  if(trigger.isUpdate)
        {
             LIST<Contact>contList = NEW LIST <Contact>();
            system.debug('inside trigger before loop============================>>'+trigger.new);
            for(Contact c :trigger.new)
            {
                {   
                    if(c.Account.Allow_Multiple__c!=true)
                    {
                        If(!HandlerOnContact.SetOfIDs.contains(c.Id))
                        {
                            contList.add(c);
                            HandlerOnContact.SetOfIDs.add(c.Id);
                        }  
                    }
                }
            }
            system.debug('trigger inside accout fetched-----------------------------'+contList);
    
            if(contList.size()>0)
            {
                HandlerOnContact.allowMultipleContact(ContList);
                
            }
        }*/    
        else if(Trigger.isDelete)
        {
             LIST<Contact>contList = NEW LIST <Contact>();
            for(Contact c: trigger.old)
            {
                contList.add(c);   
            }
    
            if(contList.size()>0)
            {   
                system.debug('inside trigger-----'+contList);
                //HandlerOnContact.deleteContactAndAccount(contList);
            }
            else
            {
                system.debug('List is Empty');        
            }
        
        }
   }
    else if(trigger.isafter)
    {
         if(trigger.isInsert)
        {   
            LIST<Contact>contList = NEW LIST <Contact>();
            for(Contact c: trigger.new)
            {
                If(!HandlerOnContact.SetOfIDs.contains(c.Id))
                {
                    contList.add(c);
                    HandlerOnContact.SetOfIDs.add(c.Id);
                }    
            }
            if(contList.size()>0)
            {       
                system.debug('inside trigger-----'+contList);
                //HandlerOnContact.contactAddress(contList);
                HandlerOnContact.contactandAccountAddress(contList);
            }
            else
            {
                system.debug('List is Empty');        
            }
        }
        else if(trigger.isUpdate)
        {   
            LIST<Contact>contList = NEW LIST <Contact>();
            for(Contact c: trigger.new)
            {
                If(!HandlerOnContact.SetOfIDs.contains(c.Id))
                {
                    contList.add(c);
                    HandlerOnContact.SetOfIDs.add(c.Id);
                }     
            }
            if(contList.size()>0)
            {   
                system.debug('inside trigger-----'+contList);
                HandlerOnContact.contactandAccountAddress(contList);
            }
            else
            {
                system.debug('List is Empty');        
            }
        } 
    }
}