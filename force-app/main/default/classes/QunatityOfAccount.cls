public class QunatityOfAccount{
    public static integer funcofQunatityOfAccount(List<Account> acc){
        //List<Opportuntiy> oli=[SELECT name,ID from Opportunity where accountID in:acc]
        AggregateResult[] tq = [SELECT SUM(Quantity) retValue From OpportunityLineItem WHERE Opportunity.Account.Working_In__c includes('ASIA') AND Opportunity.AccountId in:acc];
        object retValue = tq[0].get('retValue');
        integer ans= INteger.valueOf(retValue);
        system.debug(ans);
        return ans;
    }
}