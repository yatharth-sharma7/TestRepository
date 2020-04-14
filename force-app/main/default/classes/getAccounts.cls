public class getAccounts {

    public list<Account> accountList{get;set;}

    public getAccounts() {    
        accountList = new list<Account>();
        accountList = [SELECT id,name FROM Account LIMIT 100];
    }
}