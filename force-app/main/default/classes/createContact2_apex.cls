public with sharing class createContact2_apex {
    @AuraEnabled
    public static Boolean createContact (Contact contactRecord) {
        try {
            insert contactRecord;
            return true;
        } catch(Exception ex) {
            return false;
        }
    }
}