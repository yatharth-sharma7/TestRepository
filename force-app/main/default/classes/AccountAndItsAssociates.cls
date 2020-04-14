public with sharing class AccountAndItsAssociates {

    
    @AuraEnabled
    public static List<wrapper> wrapperMethod() {
        List<wrapper> lstwrap;
        lstwrap=new List<wrapper>();

        List<Account> AccList = [SELECT id,name,rating,industry,site FROM Account LIMIT 3];
        List<Opportunity> OppList =[SELECT id,name,stageName,probability,AccountID FROM Opportunity WHERE AccountID in: AccList];
        List<Contact> ConList = [SELECT id,AccountID,name,Email,phone FROM Contact WHERE AccountID in: AccList];

        MAP<ID,List<Contact>> AccIDvsConcact = NEW MAP <id,List<Contact>>();
        MAP<ID,List<Opportunity>> AccIDvsOpportunity = NEW MAP <id,List<Opportunity>>();
        
        for(Contact c:ConList){
            if(!(AccIDvsConcact.containsKey(c.AccountID))){
                AccIDvsConcact.put(c.AccountID,NEW LIST<Contact>());
            }
            AccIDvsConcact.get(c.AccountID).add(c);
        }

        for(Opportunity o:OppList){
            if(!(AccIDvsOpportunity.containsKey(o.AccountID))){
                AccIDvsOpportunity.put(o.AccountID,NEW LIST<Opportunity>());
            }
            AccIDvsOpportunity.get(o.AccountID).add(o);
        }

        for(Account a:AccList){
            List<Contact> con;
            List<Opportunity> opp;
            if(AccIDvsConcact.containsKey(a.id)){
                con= AccIDvsConcact.get(a.id);
            }
            if(AccIDvsOpportunity.containsKey(a.id)){
                opp= AccIDvsOpportunity.get(a.id);
            }

            lstwrap.add(new wrapper(a,con,opp));
        }
        return lstwrap;
    }

    public class wrapper{
        @AuraEnabled public account acc{get;set;}
        @AuraEnabled public List<contact> cont{get;set;}
        @AuraEnabled public List<Opportunity> oppl{get;set;}
        
        public wrapper(account a, List<contact> c, List<Opportunity> o){
            acc=a;
            cont=c;
            oppl=o;
        }
    }
}