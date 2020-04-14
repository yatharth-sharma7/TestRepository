public  class DeleteAccountWithA {
    public static Integer fucnOfDeleteAccountWithA(LIST<Contact>contList) {
        //LIST<Contact>contList=new LIST<Contact>();
       // contList=[SELECT Id FROM Contact WHERE Account.Name Like'%A%'];
        delete contList;
        return contList.size();
    }
}