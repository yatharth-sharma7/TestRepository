@isTest
public with sharing class CreateParticipantTest {
    @isTest
    public static void funcOfCreateParticipantTest(){
        List<Contact> contList= TestDataFactory.createContact(16);
        System.assertEquals(5*16, CreateParticipant.funcOfCreateParticipant(5,contList));
    }
}