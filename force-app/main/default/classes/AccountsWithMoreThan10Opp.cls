public class AccountsWithMoreThan10Opp{
    public static integer getAccounts(List<Account> accList) {

        List<Account> aList = new List<Account>();
            List<Opportunity> opList = [SELECT AccountId FROM Opportunity WHERE StageName = 'Closed WON' AND CloseDate > LAST_MONTH AND CloseDate < NEXT_MONTH AND AccountId in:accList];
            System.debug(opList);
            integer counter;
            for(Account ac : accList)
            {
                for(Opportunity op : opList)
                {
                    if(ac.id == op.AccountId)
                    {
                        counter++;
                    }
                }
                if(counter > 10)
                {
                    System.Debug(ac);
                    aList.add(ac);
                }
                counter = 0;
            }
            INSERT aList;
            return counter;
        }
    }