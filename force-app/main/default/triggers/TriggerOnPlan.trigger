trigger TriggerOnPlan on Plan__c (Before insert) {
    
    if(trigger.isBefore && trigger.isInsert)
    {
        List<Plan__c> plnList = new List<Plan__c>();
        for(Plan__c pl : trigger.new)
        {
            plnList.add(pl);
            System.debug('Plan in Trgr>>>'+pl);
        }
        if(plnList.size()>0)
        {
           // System.debug('IN IF PLAN SIZE>0');
            TriggerOnPlanHandler.checkTravelHoursForALocation(plnList);
        }
}

}