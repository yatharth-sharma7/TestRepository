public Class AlgoPricbook{
    public static Integer PricebookCreation(List<Product2> pList)
    {
        
        pricebook2 priceList=new pricebook2();
        priceList.Name='Algo Pricebook';
        insert priceList;

        List<PricebookEntry> PBE=new List<PricebookEntry>();
    
        for(Product2 p:pList)
        {
            
            PricebookEntry PBEList=new PricebookEntry();
            PBEList.product2id=p.id;
            PBEList.pricebook2id=priceList.id;
            PBEList.UnitPrice=1000;
            PBE.add(PBEList);   
        }
        Insert PBE;
        return PBE.size();
    }
}