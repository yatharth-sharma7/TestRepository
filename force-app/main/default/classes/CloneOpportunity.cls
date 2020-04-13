public with sharing class CloneOpportunity {
    public static integer cloneOpp(List<Opportunity> opList){
            List<Opportunity> cloneOppor = new List<Opportunity>();
            integer counter=0;
            // List<Opportunity> opptList = [SELECT Name, CloseDate, StageName, (SELECT OpportunityId, UnitPrice, Quantity FROM OpportunityLineItems)FROM Opportunity LIMIT 1];
            for(Opportunity opp : opList){
                counter++;
                Opportunity opprObject = opp.clone();
                opprObject.Name = opp.Name + 'Clone';
                opprObject.CloseDate = opp.CloseDate.addDays(30);
                cloneOppor.add(opprObject);
            }   
            INSERT cloneOppor;
            System.Debug('Clone Opportunity ==>\n'+cloneOppor);
            return counter;
    }
}