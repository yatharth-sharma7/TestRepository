public with sharing class Ctrl_AccountSearch{
    
    public List<Account> Accounts { get; set; }
    public List<Account> Accounts2 { get; set; }
    public Account editAcc { get; set; }
    public String name { get; set; }
    public boolean val{get;set;}
    public Account accountid{get;set;}
    public boolean showError{get;set;}
    public boolean initialTable {get;set;}

    public Ctrl_AccountSearch() {
        List<Account> Accounts = new List<Account>();
        List<Account> Accounts2 = new List<Account>();
    }
    public String getParam(String name) {
        return ApexPages.currentPage().getParameters().get(name);
    }

    public PageReference searchAccount(){
        system.debug('searchAccount');
        if(name==NULL||name == ''){
            showError=true;
        }
        else{
            system.debug(name);
            showError=false;
            initialTable=true;
            
            String searchString = name + '%';

            Accounts = [SELECT Id,Name,site,owner.name,phone FROM Account WHERE Name LIKE :searchString];
            
        }
        return null;
    }
    public PageReference save(){
        String searchString = name + '%';

        Accounts2 = [SELECT Id,Name,site,owner.name,phone FROM Account WHERE Name LIKE :searchString];
        for(Account a: Accounts){
            for(Account a1: Accounts2){
                if(a1.id==a.id){
                a1.name=a.Name;
                a1.site=a.site;
                a1.phone=a.phone;
                }
            }
        }
        update Accounts2;
        //Xshow();
        return null;
        
    }
    public PageReference editAccName() {
        String accid = getParam ('accountid');
        system.debug(accid);
        editAcc = [SELECT Id,Name,site,owner.name,phone FROM Account WHERE Id =: accid];
        return null;
    }

    public PageReference saveEdit() {
        try {
            UPDATE editAcc;
            editAcc = null;
        } catch (Exception e) {
            ApexPages.addMessages(e);
        }
        return null;
    }


  /*  public PageReference Show(){
        val=true;
        return null;
    }
    public PageReference Xshow(){
        val=false;
        return null;
    }*/
}