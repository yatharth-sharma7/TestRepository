@isTest
public with sharing class CreateNProductsTest {
    @isTest
    public static void funcCreateNProductsTest() {
        TestDataFactory.createPricebookAndProducts();
       System.assertEquals(10, CreateNProducts.funcOfCreateNProducts(10));

    }
}