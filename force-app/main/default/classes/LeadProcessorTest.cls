@isTest
private class LeadProcessorTest {
    
    @testSetup
    static void setup(){
        
        List<Lead> leadList=new List<Lead>();
        for(Integer i=0;i<200;i++) {
            leadList.add(new Lead(LastName='Lead'+i,
                                 Company='Company'+i,
                                 status='Open - Not Contacted'));
        }
        insert leadList;
    }   
        static testmethod void test(){
            
            Test.startTest();
            LeadProcessor myLeadObject=new LeadProcessor();
            Id batchId=Database.executeBatch(myLeadObject);
            Test.stopTest(); 
           System.assertEquals(200,[SELECT count() FROM Lead WHERE leadSource='DreamForce']); 
            
        }
    }