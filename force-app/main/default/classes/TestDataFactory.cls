@isTest
public with sharing class TestDataFactory {
    static List<Account> newAccount= New List<Account>();
    static List<Contact> newContact = new List<Contact>();
    static List<Opportunity> newOpportunity= New List<Opportunity>();
    static List<Plan__c> newPlan=New List<Plan__c>();
    static List<OpportunityLineItem> newOLI= New List<OpportunityLineItem>();
    static PriceBook2 pBook = New PriceBook2(name='Standard PriceBook',
                                        Id = Test.getStandardPricebookId(),
                                        isActive=True);
    static User UserTest = new User();
    static List<Lead> newLead = New List<Lead>();
    //Create Lead
   /* public static List<Lead> createLead (integer noOfLead){
        for(integer i=0;i<noOfLead;i++){
            Lead l=NEW Lead();
        }
    }*/

    public static PriceBook2 createPricebookAndProducts(){
        PriceBook2 pBook = New PriceBook2(name='Standard PriceBook',
        Id = Test.getStandardPricebookId(),isActive=True);
        return pBook;                                
    }
    //Create Attachment
    public static List<Attachment> createAttchment(List<Account> accList){
        List<Attachment> attList = new List<Attachment>();
        Blob b = Blob.valueOf('Test');
        for(Account a : accList){
            Attachment a1 = new Attachment(Name = 'Test Attachment', ParentId = a.Id, Body = b);
            attList.add(a1);
        }
        INSERT attList;
        return attList;
    }
    //create and Associate contacts
    public static List<Contact> createContactAssoWithAcc(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account a: accList){
            Contact c = new Contact();
            c.LastName = 'Test Contact';
            c.AccountId = a.Id;
            conList.add(c);
        }
        INSERT conList;
        return conList;
    }
    //createLead
    public static List<Lead> createLead(Integer noOfLead,List<user> usr){
       List<Lead> newLead = NEW List<Lead>();
       for(user u : usr){
           for(Integer i=0;i<noOfLead;i++){
            lead ld = NEW lead();
            ld.LastName = 'Lead '+i;
            ld.Company = 'Company '+i;
            ld.ownerID = u.id;
            ld.Status='Open - Not Contacted';
            ld.Records__c='Sellers';
            newLead.add(ld);
        }
    }
        insert newLead;
        return  newLead;
    }
    //createUser
    public static List<User> createUser(){

        Profile a = new Profile(); 
        a = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
 
           List<User> usrList = new List<User>();
           User newUser = new User();
           newUser.Alias = 'LOST1';
           newUser.EmailEncodingKey = 'UTF-8';
           newUser.LanguageLocaleKey = 'en_US';
           newUser.FirstName = 'Lost';
           newUser.LastName = 'One';
           newUser.Email = 'yatharth.sharma@cloudanalogy.com';
           newUser.LocaleSidKey = 'en_US';
           newUser.ProfileId = a.Id;
           newUser.TimeZoneSidKey = 'GMT';
           newUser.UserName = 'yatharth@cloudanalogy.com';
           newUser.UserPermissionsOfflineUser = TRUE;
           newUser.UserPermissionsMarketingUser = TRUE;
           usrList.add(newUser);
       
       INSERT usrList;
       return usrList;
}
    //createAccounts
    public static List<Account> createAccount(integer noOfAccount){
        for(integer i=0;i<noOfAccount;i++){
            Account a=NEW Account();
            a.Name= 'Account'+ a;
            a.NumberOfEmployees=1;
            a.Working_IN__C='ASIA';
            newAccount.add(a);
        }   
        insert newAccount;
        return newAccount;
    }
    //CreateContacts
    public static List<Contact> createContact(Integer noOfContact){
        for(integer i=0;i<noOfContact;i++){
            Contact a=NEW Contact();
            a.Lastname= 'contact'+ i;
            a.FirstName='first Name'+ i;
            a.Title='Mr';
            a.Email= 'XYZ@cloudanalogy.com';
            a.mailingPostalCode='123321';
            newContact.add(a);
        }   
        insert newContact;
        return newContact;
    }
    //CreateEvents
    public static List<Event1__c> createEvent1(Integer numOfEvents){
    LIST <Event1__c> e1 = NEW LIST <Event1__c>();
    for(integer i =0;i<numOfEvents;i++)
    {
        Event1__c e = NEW Event1__c();
        e.Name='Event no' +i;
        e.Event_Date__c= datetime.newInstance(2020+i,10,7);
        e1.add(e);
    }
    Insert e1;
    return e1;
    }

    //createAccountForStringRev
    public static List<Account> createAccountForStringRev(integer noOfAccount){
        for(integer i=0;i<noOfAccount;i++){
            Account a=NEW Account();
            a.Name= 'Account'+ a;
            newAccount.add(a);
        }   
        insert newAccount;
        return newAccount;
    }
    //createOpportunityAndUpdateWithF
    public static List<Opportunity> createOpportunityAndUpdateEndWithF(integer noOfOpportunity){
        List<Opportunity> newOpportunity1= New List<Opportunity>();
        for(integer i=0;i<noOfOpportunity;i++){
            Opportunity a = NEW Opportunity();
            a.Name= 'Opportunity' +i;
            a.CloseDate=date.today();
            a.StageName='Closed Won';
            newOpportunity1.add(a);   
        }  
        insert NewOpportunity1;
        return newOpportunity1;
    }
    //createProductsForProductsWithA
    public static List<Product2> createProductsForProductsWithA(Integer noOfProducts){
        List<Product2> ProductList = New List<Product2>();
        for(integer i=0;i<noOfProducts;i++){
            Product2 pro= new Product2();
            pro.Name='Producta '+i;
            pro.Description=' description A';
            ProductList.add(pro);
        }
        Insert ProductList;
        return ProductList;
    }
    //CreateOpportunity
   public static List<Opportunity> createOpportunity(integer noOfOpportunity){
            for(integer i=0;i<noOfOpportunity;i++){
                Opportunity a = NEW Opportunity();
                a.Name= 'Opportunity' +i;
                a.CloseDate=date.today();
                a.StageName='Closed Won';
                newOpportunity.add(a);   
            } 
        insert newOpportunity;
        for(Opportunity op:newOpportunity){
            Integer i=0;
            if(math.mod(i,2)==0){   
                createOpportunityLineItem(1,op.Id);
            }
            else{
                createOpportunityLineItem(2,op.Id);
            }
        }
        return newOpportunity;
    }
    //CreateOpportunityLineItem
    public static void createOpportunityLineItem(integer noOfOLI,Id oppID){
        
        for(integer i=0;i<noOfOLI;i++){
            OpportunityLineItem a=NEW OpportunityLineItem();
            a.OpportunityId=oppID;
        }
        insert newOLI;  
    }
    //createPlan__c
    public Static List <Plan__c>  createPlan(integer nop){
        for(integer i=0;i<nop;i++){
            Plan__c a=NEW Plan__c();
            a.Name= 'Plan'+ i;
            a.Travel_Hours__c=1;
            if(math.mod(i,2)==0){
                a.Travel_Location__c='A';
            }
            else if(math.mod(i,3)==0){
                a.Travel_Location__c='F';
            }
            else {
                a.Travel_Location__c='B';
            }
         
            newPlan.add(a);
        }   
        insert newPlan;
        return newPlan;
        
    }
    //CreateAccountsReturnOpportunity
    public static list<Account> createAccountsReturnOpportunity(integer NoOfAccounts){
        List<Account> newAcc = NEW List<Account>();
        List<Opportunity> newOpp = NEW List<Opportunity>();
        for(integer i=0;i<NoOfAccounts;i++){
            Account a=NEW Account();
            a.Name= 'Account'+ a;
            newAcc.add(a);
        }   
        insert newAcc;
        integer j=1;
        for(Account ac:newAcc){

            if(math.mod(j,2)==0){
                for(integer i=0;i<15;i++){
                    Opportunity a = NEW Opportunity();
                    a.AccountId=ac.id;
                    a.Name= 'Opportunity' +i;
                    a.CloseDate=date.today();
                    a.StageName='Closed Won';
                    newOpp.add(a);   
                    }
                }
            
            else {
                for(integer i=0;i<1;i++){
                    Opportunity a = NEW Opportunity();
                    a.AccountId=ac.id;
                    a.Name= 'Opportunity' +i;
                    a.CloseDate=system.today().addDays(20);
                    a.StageName='Closed Won';
                    newOpp.add(a);    
                    }
                }
            j++;
        }
        insert newOpp;
        return newAcc;
    }
    public static List<Account> CreateAccountsOportunityAndItsLineItem(integer noOfAccount){
        List<Account> newAcc = NEW List<Account>();
        List<Opportunity> newOpp = NEW List<Opportunity>();
        List<OpportunityLineItem> newOlii = New List<OpportunityLineItem>();
        for(integer i=0;i<NoOfAccount;i++){
            Account a=NEW Account();
            a.Name= 'Account'+ a;
            a.Working_IN__C='ASIA';
            newAcc.add(a);
        }   
        insert newAcc;
        
        for(Account ac:newAcc){
            for(integer i=0;i<2;i++){
                Opportunity a = NEW Opportunity();
                    a.AccountId=ac.id;
                    a.Name= 'Opportunity' +i;
                    a.CloseDate=system.today().addDays(20);
                    a.StageName='Closed Won';
                    newOpp.add(a);    
            }
        }
        insert newOpp;

        pricebook2 priceList=new pricebook2();
        priceList.Name='Algo Pricebook';
        insert priceList;

        List<Product2> ProductList = New List<Product2>();
        for(integer i=0;i<10;i++){
            Product2 pro= new Product2();
            pro.Name='Producta '+i;
            pro.Description=' description A';
            ProductList.add(pro);
        }
        Insert ProductList;
        
        List<PricebookEntry> PBE=new List<PricebookEntry>();
        for(Product2 p:ProductList)
        {
            PricebookEntry PBEList=new PricebookEntry();
            PBEList.product2id=p.id;
            PBEList.pricebook2id=priceList.id;
            PBEList.UnitPrice=1000;
            PBE.add(PBEList);   
        }
        Insert PBE;


        for(Opportunity o: newOpp){
            for(integer j=0;j<5;j++){
                OpportunityLineItem oli=NEW OpportunityLineItem();
                oli.OpportunityId=o.id;
                oli.product2Id=ProductList[j].id;
                oli.Quantity=10;
                oli.totalPrice=100;
                newOlii.add(oli);
            }
        }
        insert newOlii;
        return newAcc;
    }
    //CreateCase
    public static List<Case> CreateCase(integer no){
        List<Account> newAcc = NEW List<Account>();
        for(integer i=0;i<1;i++){
            Account a=NEW Account();
            a.Name= 'Account'+ a;
            a.Working_IN__C='ASIA';
            newAcc.add(a);
        }   
        insert newAcc;

        List<Case> CaseList= new List<Case>();
        for(account a: newAcc){
            for(integer i=0;i<no;i++){
                Case cs= NEW Case();
                cs.AccountId = a.ID;
                cs.Priority='Low';
                cs.Status='New';
                cs.Origin='Phone';
                cs.Type='Mechanical';
                cs.Reason='Installation';
                caseList.add(cs);
            }
        }
        insert caselist;
        return caselist;
    }
    public static List<Account> CreateAccountContactOpportunity(integer noOfAccount){
        List<Opportunity> newOpp = NEW List<Opportunity>();
        List<Contact> newContact = new List<Contact>();
        List<Account> newAcc = NEW List<Account>();
        for(integer i=0;i<noOfAccount;i++){
            Account a=NEW Account();
            a.Name= 'Account'+ a;
            a.Working_IN__C='ASIA';
            newAcc.add(a);
        }   
        insert newAcc;

        for(Account ac:newAcc){
            for(integer i=0;i<5;i++){
                Opportunity a = NEW Opportunity();
                
                    a.AccountId=ac.ID;
                    a.Name= 'Opportunity' +i;
                    a.CloseDate=system.today().addDays(10);
                    a.StageName='Closed Won';
                    newOpp.add(a);    
                
                    Contact c=NEW Contact();
                    a.AccountId=ac.ID;
                    c.Lastname= 'contact'+ i;
                    c.mailingPostalCode='123321';
                    c.Email='yatharth.sharma7@gmail.com';
                    newContact.add(c);
            }
        }
        insert newOpp;
        insert newContact;
        return newAcc;
    }

    public static List<ID> CreateAccountAndContact(integer noOfAccount){
        List<Contact> newContact = new List<Contact>();
        List<Id> accountIds = new List<Id>();
        List<Account> newAcc = NEW List<Account>();
        for(integer i=0;i<noOfAccount;i++){
            Account a=NEW Account();
            a.Name= 'Account'+ a;
            a.Working_IN__C='ASIA';
            newAcc.add(a);
        }   
        insert newAcc;
        
        for(Account acc:newAcc){
            accountIds.add(acc.Id);
        }
    
        for(Account ac:newAcc){
            for(integer i=0;i<5;i++){
                    Contact c=NEW Contact();
                    c.AccountId=ac.ID;
                    c.Lastname= 'contact'+ i;
                    c.mailingPostalCode='123321';
                    c.Email='yatharth.sharma7@gmail.com';
                    newContact.add(c);
            }
        }
        insert newContact;
        return accountIds;
    }

    public static Pricebook2 createPriceBookForCmp(){

        pricebook2 priceList=new pricebook2(ID = test.getStandardPriceBookID(),isActive=TRUE);
        
        //UPDATE p;
        return priceList;
    }
    
    
    public static List<Campaign> createionForCampaign(integer NoOfCampaign,Pricebook2 priceList){
        list<Campaign> newCmp = new list<Campaign>();
        List<Opportunity> newOpp = NEW List<Opportunity>();
        List<OpportunityLineItem> newOlii = New List<OpportunityLineItem>();

        for(integer i=0;i<NoOfCampaign;i++){
            campaign cmp = NEW campaign();
            cmp.name='campaign'+i;
            cmp.status='Completed';
            newCmp.add(cmp);
        }
        //insert newCmp;
        
      
    
        for(Campaign c: newCmp){
            for(integer i=0;i<2;i++){
                Opportunity a = NEW Opportunity();
                    a.CampaignID=c.id;
                    a.Name= 'Opportunity' +i;
                    a.CloseDate=system.today().addDays(20);
                    a.StageName='Closed Won';
                    a.pricebook2id=priceList.id;
                    newOpp.add(a);    
            }
        }
        
        insert newOpp;

        

        List<Product2> ProductList = New List<Product2>();
        for(integer i=0;i<10;i++){
            Product2 pro= new Product2();
            pro.Name='Producta '+i;
            pro.Description=' description A';
            ProductList.add(pro);
        }
        Insert ProductList;
        
        List<PricebookEntry> PBE=new List<PricebookEntry>();
            for(Product2 p:ProductList)
            {
                PricebookEntry PBEList=new PricebookEntry();
                PBEList.product2id=p.id;
                PBEList.pricebook2id=priceList.id;
                PBEList.UnitPrice=1000;
                PBE.add(PBEList);   
            }
            Insert PBE;

        for(Opportunity o: newOpp){
            for(integer j=0;j<5;j++){
                OpportunityLineItem oli=NEW OpportunityLineItem();
                oli.OpportunityId=o.id;
                oli.product2Id=ProductList[j].id;
                oli.Quantity=10;
                oli.totalPrice=100;
                newOlii.add(oli);
            }
        }
        insert newOlii;
        return newCmp;
    }


}