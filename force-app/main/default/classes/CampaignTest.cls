@isTest
public with sharing class CampaignTest {
    @isTest
    public static void funcCampaignTest() { 
        pricebook2 p = TestDataFactory.createPriceBookForCmp();
        update p;
        List<Campaign> cmpList =TestDataFactory.createionForCampaign(10,p);
        insert cmpList;

        for(Campaign c :cmpList){
            c.status='Completed';
        }
        update cmpList;

    }
}