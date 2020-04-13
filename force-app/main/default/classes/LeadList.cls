public class LeadList{
    public static Integer funcOfLeadList( LIST<Lead> lds){
        List<Lead>lds2 = [SELECT Company FROM Lead WHERE Records__c includes('Sellers;Tenants','Sellers','Tenants')AND id in:lds];// AND CreatedDate=LAST_N_YEARS:1];
        system.debug(lds2);
        return lds2.size();
    }
}