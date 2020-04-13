public class ProductWithA{
    public static Integer funcOfProductWithA(List<Product2> pdList){
        List<Product2> pddList=[SELECT Name,Age_group__c,Description FROM Product2 WHERE Description like'%a%' AND Id in:pdList];
            integer count=0;
            for(Product2 tempProduct:pddList){
                system.debug('PData >> '+tempProduct);
                count++;
            }
            return count;
    }
}