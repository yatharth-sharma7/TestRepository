trigger TriggerOnOpportunityLineItem on OpportunityLineItem (before insert) 
{
    if(trigger.isbefore)
    {
        if(trigger.isinsert)
        {
            LIST<OpportunityLineItem>opliList = NEW LIST<OpportunityLineItem>();
    
            for(OpportunitylineItem oli:trigger.new)
            {
                opliList.add(oli);
            }
    
            if(opliList.size()>0)
            {
                HandlerOnOpportunityLineItem.checkOnOpportunityLineItem(opliList);
            }
            else
            {
                system.debug('List Is Empty');
            }
        }
    }
}