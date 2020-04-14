public class lightningComp1ApexClass {
    @AuraEnabled
    public static List<Account> accountSearch(string accountName)
    {
        system.debug('accList');
        List<Account> accList = new List<Account>();  
        if(accountName.length()>2){
        	accList = [select Name from Account where Name Like :accountName+'%' limit 5];
        }
        system.debug(accList);
        return accList;
    }
}