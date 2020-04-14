public class CreateNContactWithLookUp {
    public static integer funcOfCreateNContactWithLookUp (List<Account> accList) {
        List<Contact> conList = NEW List<Contact>();
        //List<Account> accList = [SELECT Name FROM Account Limit 10];
        for(Account a: accList)
        {
            Contact conVar = NEW Contact();
            conVar.LastName= 'abc'+ a.ID;
            conVar.AssistantName= 'xyz '+a.name;
            conList.add(conVar);
        }
        INSERT conList;
        return conList.size();

    }
}