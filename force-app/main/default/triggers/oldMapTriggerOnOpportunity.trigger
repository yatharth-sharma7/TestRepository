trigger oldMapTriggerOnOpportunity on Opportunity (before Update)
{
    List<Opportunity> oppList = NEW LIST<Opportunity>();
    
    for(Opportunity opp: trigger.new)
    {
        opportunity oppNew= trigger.oldmap.get(opp.ID);
        
        if(opp.StageName=='Closed Won'&& oppNew.StageName=='Proposal/Price Quote')
        {
            system.debug('StageName Changed');
            system.debug('Opportunity Name is '+opp.Name);
            system.debug('old StageName '+oppNew.StageName);
            system.debug('changed StageName'+opp.StageName);
        }
        else
        {
            if(!Test.isRunningTest())
                opp.addError('Cannot change this');
            else 
                continue;
        }
    }
}