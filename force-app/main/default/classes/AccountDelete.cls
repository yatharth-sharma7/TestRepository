global class AccountDelete implements Database.Batchable<sObject>{

	global Database.QueryLocator start(Database.BatchableContext BC){
		String query = 'SELECT Id,CreatedDate FROM Account WHERE CreatedDate <= N_DAYS_AGO:10';
		return Database.getQueryLocator(query);
	}

	global void execute(Database.BatchableContext BC, List<Account> scope){
        /*List <Account>acclist = new List<Account>();
        for(Account acc:acclist){
        //string test = acc.Name;
        acclist.add(acc);
        }*/
        system.debug('**** Acc List–'+ scope);
        delete scope;
    }
    global void finish(Database.BatchableContext BC){
    	system.debug('**** Finish');
    }
}