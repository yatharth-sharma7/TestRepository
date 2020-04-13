public class Handlerclassofcampaign 
{
	public static void campaignmanager(LIST<Campaign>Cmp)
    {
    	system.debug('campaign list in class======================================='+Cmp);
		List<Opportunity>oppList =[SELECT name,CampaignId,StageName,(SELECT Id FROM OpportunityLineItems)From Opportunity WHERE CampaignID IN: cmp]; 
   		integer i=0;
   		for(Campaign a:Cmp)
   		{	
           	system.debug(a);
    		for(Opportunity op: oppList)
        	{
             	if(a.id==op.CampaignID)
                {
                   	system.debug(op);
            		if(op.OpportunityLineItems.size()==0)
    				{
                      	system.debug('Lost');
      					op.StageName='Close Lost';  
    				}
            		else
            		{
                       	system.debug('won');
                		op.StageName='Close Won';
            		}
                    i=0;
                }	
        	}
            update oppList;
    	}  
    }  
}