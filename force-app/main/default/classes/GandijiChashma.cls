public class GandijiChashma{
    public static void funcOfGandijiChashma( List<OpportunityLineItem>oli){
        AggregateResult[] tq = [SELECT SUM(TotalPrice) From OpportunityLineItem WHERE Product2.Name='Gandhiji Chashma' AND Opportunity.StageName='Closed Won' AND Id in:oli];
        system.debug(tq);
    }
}