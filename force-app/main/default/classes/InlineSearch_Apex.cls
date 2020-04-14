public  class InlineSearch_Apex {
    @AuraEnabled
    public static List<SObject> returnList (String accName, String sobjectApi) {
        String accNameTest = accName + '%';
        List <Account> lstOfAccount = [SELECT id, Name FROM Account WHERE Name LIKE: accNameTest LIMIT 10];
        return lstOfAccount;
    }
}