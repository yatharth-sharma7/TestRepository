public class AccountController {
    
    public string searchName{get;set;}
    public List<Account> accList{get;set;}
    public boolean inputText{get;set;}
    public boolean outputText{get;set;}
    public Account accountid{get;set;}
    public Account editAccName{get;set;}
    public Account getAcc{get;set;}
    public Account getUpdateAcc;
    public integer PageNumber{get;set;}
    public integer ResultSize{get;set;}
    public integer PageSize{get;set;}
    public List<Account> pageList{get;set;}
    public List<integer> pageNoList{get;set;}
    public boolean val{get;set;}
    
     
    
    public AccountController(){
        pageNoList = new List<integer>();
        accList = new List<Account>();
        pageList = new List<Account>();
        inputText = false;
        outputText = true;
        PageSize = 5;
    }
    
    public String getParam(String name) {
        return ApexPages.currentPage().getParameters().get(name);
    }
    
    
    Public PageReference search(){
        pageNoList.clear();
        if(searchName==''|| searchName=='null')
        {

        }
        else{
            
            string str = searchName+'%';
            string query = 'select id,Name,Phone,site from Account where Name Like :str';
            accList = database.query(query);
        }
        pageNoList.clear();
        string str = searchName+'%';
        string query = 'select id,Name,Phone,site from Account where Name Like :str';
        accList = database.query(query);
        ResultSize = accList.Size();
        pageNumber = ResultSize/PageSize;
        if(math.mod(ResultSize,PageSize)!=0){
            pageNumber += 1;
        }
        for(integer j = 1; j<=pageNumber; j++){
            pageNoList.add(j);
        }
        showList1();
        return null;
    }
    
    public PageReference hide(){
        val=false;
        return null;        
    }
    public void EditName(){
        inputText = true;
        outputText = false;
    }
    
    public PageReference editAccName() {
        String editid = getParam('accountid');
        getAcc = [SELECT id,Name,Phone FROM Account WHERE Id=:editid];
        return null;
    }
    
    public void saveAccName(){
        system.debug(getAcc);
        update accList;
        getAcc = null;
    }
    
    public void showList(){
        pageList.clear();
        string i = getParam('pageno');
        integer s = integer.valueOf(i);
        integer k = (s-1)*PageSize;
        if(k+5<=accList.size()){
            for(integer j = k ; j<k+PageSize ; j++){
                pageList.add(accList[j]);
            }
        }
        else{
            for(integer j = k ; j<accList.size() ; j++){
                pageList.add(accList[j]);
            }
        }
        val=true;      
        
    }
    
    public void showList1(){
        pageList.clear();
        integer s = 1;
        integer k = (s-1)*PageSize;
        if(k+5<=accList.size()){
            for(integer j = k ; j<k+PageSize ; j++){
                pageList.add(accList[j]);
            }
        }
        else{
            for(integer j = k ; j<accList.size() ; j++){
                pageList.add(accList[j]);
            }
        }
        val=true;      
        
    }
   
}