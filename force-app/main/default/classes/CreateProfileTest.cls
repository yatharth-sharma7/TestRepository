@isTest
public with sharing class CreateProfileTest {
    @isTest
    public static void funcOfCreateProfileTest() {
        Profile prof = new Profile(); 
        prof = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        System.assertEquals(1, CreateProfile.funcOfCreateProfile(prof));
    }
}