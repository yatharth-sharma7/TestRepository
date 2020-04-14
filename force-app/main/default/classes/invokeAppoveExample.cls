public class invokeAppoveExample {
@InvocableMethod
      public static void recordInsert(list<id>ids){
      list<account>acc= [select id from account where id in:ids];
      for(account a :acc){
          opportunity op = new opportunity();
          op.Name=a.Name;
          op.CloseDate=system.today();
          op.StageName='closed won';
          op.AccountId=a.id;
          op.Amount=a.AnnualRevenue;
          insert op;

          }
    }
}