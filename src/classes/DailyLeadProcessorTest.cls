@isTest
private class DailyLeadProcessorTest {
    @isTest
    private static void testMethod1 () {
        List<Lead> lstToInsert = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead ld = new Lead (LastName = 'test'+i, Company = 'Capg', MobilePhone = '1234567890', Status = 'Open - Not Contacted');
            lstToInsert.add(ld);
        }
        if (lstToInsert.size() > 0) {
            Database.Insert(lstToInsert);
        }
        
        Test.startTest();
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        DailyLeadProcessor obj = new DailyLeadProcessor();
        System.schedule('New Test Job', CRON_EXP , obj);
        Test.stopTest();
        
        
    }
}