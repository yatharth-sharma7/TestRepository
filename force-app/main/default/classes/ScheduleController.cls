public class ScheduleController {
    public List<CronTrigger> scdList{get;set;}
    public ScheduleController(){
    scdList= [SELECT Id, State,CronJobDetail.Name FROM CronTrigger];
    
    }
    public PageReference deleteJob() {
       System.abortJob(ApexPages.currentPage().getParameters().get('jobId')); 
        return null;
    }
}