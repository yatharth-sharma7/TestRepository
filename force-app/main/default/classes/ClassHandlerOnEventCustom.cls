public class ClassHandlerOnEventCustom 
{
	public Static void NoSameUser(List<Event_Participant__c> evList)
    {
        for(Event_Participant__c evp : evList)  
         {
             for(Event_Participant__c ev : [SELECT Contact__c, Event1__c,Event1__r.Event_Date__c FROM Event_Participant__c WHERE Contact__c != NULL AND Event1__c != NULL AND Event1__r.Event_Date__c !=NULL])
             {
                 if(evp.Contact__c == ev.Contact__c && evp.Event1__c == ev.Event1__c)
                 {
                     evp.addError('No same user allowed');
                 }
             }            
         }
    }
    public Static void NoSameDate(List<Event_Participant__c> evList)
    {
        system.debug('inside class before loop==================='+evList);
        for(Event_Participant__c evp : evList)  
         {
             system.debug('loop  out');//'evp'+evp);
             for(Event_Participant__c ev : [SELECT Contact__c, Event1__c,Event1__r.Event_Date__c FROM Event_Participant__c WHERE Contact__c != NULL AND Event1__c != NULL AND Event1__r.Event_Date__c !=NULL])
             {
                 system.debug('loop  int');//ev'+ev);
                 if(evp.Contact__c == ev.Contact__c && evp.Event1__c != ev.Event1__c)
                 {
                     system.debug('test check================================>'+evp.Event1__r.Event_Date__c+'     '+ev.Event1__r.Event_Date__c);
                     if(evp.Event1__r.Event_Date__c == ev.Event1__r.Event_Date__c)
                     {
                       evp.addError('no same date allowed');
                     }
                 }
             }            
         }
    }
}