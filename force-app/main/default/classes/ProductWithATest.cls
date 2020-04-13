@isTest
public with sharing class ProductWithATest {
    @isTest
    public static void funcOfProductWithATest() {
        
        List<Product2> proList = TestDataFactory.createProductsForProductsWithA(10);
        system.assertEquals(10,ProductWithA.funcOfProductWithA(proList));
    }
}