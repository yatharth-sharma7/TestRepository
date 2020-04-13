public with sharing class Ctrl_Search {

    public List<Account> Accounts { get; set; }
    public String name { get; set; }
    public boolean showError{get;set;}
    public boolean initialTable {get;set;}
   
    public Ctrl_Search() {
        List<Account> Accounts = new List<Account>();
    }
    public PageReference searchAccount(){
        system.debug('searchAccount');
        if(name==NULL||name == ''){
            showError=true;
        }
        else{
            showError=false;
            initialTable=true;
            
            String searchString = name + '%';

            Accounts = [SELECT Id,Name,ShippingCity,ShippingPostalCode,phone FROM Account WHERE Name LIKE :searchString];
            
        }
        return null;
    }
}