public class Task1_apex {
@AuraEnabled
    public static Boolean createContact (Contact contactRecord)
    {
        try 
        {
            insert contactRecord;
            return true;
        } catch(Exception ex)
        {
            system.debug(ex);
            return false;
        }
    }
    @AuraEnabled
    public static Boolean createAccounts (Account accObj)
    {
        system.debug(accObj);
        try 
        {
            insert accObj;
            return true;
        } catch(Exception ex)
        {
            system.debug(ex);
            return false;
        }
    }
    
    @AuraEnabled
    public static List<Account> accountSearch( string accountName)
    {
        List<Account> accList = new List<Account>();  
        if(accountName.length()>2){
        	accList = [select Name from Account where Name Like :accountName+'%' limit 5];
        }
        return accList;
    }
}