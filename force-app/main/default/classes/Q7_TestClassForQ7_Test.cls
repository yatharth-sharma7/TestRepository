@isTest
public with sharing class Q7_TestClassForQ7_Test {
        @isTest
        public static void funcOfQ7_TestClassForQ7_Test() {
            List<account> accList=TestDataFactory.createAccount(200); 
            
                String CRON_EXP = '0 5 * * * ?' ;
                Q8_SchedulerFroQ7 Q7 = new Q8_SchedulerFroQ7();
                Test.startTest();
                System.schedule('updateAccountEvery5Minutes',CRON_EXP,Q7);
                Test.stopTest();
                system.assertEquals(200, accList.size());
        }
    }