public class CreateNLeadAnd5Product{
    public static integer funcofCreateNLeadAnd5Product(integer num){
        LIST<Product2> pd2 = NEW LIST<Product2>();
        LIST<Lead> ld = NEW LIST<Lead>();
        integer i;
        for(i =0; i<num;i++)
        {	
            Lead Obj= NEW Lead();
            Obj.Company ='Cloud Analogy '+i;
            Obj.LastName ='Last Name' +i;
            ld.add(Obj);
            
        }
        INSERT ld;
        for( i =0;i<5;i++)
        {
            for(Lead l:ld)
            {
                Product2 pd =NEW Product2();
                pd.Name= 'Product 0000' +i;
                pd.Lead1__c=l.id;
                pd2.add(pd);
            }
        }
        INSERT pd2;
        return pd2.size();
    }
}