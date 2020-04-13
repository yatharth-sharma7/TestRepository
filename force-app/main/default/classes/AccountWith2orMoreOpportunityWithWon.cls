public class AccountWith2orMoreOpportunityWithWon{
    public static integer funcofAccountWith2orMoreOpportunityWithWon(LIST<Account> acc){
        //LIST<Account> acc = [SELECT id,Name FROM ACCOUNT LIMIT 100];
        LIST<Opportunity> opp = [SELECT StageName, CloseDate, AccountID FROM Opportunity WHERE StageName='Closed Won' AND AccountID IN:acc];
        MAP<id,List<opportunity>> acVSop = NEW MAP<id,List<opportunity>>();
        integer i=0,j=0;
        for(account a: acc){
            for(Opportunity o : opp){
                if(o.accountid==a.ID){
                    i++;
                }
            }
            if(i>10)
            {
                j++;
            }
        }
        for(Opportunity o:opp)
        {
            if(!(acVSop.containsKey(o.AccountID))){
                acVSop.put(o.AccountID, NEW LIST<Opportunity>());
            }
            acVSop.get(o.AccountID).add(o);
        }
        for(Account a:acc){
            if(acVSop.containsKey(a.Id)){
                LIST<opportunity> temp = acVSop.get(a.Id);
            
                if(temp.size()>10){
                system.debug(a.name);
                }
            }
        }
        return j;
    }
}