public class HandlerOnContact 
{
    public static Set<Id> SetOfIDs = new Set<Id>();
    
    public static void allowSameCountry(LIST<Contact> ContList)
    {
        system.debug('enter the class');
        string uname= userinfo.getName();
       //LIST<User> aUser=[SELECT Name,address,city,country,state,street,postalcode FROM USER WHERE Username = : uName limit 1];
        //LIST<Account> accList =[SELECT id from Account WHERE OwnerId in: aUser];
        LIST<Contact> conList =[SELECT name,id,MailingCountry,Account.billingcountry,owner.country FROM Contact WHERE ID in : contList];
        system.debug(contList);
        system.debug(conList);
        for(contact c: contList)
        {
            system.debug(c.MailingCountry+' '+c.account.billingCountry+' '+c.Owner.Country);
            if(c.account.billingCountry!=null)
            {
                if(c.MailingCountry==c.account.billingCountry&&c.MailingCountry==c.Owner.Country)
                {
                    c.adderror('Cannot enter the same address');
                }
            }
        }
        
    }
    public static void contactandAccountAddress(List<Contact> ContList)
    {
        LIST<Account> accList =[SELECT id from Account];
        List<Contact> ConList2 = [SELECT AccountId, Account.ShippingCity,Account.ShippingStreet,Account.ShippingState,Account.ShippingCountry,Account.ShippingPostalCode, MailingCity,MailingStreet,MailingState,MailingCountry,MailingPostalCode 
                               FROM Contact WHERE AccountId IN: accList];
        for(Contact c1: ContList)
        {
            for(Contact c2: ConList2)
            {
                if(c1.accountid==c2.accountid)
                {
                     c2.MailingCity = c2.Account.ShippingCity;
                     c2.MailingState = c2.Account.ShippingState;
                     c2.MailingCountry = c2.Account.ShippingCountry;
                     c2.MailingStreet = c2.Account.ShippingStreet;
                     c2.MailingPostalCode = c2.Account.ShippingPostalCode;
                }
            }
        }
        update ConList2;
        
    }
    public static void allowMultipleContact(LIST<Contact>ContList)
    {
        LIST<Account> acList=[Select name from Account where Allow_Multiple__c!=true];
        List<Contact> ConList =[SELECT name,AccountID FROM Contact where AccountID in:acList];
        system.debug('inside Class before loop============================>>'+acList);
        system.debug('inside Class before loop============================>>'+conList);
		system.debug('inside Class before loop============================>>'+ContList);
        for(Contact a : ContList)
         {
             integer i=0;
             for(Contact b: ConList)
             {
				if(a.accountid==b.accountid)
            	{
               		i++;
                    if(i>2)
                    {
                        break;
                    }
            	}
             }    
             system.debug(i);
             if(i>0)
             {
                 a.adderror('Cannot add more contact');
             }
        }
    }
    public static void contactAddress(List<Contact> contList)
    {
        String uName = UserInfo.getUserName();
        List<Account> accList=NEW LIST<Account>();
        List<Contact> conList=[Select accountid,Account.BillingAddress FROM Contact where id in:ContList];
        User aUser=[SELECT Name,address,city,country,state,street,postalcode FROM USER WHERE Username = : uName limit 1];
        system.debug('inside class before loop==========================='+contList);
        system.debug('inside class before loop==========================='+aUser.Address);
        
		for (Contact c: conList)
		{ 
    		c.MailingCity =aUser.City;
            c.MailingCountry=aUser.Country;
         	c.MailingState=aUser.State;
            c.MailingStreet=aUser.Street;
            c.MailingPostalCode=aUser.PostalCode;
           
            if(c.AccountID!=Null)
            {
                c.Account.BillingCity=aUser.City;
                c.Account.BillingCountry=aUser.Country;
                c.Account.BillingState=aUser.State;
                c.Account.BillingStreet=aUser.Street;
                c.Account.BillingPostalCode=aUser.PostalCode;
                accList.add(c.Account);
            }
            else
            {
                System.debug('NO Account Linked with this Contact');
            }
            
            //c.account.BillingCity =aUser.City;
            //co.OtherCountry=aUser.Country;
         	//co.OtherState=aUser.State;
            //co.OtherStreet=aUser.Street;
            //co.OtherPostalCode=aUser.PostalCode;
           
           
		}
        Update AccList;
        Update ConList;
        system.debug('inside class after loop==========================='+conList);
		
    }

public static void contactAndAccount(List<Contact> contList)
    {        
        LIST<Account> AcList=NEW LIST<Account>();
        LIST <Contact> ContactinClassList = [SELECT LastName,Account.Name FROM Contact WHERE id in:contList];
        system.debug('inside insert class-----'+contList);
        for(Contact c: ContactinClassList)
        {           
            c.Account.name+=c.lastName;
            system.debug(c.Account.name+c.AccountId);
            AcList.add(c.Account);
        }
       Update AcList;
    }
    
    
    public static void deleteContactAndAccount(List<Contact> contList)
    {
        LIST<Account> AcList=NEW LIST<Account>();
        LIST <Contact> ContactinClassList = [SELECT LastName,Account.Name FROM Contact WHERE id in:contList];
        system.debug('inside delete class-----'+contList);
        for(Contact c: ContactinClassList)
        {           
           c.Account.Name = c.Account.Name.replace(c.LastName,'');
             system.debug('inside class loop-----'+ c.Account.Name);
           AcList.add(c.Account);
        }
       Update AcList;
    }
}