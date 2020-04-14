public class AccountHandler 
{
	public static string insertNewAccount(string naam)
    {
        account a =new account(name=naam);
        //insert a;
        return a.name;
    }
}