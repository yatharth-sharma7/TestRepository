global with sharing class Q11_SchedulableClassForQ11 implements Schedulable{
    global void execute(Schedulablecontext sc) {
        Q11_FetchLeadAndSendEmail Q11 = new Q11_FetchLeadAndSendEmail();
        Database.executeBatch(Q11);
    }
}