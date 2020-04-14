global class ScheduleDelete implements Schedulable{
    global void execute(SchedulableContext sc) {
        AccountDelete a = new AccountDelete();
        database.executebatch(a);
    }
}