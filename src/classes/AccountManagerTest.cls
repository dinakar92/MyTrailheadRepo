@IsTest
private class AccountManagerTest {
	@isTest
    private static void testMethod1 () {
        Account acc = new Account (Name = 'Test Account');
        Insert acc;
        Contact con = new Contact (AccountId = acc.Id, LastName = 'Test Contact');
        Insert con;
        
        RestRequest request = new RestRequest();
        request.requestUri = 'https://dinakar92-dev-ed.my.salesforce.com/services/apexrest/Accounts/' + acc.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account result = AccountManager.getAccount();
        
        System.assertEquals(1, result.contacts.size());
        System.assertEquals('Test Account', result.Name);
        System.assertEquals('Test Contact', result.contacts[0].Name);
    }
}