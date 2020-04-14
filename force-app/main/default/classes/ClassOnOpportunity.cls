public class ClassOnOpportunity 
{
    public static void insertBefore23Ques(LIST<Opportunity> opList)
    {
        LIST <Account> accList = [select name,id from Account where Working_In__c includes('ASIA')];
        list<opportunity> opplist =[select accountid ,name from opportunity where StageName='Closed Won' and accountid in: accList];
        
        for(opportunity o1:opList)
        {
            integer i=0;
            for(opportunity o2:oppList)
            {
                if(o1.accountid==o2.accountid)
                {
                    i++;
                }
            }
            if(i>2)
            {
                o1.adderror('Cannot add more');
            }
        }
    }
    public static void insertBeforeOpportunity(LIST<Opportunity> opList)
    {
        LIST<PriceBook2> pBList =[SELECT name From Pricebook2 where name in('ASIA','NA','SA','EMA')];
        for(Opportunity o:opList)
        {
            for(PriceBook2 p:pBList)
            {
                if(o.account.Working_In__c!=p.Name)
                {
                    o.addError('PriceBook Name Not Present In Account');
                }
            }
        }
        
    }
    public static void insertOpportunity(LIST<Opportunity> opList)
    {
       LIST<Opportunity> oppList = NEW LIST <Opportunity>();
    	for(Opportunity a :opList)
    	{
        	if(a.CloseDate<system.Today())
    		{
				a.addError('ENTER FUTURE DATE');
    		}
        	else
        	{
            	oppList.add(a);
        	}
    	} 
    }
    public static void UpdateBeforeOpportunity(LIST<Opportunity> opList)
    {
        LIST<OpportunityLineItem> oliList =[SELECT OpportunityId from OpportunityLineItem WHERE opportunityID IN:opList];
    	integer i=0;
    	for(Opportunity a:opList)
    	{
        	for(OpportunityLineItem oli: oliList)
        	{
           		if(a.id==oli.OpportunityId)
            	{
                	i++;
            	}    
        	}
            if(i>2)
                {
                    a.addError('limit excedeed');
                }
            i=0;
        }
    }
    public static void InsertonOpportunity(LIST<Opportunity> opList)
    {
       List<Account> accList = [SELECT id FROM Account LIMIT 100];
       set<Id> idset = new set<id>();
       for(Account a : accList)
       {
           idset.add(a.id);
       }
       List<Contact> conList = [SELECT id, AccountId FROM Contact WHERE AccountId IN: idset];
       List<OpportunityContactRole> ocrList = new List<OpportunityContactRole>();
       for(Opportunity o : opList)
       {
           for(Contact c: conList)
           {
               if(o.AccountId == c.AccountId)
               {
                   OpportunityContactRole role = new OpportunityContactRole();
                   role.OpportunityId = o.id;
                   role.ContactId = c.id;
                   role.Role = 'Decision Maker';
                   ocrList.add(role);
               }
           }
       }
        INSERT ocrList;       
    }
    public static void updateOpportunity(LIST<Opportunity> opList)
    {
        LIST<OpportunityLineItem> oliList =[SELECT OpportunityId from OpportunityLineItem WHERE opportunityID IN:opList];
    	integer i=0;
    	for(Opportunity a:opList)
    	{
        	for(OpportunityLineItem oli: oliList)
        	{
           		if(a.id==oli.OpportunityId)
            	{
                	i++;
            	}
        	}
        	if(a.StageName=='Closed Won'||a.StageName=='Closed Lost')
        	{
            	if(i==0)
    			{
      				a.addError('Opportunity Line Item Is 0 ');  
    			}                             
        	}
            i=0;
    	}     
    }
    public static void afterUpdateOpportunity(LIST<Opportunity> opList)
    {
        LIST<Case>caseList = NEW LIST<Case>();
    	for(Opportunity a:opList)
        {
            system.debug('inside class to check accountid===========================>>>>'+a.accountID);
            if(a.StageName=='Closed Lost')
            {
                Case cs= NEW Case();
            	//cs.ContactID=c.id;
            	cs.AccountId = a.accountID;
                cs.Priority='Low';
            	cs.Status='New';
            	cs.Origin='Phone';
                cs.Type='Mechanical';
                cs.Reason='Installation';
            	caseList.add(cs);
            }
                
        }
        system.debug('inside class===========================>>>>'+caseList);
        insert caseList;
	}
}