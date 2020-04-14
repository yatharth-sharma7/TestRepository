@isTest
public with sharing class planWithTravelHoursTest {
    @isTest
    public static void planWithTravelHoursTest() {
        List<Plan__c> accList=TestDataFactory.createPlan(10);
        System.AssertEquals(7,PlanWithTravelHours.funcOfPlanWithTravelHours(accList));
    }
    @isTest
    public static void planWithTravelHoursTest1() {
        List<Plan__c> accList=TestDataFactory.createPlan(20);
        System.AssertEquals(13,PlanWithTravelHours.funcOfPlanWithTravelHours(accList));
    }
}