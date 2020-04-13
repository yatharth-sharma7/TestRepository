public class HandlerOnLead 
{
	public static void beforeInsert(LIST<Lead> ldList)
    {
       // string str=userinfo.getName();
        LIST<USER> usr = [SELECT name FROM USER ];//where name = : str];
        LIST<Lead> ld=[SELECT name,ownerid FROM LEAD where LastTransferDate = THIS_MONTH and ownerId in : usr];
        system.debug('inside class==========================='+ldList);
        system.debug('inside class==========================='+ld);
        system.debug('inside class==========================='+usr);
        
        for(LEAD l1:ldList)
        {
            integer i=0;
            for(LEAD l2:ld)
            {
             i++;   
            }
            system.debug(i);
             if(i>45)
        	{
            	l1.addError('This User"s lead limit canoot be exceeded ');
        	}
        }
       
    }
}