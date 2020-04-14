public class UpdateOpportunityWithF {
    public static integer funcOfUpdateOpportunityWithF(LIST<Opportunity> op2) {
        //LIST<Opportunity> op2= NEW LIST<Opportunity>();
        //op2=[SELECT Name FROM Opportunity WHERE CloseDate>TODAY];
        integer counter=0;
        for(Opportunity temp:op2){
            temp.Name= temp.Name +'F' ;
            counter++;
        }
        UPDATE op2;
        return counter;
    }
}