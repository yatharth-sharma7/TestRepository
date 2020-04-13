trigger OpportunityTrigger on Opportunity (before Insert,after Update,before Update,after Insert) 
{
    LIST<Opportunity> opList= NEW LIST<Opportunity>();
    
    if(trigger.isBefore){
        if(trigger.isInsert){
            for(Opportunity o:trigger.new){
                if(o.AccountId!=Null){
                    opList.add(o);                          
                }
            }   
            if(opList.size()>0){
                ClassOnOpportunity.insertOpportunity(opList);
                ClassOnOpportunity.insertBeforeOpportunity(opList);
                ClassOnOpportunity.insertBefore23Ques(opList);
            }
            else{
                system.debug('List is Empty or there is no account for that opportunity');
            }      
        }
        else if(trigger.isUpdate){
            for(Opportunity o:trigger.new){
                if(o.AccountId!=Null){
                    opList.add(o);                          
                }
            }
            if(opList.size()>0){   
                ClassOnOpportunity.insertBeforeOpportunity(opList);
                //ClassOnOpportunity.insertBefore23Ques(opList);
            }
            else{
                system.debug('List is Empty');
            }   
        }
    }
    else if(trigger.isAfter){
        if(trigger.isUpdate){
           for(Opportunity o:trigger.new){
                opList.add(o);
            }
            if(opList.size()>0){
                system.debug('inside trigger===========================>>>>'+opList);
                //ClassOnOpportunity.UpdateOpportunity(opList);
                ClassOnOpportunity.afterUpdateOpportunity(opList);
            }
            else
            {
                system.debug('List is Empty');
            }
        }
        else if(trigger.isinsert){
           for(Opportunity o:trigger.new){
                opList.add(o);
            }
            if(opList.size()>0)
            {   
                ClassOnOpportunity.InsertonOpportunity(opList);
            }
            else
            {
                system.debug('List is Empty');
            }   
        }
    }
}