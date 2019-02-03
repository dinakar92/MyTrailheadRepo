@isTest
private class AddPrimaryContactTest {
    @isTest
    private static void testMethod1 () {
        List<Account> nyAccLst = new List<Account>();
        List<Account> caAccLst = new List<Account>();
        
        for (Integer i = 0; i < 50 ; i++) {
            Account accNY = new Account (Name='Dinakar'+i, BillingState='NY');
            Account accCA = new Account (Name='Dinnu'+i, BillingState='CA');
            nyAccLst.add(accNY);
            caAccLst.add(accCA);
        }
        if (nyAccLst.size() > 0 && caAccLst.size() > 0) {
            Database.Insert(nyAccLst);
            Database.Insert(caAccLst);
        }
        
        Contact con = new Contact (FirstName = 'test', LastName='test1');
        insert con;
        
        Test.startTest();
        AddPrimaryContact obj = new AddPrimaryContact(con, 'CA');
        System.enqueueJob(obj);
        Test.stopTest();
        
        for (Account acc : caAccLst) {
            System.assertEquals (1, acc.Contacts.size());
        }
    }
}