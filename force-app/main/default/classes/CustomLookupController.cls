public class CustomLookupController {
	@AuraEnabled
    public static List<SObject> findRecords_Apex (String searchKey, String sobjectApi) {
        return Database.query('SELECT Id, Name FROM ' + sobjectApi + ' WHERE Name LIKE \'' + searchKey + '%\' LIMIT 5');
    }    
}