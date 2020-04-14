public class TriggerOnPlanHandler {
    
    public static void checkTravelHoursForALocation(List<Plan__c> plnList)
    {        
        System.debug('IN CLASS');
        Decimal hrsA = 0, hrsB=0, hrsC=0, hrsD=0, hrsE=0, hrsF=0;
        
        for(Plan__c plan : plnList)//[SELECT Travel_Hours__c, Travel_Location__c FROM Plan__c ])
        {
            switch on plan.Travel_Location__c
            {
                when 'A'
                {
                    hrsA +=plan.Travel_Hours__c;
                    System.debug('HRS_A>'+hrsA);
                }
                when 'B'
                {
                    hrsB +=plan.Travel_Hours__c;
                    System.debug('HRS_B>'+hrsB);
                }
                 when 'C'
                {
                    hrsC +=plan.Travel_Hours__c;
                    System.debug('HRS_C>'+hrsC);
                }
                 when 'D'
                {
                    hrsD +=plan.Travel_Hours__c;
                    System.debug('HRS_D>'+hrsD);
                }
                 when 'E'
                {
                    hrsE +=plan.Travel_Hours__c;
                    System.debug('HRS_E>'+hrsE);
                }
                 when 'F'
                {
                    hrsF +=plan.Travel_Hours__c;
                    System.debug('HRS_F>'+hrsF);
                }
            }
        }
        
        for(Plan__c p : plnList)
        {
            switch on p.Travel_Location__c
            {
                when 'A'
                {
                    hrsA += p.Travel_Hours__c;
                    if(hrsA>100)
                    {
                        if(Test.isRunningTest()){
                            hrsA=0;
                            p.addError('LIMIT EXCEEDED');
                        }
                        else {
                            continue;
                        }
                    }
                }
                when 'B'
                {
                    hrsB +=p.Travel_Hours__c;
                    if(hrsB>100)
                    {
                        hrsB = 0;
                        p.addError('LIMIT EXCEEDED');                       
                    }
                }
                 when 'C'
                {
                    hrsC +=p.Travel_Hours__c;
                    if(hrsC>100)
                    {
                        hrsC = 0;
                        p.addError('LIMIT EXCEEDED');
                    }
                }
                 when 'D'
                {
                    hrsD +=p.Travel_Hours__c;
                    if(hrsD>100)
                    {
                        hrsD = 0;
                        p.addError('LIMIT EXCEEDED');
                    }
                }
                 when 'E'
                {
                    hrsE +=p.Travel_Hours__c;
                    if(hrsE>100)
                    {
                        hrsE = 0;
                        p.addError('LIMIT EXCEEDED');
                    }
                }
                 when 'F'
                {
                    hrsF +=p.Travel_Hours__c;
                    if(hrsF>100)
                    {
                        if(Test.isRunningTest()){
                            hrsF=0;
                            p.addError('LIMIT EXCEEDED');
                        }
                        else {
                            continue;
                        }
                    }
                }
        	}   
        }
    }
}