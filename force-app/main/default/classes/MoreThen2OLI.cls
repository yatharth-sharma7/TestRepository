public class MoreThen2OLI{
    public static Integer funcOfMoreThan2OLI( LIST<Opportunity> opp){
        //LIST<Opportunity> opp = [SELECT Name, StageName,id, CloseDate,Account.Name FROM Opportunity Limit 100];
        LIST<OpportunityLineItem> oli = [SELECT Opportunityid FROM OpportunityLineItem WHERE opportunityid in : opp];
        MAP<id,LIST<OpportunityLineItem>>oppvsoli = NEW MAP<id,LIST<OpportunityLineItem>>();
        integer noOfOpportunity,i=0;
        for(Opportunity o:opp)
        {
            for(OpportunityLineItem ol:oli)
            {
                if(o.id==ol.opportunityID){
                    i++;
                }
            }
            if(i>1)
            {
                i++;
            }
        }
       /* for(OpportunityLineItem ol:oli)
        {
            if(!oppvsoli.containsKey(ol.Opportunityid))
            {
                oppvsoli.put(ol.Opportunityid,NEW LIST<OpportunityLineItem>());
            }
            oppvsoli.get(ol.opportunityid).add(ol);
        }
        for(Opportunity op:opp)
        {
            if(oppvsoli.containskey(op.id))
            {
                LIST<OpportunityLineItem> temp = oppvsoli.get(op.id);
                
                if(temp.size()>1)
                {
                    system.debug(op.Account.name);
                    noOfOpportunity++;
                }
            }
        }*/
        return noOfOpportunity;
    }
}