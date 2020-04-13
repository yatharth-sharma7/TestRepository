@isTest
public with sharing class DateCalculationTest {
    @isTest
    public static void funcOfDateCalculationTest() {
        Datetime myDate = Datetime.newInstance(2008, 12, 1, 12, 30, 2);
        Datetime myDate2 = Datetime.newInstance(2009, 12, 1, 12, 30, 2);
        System.assertEquals(365,DateCalculation.funcOfDateCalc(myDate, myDate2));
    }
}