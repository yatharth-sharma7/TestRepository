public with sharing class WrapperOpp {

    public List<wrapper> lstwrap {get;set;}

    public WrapperOpp(){

        lstwrap=new List<wrapper>();
        List<account> lstacccon=[select id,name,rating,industry,site, (select id,name,Email,phone from contacts) from account limit 10];
        List<account> lstaccopp=[select id, (select id,name,stageName,probability from opportunities) from account where id in:lstacccon];
        for(account ac:lstacccon){
            for(account ac1:lstaccopp)
            if(ac.id==ac1.id){
                lstwrap.add(new wrapper(ac,ac.contacts,ac1.opportunities));
            }
        }
    }  

    public class wrapper{
        public account acc{get;set;}
        public List<contact> con{get;set;}
        public List<Opportunity> opp{get;set;}
        
        public wrapper(account a, List<contact> c, List<Opportunity> o){
            acc=a;
            con=c;
            opp=o;
        }
    }
  
}