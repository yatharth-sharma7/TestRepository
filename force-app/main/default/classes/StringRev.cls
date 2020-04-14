public class StringRev{
    public static integer funcOfstringRev( LIST<Account> acList){
        //LIST<Account>accList=[SELECT Name From Account LIMIT 1];
        integer counter=0;
        for(Account a:acList )
        {
            counter++;
            string str = string.valueOf(a.Name);	
            string revstr= str.reverse();
            system.debug(revstr);
        }
        return counter;
    }
}