@isTest
public with sharing class ScheduleAccountDeleteTest {
    @isTest
    public static void funcOfScheduleAccountDeleteTest() {
        List<account> accList=TestDataFactory.createAccount(200); 
        ScheduleDelete instance = new ScheduleDelete();

        Test.startTest();
        string schedule ='0 0 12,0 * * ?';
        System.schedule('Schedule everyday At 12 pm',schedule,instance);
        Test.stopTest();

        system.assertEquals(200, accList.size());
    }
}