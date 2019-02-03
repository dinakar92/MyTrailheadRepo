public class NewCaseListController {

    private String caseStatus = 'New';
    public List<Case> getNewCases () {
        List<Case> results = [SELECT Id, CaseNumber FROM CASE WHERE Status =: caseStatus];
        return results;
    }
}