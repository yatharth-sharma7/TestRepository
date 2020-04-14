@isTest
public with sharing class SendEmail10DaysTest {
    @isTest
    public static void funcOfSendEmail10DaysTest() {
                List<Account> acList=TestDataFactory.CreateAccountContactOpportunity(10);
                system.assertEquals(10, SendEmail10Days.funcOfSendEmail10Days(acList));
            }
        }