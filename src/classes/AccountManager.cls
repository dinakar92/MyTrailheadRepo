@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing  class AccountManager {
    //TEST CODE VSCODE UPDATE 1
	@HttpGet
    global static Account getAccount () {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        Account result =  [SELECT ID, Name, (Select ID, Name from Contacts) FROM Account WHERE Id = :accountId];
        return result;
    }
}