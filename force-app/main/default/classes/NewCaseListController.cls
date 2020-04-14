public with sharing class NewCaseListController {

    public static integer getNewCases(List<Case> caseList){
       List<Case> results =[SELECT ID, CaseNumber FROM Case WHERE id IN: caseList LIMIT 10];

       return results.size();

    }
}