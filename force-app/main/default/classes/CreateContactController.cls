public class CreateContactController {
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