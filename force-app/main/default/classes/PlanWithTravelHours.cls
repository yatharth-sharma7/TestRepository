public class PlanWithTravelHours{
    public static integer funcOfPlanWithTravelHours( LIST<Plan__c> pl){
        AggregateResult[]pln = [SELECT SUM(Travel_Hours__c) totalHours FROM Plan__c WHERE Travel_Location__c includes('A','F') AND Travel_Location__c excludes('A;F') and id in:pl];
        object totalHours = pln[0].get('totalHours');
        system.debug(totalHours);
        integer a= integer.valueOf(totalHours);
        return a;
    }
}