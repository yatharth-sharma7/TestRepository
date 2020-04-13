public class HandlerOnOpportunityLineItem 
{
	public static void checkOnOpportunityLineItem(LIST<OpportunityLineItem> oli)
    {
        system.debug('in Handler Class============================'+oli);
     	LIST<Opportunity>Opp = [SELECT id,(SELECT Id FROM OpportunityLineItems WHERE ID IN:oli)FROM Opportunity];
        
        for(Opportunity o:Opp)
        {
            if(o.OpportunityLineItems.size()>2)
            {
                o.addError('Limit Exceded of 2 Opportunity Line Item');
            }
            //else
            //{
             //   Opp.add(o);
            //}
        }
    }

}