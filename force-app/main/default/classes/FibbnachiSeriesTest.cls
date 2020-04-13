@isTest
public with sharing class FibbnachiSeriesTest {
    @isTest
    public static void funcOfFibbnachiSeriesTest() {
        integer a =FibbnaciSeries.funcOfFibbnaciSeries(10);
        system.assertEquals(89, a);
    }
}