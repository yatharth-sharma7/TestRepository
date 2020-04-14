public class CreateParticipant{
    public static integer funcOfCreateParticipant( integer numOfEvents,List<Contact> c1){
        LIST <Event1__c> e1 = NEW LIST <Event1__c>();
        for(integer i =0;i<numOfEvents;i++)
        {
            Event1__c e = NEW Event1__c();
            e.Name='Event no' +i;
            e.Event_Date__c= datetime.newInstance(2020+i,10,7);
            e1.add(e);
        }
        INSERT e1;


        LIST<Event_Participant__c> eP = New LIST<Event_Participant__c>();
        for(Event1__c e: e1)
        {
            for(integer i=0;i<16;i++)
            {
                Event_Participant__c ePc = NEW Event_Participant__c();
                ePc.Name = 'Participant '+i+1;
                ePc.Contact__c= c1[i].id;
                ePc.Event1__c=e.id;    
                    
                if(i<10){
                    epc.Ptype__c ='Attendee Contact';
                }
                
                if(i>9&&i<14){
                    epc.Ptype__c ='Presenter Contact';
                }
                
                if(i>13&&i<16){
                    epc.Ptype__c ='Organizer Contact';
                }
                
                eP.add(ePc);
            }
        }
        UPSERT eP;
        return eP.size();
    }
}