@isTest
public with sharing class NewCaseListControllerText {
    @isTest
    public static void NewCaseListControllerText() {
        List<Case> caseList = TestDataFactory.CreateCase(20);
        system.assertEquals(10, NewCaseListController.getNewCases(caseList));
    }
}