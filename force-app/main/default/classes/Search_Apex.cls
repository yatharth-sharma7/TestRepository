public class Search_Apex {
    @AuraEnabled
    public static List<Candidate__c> CandidateList () {
        system.debug('go for CandidateList');
        //String accNameTest = name + '%';
        //system.debug(name);
        //system.debug(accNameTest);
        List <Candidate__c> lstOfCand = [SELECT id,name,DOB__c,Email__c,Gender__c,Mother_s_Name__c,Phone__c,About_Me__c,Adhaar_Number__c,Father_s_Name__c,Address__c,Status__c FROM Candidate__c ORDER BY name DESC LIMIT 30];
        system.debug(lstOfCand);
        return lstOfCand;
    }
    
    @AuraEnabled
    public static Boolean updateCandidate(List<Candidate__c> candidate){
        system.debug('go for updateCandidate');
        try{
            update candidate; 
            return true;
        }
        catch(Exception e){
            return false;
        }
    }

    @AuraEnabled
    public static List<Candidate__c> totalData(){
        system.debug('go for totalData');
        List <Candidate__c> lstOfCand = [SELECT id,name,DOB__c,Email__c,Gender__c,Mother_s_Name__c,
                                        Phone__c,About_Me__c,Adhaar_Number__c,Father_s_Name__c,Address__c,
                                        Status__c FROM Candidate__c ORDER BY name DESC ];
        try{
            system.debug(lstOfCand.size());
            return lstOfCand;
        }
        catch(Exception e){
            system.debug(e);
            return null;
        }
    }

    @AuraEnabled
    public static List<Candidate__c> selectedData(){
        system.debug('go for selectedData');
        List <Candidate__c> lstOfCand = [SELECT id,name,DOB__c,Email__c,Gender__c,Mother_s_Name__c,
                                        Phone__c,About_Me__c,Adhaar_Number__c,Father_s_Name__c,Address__c,
                                        Status__c FROM Candidate__c WHERE Status__c = 'Selected'];
        try{
            system.debug(lstOfCand.size());
            return lstOfCand;
        }
        catch(Exception e){
            system.debug(e);
            return null;
        }
    }

    @AuraEnabled
    public static List<Candidate__c> newData(){
        system.debug('go for newData');
        List <Candidate__c> lstOfCand = [SELECT id,name,DOB__c,Email__c,Gender__c,Mother_s_Name__c,
                                        Phone__c,About_Me__c,Adhaar_Number__c,Father_s_Name__c,Address__c,
                                        Status__c FROM Candidate__c WHERE Status__c = 'New'];
        try{
            system.debug(lstOfCand.size());
            return lstOfCand;
        }
        catch(Exception e){
            system.debug(e);
            return null;
        }
    }
    @AuraEnabled
    public Static Boolean deleteAcnd(string RowID) {

        system.debug('go for deleteAcnd '+RowID);
        Id newRowId= Id.valueOf(RowID);
        system.debug(newRowId);

        try{
            List<Candidate__c> CandList = [SELECT id,name,DOB__c,Email__c,Gender__c,Mother_s_Name__c,Phone__c,About_Me__c,Adhaar_Number__c,Father_s_Name__c,Address__c,Status__c FROM Candidate__c WHERE Id= :newRowId];
            List<Qualification__c> QulList =[SELECT id,CandidateID__c,Course__c,Course_Type__c,Institution__c,Year__c,Percent__c FROM Qualification__c WHERE CandidateID__c in: CandList];
            List<Experience__c> ExpList = [SELECT id,CandidateID__c,Company__c,From__c,Position__c,To__c FROM Experience__c WHERE CandidateID__c in: CandList];

           
            Delete qulList;
            Delete ExpList;
            system.debug('dependencies Deleted');
            Delete CandList;

            return true;
        }
        catch(Exception e){
            system.debug(e);
            return false;
        }
    }

    @AuraEnabled
    public Static List<wrapper> InitMethodWrap( string RowID) {
        system.debug('go for wrapper '+RowID);
        Id newRowId= Id.valueOf(RowID);
        system.debug(newRowId);

        List<wrapper> lstwrap;
        lstwrap=new List<wrapper>();

        List<Candidate__c> CandList = [SELECT id,name,DOB__c,Email__c,Gender__c,Mother_s_Name__c,Phone__c,About_Me__c,Adhaar_Number__c,Father_s_Name__c,Address__c,Status__c FROM Candidate__c WHERE Id= :newRowId];
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
        system.debug(lstwrap);
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