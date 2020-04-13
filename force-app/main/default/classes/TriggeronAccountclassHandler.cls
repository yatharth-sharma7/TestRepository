public class TriggeronAccountclassHandler {
        public static void createcontact(list<Account>aclist){
            system.debug('===>>>>'+aclist);
        list<contact>clist=new list<contact>();
        for(account a:aclist){
            for(integer i=0;i<a.numberofemployees;i++){
            contact cobj=new contact();
            cobj.lastname=a.name+i;
            cobj.Accountid=a.id;
            cobj.phone='9179445';
            clist.add(cobj);
        }
        }
        insert clist;
}
    public static void createdefault(list<account>accountlist){
        list<opportunity>oplist=new list<opportunity>();
        for(account a:accountlist){
            for(integer i=0;i<a.numberofemployees;i++){
                   opportunity obj=new opportunity();
            obj.name=a.name+i;
            obj.stagename='Closed Lost';
            obj.closedate=date.today();
            obj.accountid=a.Id;
            oplist.add(obj);
            }   
        }
       insert oplist;
       
    }
}