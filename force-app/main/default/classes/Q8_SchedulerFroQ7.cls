global with sharing class Q8_SchedulerFroQ7 implements Schedulable {
    global void execute(Schedulablecontext sc) {
        Q7_UpdateNoOfAccountCField obj = NEW Q7_UpdateNoOfAccountCField();
        Database.executeBatch(obj);
    }
}

/*
String CRON_EXP1 = '0 5 * * * ?' ;
String CRON_EXP2 = '0 10 * * * ?' ;
String CRON_EXP3 = '0 15 * * * ?' ;
String CRON_EXP4 = '0 20 * * * ?' ;
String CRON_EXP5 = '0 25 * * * ?' ;
String CRON_EXP6 = '0 30 * * * ?' ;
String CRON_EXP7 = '0 35 * * * ?' ;
String CRON_EXP8 = '0 40 * * * ?' ;
String CRON_EXP9 = '0 45 * * * ?' ;
String CRON_EXP10 = '0 50 * * * ?' ;
String CRON_EXP11 = '0 55 * * * ?' ;
String CRON_EXP12 = '0 0 * * * ?' ;

Q8_SchedulerFroQ7 bt1 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt2 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt3 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt4 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt5 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt6 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt7 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt8 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt9 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt10 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt11 = new Q8_SchedulerFroQ7();
Q8_SchedulerFroQ7 bt12 = new Q8_SchedulerFroQ7();

System.schedule('updateAccount count every 5 minutes',CRON_EXP1,bt1);
System.schedule('updateAccount count every 10 minutes',CRON_EXP2,bt2);
System.schedule('updateAccount count every 15 minutes',CRON_EXP3,bt3);
System.schedule('updateAccount count every 20 minutes',CRON_EXP4,bt4);
System.schedule('updateAccount count every 25 minutes',CRON_EXP5,bt5);
System.schedule('updateAccount count every 30 minutes',CRON_EXP6,bt6);
System.schedule('updateAccount count every 35 minutes',CRON_EXP7,bt7); 
System.schedule('updateAccount count every 40 minutes',CRON_EXP8,bt8); 
System.schedule('updateAccount count every 45 minutes',CRON_EXP9,bt9); 
System.schedule('updateAccount count every 50 minutes',CRON_EXP10,bt10); 
System.schedule('updateAccount count every 55 minutes',CRON_EXP11,bt11); 
System.schedule('updateAccount count every 60 minutes',CRON_EXP12,bt12);

*/



/*

for(integer i=0;i<=55;i=i+5){
    String CRON_EXP = '0 '+i+' * * * ?' ;
    Q8_SchedulerFroQ7 bt = new Q8_SchedulerFroQ7();
    System.schedule('updateAccountEvery5Minutes'+i,CRON_EXP,bt);
}*/