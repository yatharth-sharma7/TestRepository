public with sharing class CreateRecord {
    @AuraEnabled
    public static Candidate__c createCandidate (Candidate__c candidateRecord) {
        system.debug(candidateRecord);
        try {
            insert candidateRecord;
            System.debug('true');
            return candidateRecord;
        } catch(Exception ex) {
            System.debug(ex);
            return null;
        }
    }
    @AuraEnabled
    public static Boolean createQualification (Qualification__c qualificationRecord) {
        system.debug(qualificationRecord);
        try {
            insert qualificationRecord;
            System.debug('true in Qualificatioon');
            return true;
        } catch(Exception ex) {
            System.debug(ex);
            return false;
        }
    }
    @AuraEnabled
    public static Boolean createExperience (Experience__c experienceRecord) {
        system.debug(experienceRecord);
        try {
            insert experienceRecord;
            System.debug('true in Experience');
            return true;
        } catch(Exception ex) {
            System.debug(ex);
            return false;
        }
    }
}