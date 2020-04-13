public class Class2Trigger
{
	public static void functionOfContact(LIST<Contact> contList)
    {
        system.debug('enter the class');
        string uname= userinfo.getUserName();
        system.debug(uname);
       	User aUser=[SELECT Name FROM USER WHERE Username = : uName];
        system.debug(aUser);
        LIST<Account> accList =[SELECT id,billingCountry,owner.country from Account WHERE BillingCountry != 'Null' AND OwnerId =: aUser.id];
        system.debug(accList);
        system.debug(contList);
        for(Account a:accList)
        {
        	for(contact c:contList)
           {
                if(c.MailingCountry==a.billingCountry&&c.MailingCountry==a.Owner.Country)
                {
                    system.debug('test completed');
                    //c.adderror('Cannot enter the same address');
                }

           }
        }  
    }
}