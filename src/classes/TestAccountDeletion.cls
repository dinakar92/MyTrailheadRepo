@isTest
private class TestAccountDeletion {
    static void TestDeleteAccountWithOneOpportunity () {
        
        // Create an account with an opportunity, and then try to delete it

        Account acc = new Account (Name = 'Test Account');
        insert acc;
        Opportunity op = new Opportunity (Name=acc.Name + ' Opportunity',
                                          StageName='Prospecting',
                                          CloseDate=System.today().addMonths(1),
                                          AccountId=acc.Id);
        insert op;
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(acc, false);
        Test.stopTest();
        
    }
}