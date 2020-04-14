global with sharing class Q4_ScheculableClass implements schedulable{
    global void execute(Schedulablecontext sc) {
        Q4_Create5OpportunityDaily obj = NEW Q4_Create5OpportunityDaily();
        Database.executeBatch(obj);
    }
}