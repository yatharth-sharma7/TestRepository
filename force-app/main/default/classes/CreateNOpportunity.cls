public class CreateNOpportunity {
    public static integer funcOfCreateNOpportunity(integer n) {
        List<Opportunity> op1 = new List<Opportunity>();
        Integer a;
        for(a=1;a<=n;a++)
        {
            Opportunity o1 = new Opportunity();
            o1.Name= 'Opportunity no'+ a;
            o1.CloseDate=date.today();
            o1.StageName= 'stage name';
            o1.Description= 'About the opportunity';

            op1.add(o1);
            
        }
        INSERT op1;
        return op1.size();
    }
}