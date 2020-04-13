public class ContactEmailSameAsUser{
    public static integer funcOfContactEmailSameAsUser( String str){
        //String str = UserInfo.getUserEmail();
        integer counter=0;
        for (Contact check:[Select Email,Name from Contact])
        {
            if(check.Email==str){
                counter++;
                system.debug(check.Name);
            }   
        }
        return counter;
    }
}