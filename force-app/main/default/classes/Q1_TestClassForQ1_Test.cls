@isTest
public with sharing class Q1_TestClassForQ1_Test {
    @isTest
    public static void funcOfQ1_TestClassForQ1_Test() {
        List<account> accList=TestDataFactory.createAccount(200); 
        Q2_ScheduleQ1 Q1 = new Q2_ScheduleQ1();

        Test.startTest();
        string schedule ='0 0 12,0 * * ?';
        System.schedule('Schedule everyday At 12 pm',schedule,Q1);
        Test.stopTest();

        system.assertEquals(200, accList.size());
    }
}