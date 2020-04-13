trigger TriggerOnProduct on Product2 (After insert) 
{
    LIST<PricebookEntry> PBElist = NEW LIST<PricebookEntry>();
    //Pricebook2 PBook = [SELECT id,name FROM Pricebook2 WHERE IsStandard=True];
    id pBook=Test.getStandardPricebookId();
    for(Product2 pro:trigger.new)
    {
       PriceBookEntry PBEntry = NEW PriceBookEntry();
       PBEntry.Pricebook2ID=PBook;
       PBEntry.Unitprice=1;
       PBEntry.Product2ID=pro.id;
       PBElist.add(PBEntry);
    }
    INSERT PBElist;
}