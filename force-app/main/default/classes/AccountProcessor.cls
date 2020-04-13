global class AccountProcessor {
	@future
    public static void countContacts(List<Id> AccountIDs){
		list<Account> acList=[SELECT name from Account where Id in: AccountIDs];
        list<Contact> contList =[SELECT name,accountId from Contact where AccountID in: acList];
        integer i=0;
        for(Account a:acList){
            for(Contact c: contList){
                if(a.id==c.AccountId){
                   i++; 
                }
            }
            a.Number_of_Contacts__c=i;
            i=0;
        }
        update acList;   
    } 
}