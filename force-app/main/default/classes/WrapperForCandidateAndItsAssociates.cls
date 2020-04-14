public with sharing class WrapperForCandidateAndItsAssociates {
  
    @AuraEnabled
    public Static List<wrapper> InitMethod() {

        List<wrapper> lstwrap;
        lstwrap=new List<wrapper>();

        List<Candidate__c> CandList = [SELECT id,name,DOB__c,Email__c,Gender__c,Mother_s_Name__c,Phone__c,About_Me__c,Adhaar_Number__c,Father_s_Name__c,Address__c,Status__c FROM Candidate__c LIMIT 20];
        List<Qualification__c> QulList =[SELECT id,CandidateID__c,Course__c,Course_Type__c,Institution__c,Year__c,Percent__c FROM Qualification__c WHERE CandidateID__c in: CandList];
        List<Experience__c> ExpList = [SELECT id,CandidateID__c,Company__c,From__c,Position__c,To__c FROM Experience__c WHERE CandidateID__c in: CandList];

        MAP<ID,List<Qualification__c>>CanIDvsQul = NEW MAP <id,List<Qualification__c>>();
        MAP<ID,List<Experience__c>> CanIDvsExp = NEW MAP <id,List<Experience__c>>();
        
        for(Qualification__c q:QulList){
            if(!(CanIDvsQul.containsKey(q.CandidateID__c))){
                CanIDvsQul.put(q.CandidateID__c,NEW LIST<Qualification__c>());
            }
            CanIDvsQul.get(q.CandidateID__c).add(q);
        }

        for(Experience__c e:ExpList){
            if(!(CanIDvsExp.containsKey(e.CandidateID__c))){
                CanIDvsExp.put(e.CandidateID__c,NEW LIST<Experience__c>());
            }
            CanIDvsExp.get(e.CandidateID__c).add(e);
        }

        for(Candidate__c a:CandList){
            List<Qualification__c> con;
            List<Experience__c> opp;
            if(CanIDvsQul.containsKey(a.id)){
                con= CanIDvsQul.get(a.id);
            }
            if(CanIDvsExp.containsKey(a.id)){
                opp= CanIDvsExp.get(a.id);
            }

            lstwrap.add(new wrapper(a,con,opp));
        }
        return lstwrap;
    }

    public class wrapper{
        @AuraEnabled public Candidate__c acc {get;set;}
        @AuraEnabled public List<Qualification__c> cont {get;set;}
        @AuraEnabled public List<Experience__c> oppl {get;set;}
        
        public wrapper(Candidate__c a, List<Qualification__c> c, List<Experience__c> o){
            acc=a;
            cont=c;
            oppl=o;
        }
    }
}