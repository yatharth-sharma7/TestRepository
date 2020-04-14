/*"Script - 
Create an Object ""Event"" (Name Default field and ""Event Date"" Date time field). Another Junction Object ""Event Participant"" with 3 fields
1. lookup Contact
2. lookup Event
3. multipicklist (""Attendee Contact"", ""Presenter Contact"",""Organizer Contact"")
Write a script to create 10 ""Event Participant"" with Attendee picklist, 4 with Presenter, 2 with organizer.
Trigger - 
Write a trigger to stop creating ""Event Participant"" if a Contact is registering for 2 Events happening in Same day ie. Event Date is same."*/

trigger TriggerOnEventP on Event_Participant__c (before insert)
{
	if(trigger.isBefore)
    {
        
        if(trigger.isinsert)
        {
            List<Event_participant__C>evpList = New List <Event_participant__C>();
            for(Event_Participant__c e:trigger.new){
                Event_Participant__c ev= NEW Event_Participant__c();
                ev.Event1__r.Event_Date__c=e.Event1__r.Event_Date__c;
                ev.Contact__c=e.Contact__c;
                ev.Event1__c=e.Event1__c;
                evpList.add(ev);
                system.debug('test ' +e.Event1__r.Event_Date__c);
            }
           if(evpList.size()>0)
            {
				system.debug(evpList);
                ClassHandlerOnEventCustom.NoSameUser(evpList);
                ClassHandlerOnEventCustom.NoSameDate(evpList);
            }
        }
    }
}