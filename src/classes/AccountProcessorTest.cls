@isTest
public class AccountProcessorTest {
    @isTest
    public static void testMethod1() {
        Account acc = new Account (Name = 'Dinakar');
        Insert acc;
        Contact con = new Contact (FirstName = 'Dinakar', LastName = 'Kesavamattam', Account = acc);
        Insert con;
        Test.startTest();
        AccountProcessor.countContacts(new List<ID>{acc.Id});
        Test.stopTest();
    }
}