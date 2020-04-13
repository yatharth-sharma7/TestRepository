@isTest
private class AlgoPricebookTest {
    @isTest
    private static void funcOfAlgoPricebookTest(){
        list<product2> plist=TestDataFactory.createProductsForProductsWithA(10);
        integer c= AlgoPricbook.PricebookCreation(plist);
        system.assertEquals(10, c);
    }
}