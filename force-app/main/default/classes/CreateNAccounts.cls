public  class CreateNAccounts {
    public static integer funcOfCreateNAccounts(integer n) {
        List<Account> accList2 = new List<account>();
        Integer a;
        for(a=1;a<=n;a++)
        {
            Account a2 = new Account();
            a2.Name= 'Samsung'+ a;
            a2.Annualrevenue= 2000;
            a2.Site= 'abc.com';
            a2.Description= 'About the company';

            accList2.add(a2);
            
        }
        INSERT accList2;
        return accList2.size();    
    }
}