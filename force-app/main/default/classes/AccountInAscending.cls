public with sharing class AccountInAscending {
    public  static Boolean funcOfAccountInAscending(LIST<Account> acList) {
        LIST<Account> accList=[SELECT Name FROM Account WHERE id in: acList ORDER BY Name];
        for(Account temp:accList)
        {
            system.debug(temp) ;
            acList.add(temp);
        }
        return True;
    }
}