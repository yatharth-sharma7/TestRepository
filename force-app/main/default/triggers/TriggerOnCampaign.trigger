trigger TriggerOnCampaign on Campaign (After Update)
{
    LIST<Campaign>Cmp=NEW LIST <Campaign>();
    if(trigger.isupdate)
    {
        for(Campaign c:trigger.new)
        {   if(c.status=='Completed')
            {
                Cmp.add(c);
            }
            
        }
        if(Cmp.size()>0)
        {
            system.debug('campaign list in trigger======================================='+Cmp);
            Handlerclassofcampaign.campaignmanager(Cmp);            
        }
        else
        {
            system.debug('List is Empty');
        }
    }    
}