global with sharing class Q2_ScheduleQ1 implements schedulable{
    global void execute(Schedulablecontext sc) {
        Q1_deleteAccountCreatedInLast10Days Test = NEW Q1_deleteAccountCreatedInLast10Days();
        Database.executeBatch(Test);
    }
}