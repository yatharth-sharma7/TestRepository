trigger TriggerOnLead on Lead (before insert) 
{
    if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            system.debug('inside trigger==========================='+trigger.new);
            LIST<Lead> ldList=New List<Lead>();
            for(LEAD ld:trigger.new)
            {
                ldList.add(ld);
            }
            if(ldList.size()>0)
            {
                system.debug('inside trigger==========================='+ldList);
                HandlerOnLead.beforeInsert(ldList);
            }
        }
        
    }
   
}