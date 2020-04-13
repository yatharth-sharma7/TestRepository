public class NOEWorkingINAccount{
    public Integer funcOfNOEWorkingINAccount( LIST<Account> accList){
        AggregateResult[] noE = [SELECT SUM(NumberOfEmployees) totalemp FROM Account WHERE Working_In__c includes('ASIA') AND Id in: accList ];
        system.debug(noE);
        object totalemp = noE[0].get('totalemp');
        system.debug('============='+integer.valueof(totalemp));
        return integer.valueof(totalemp);
    }
}//11683