public class ContactSearch 
{
	public static integer searchForContacts(string str1,string str2,list<contact> newcon)
    {
        list<Contact>conList= [select name,id,LastName,mailingPostalCode from contact where lastName=: str1 and MailingPostalCode=:str2 and Id in:newcon];
        
        return conList.size();
    }
}