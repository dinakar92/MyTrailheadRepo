@isTest
private class LeadProcessorTest {
    @isTest
    private static void testMethod1 () {
        List<Lead> lstLeadsToInsert = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead ld = new Lead (LastName = 'Kesavamattam'+i, Company='Capg'+i, MobilePhone='1234567890', Status = 'Open - Not Contacted');
            lstLeadsToInsert.add(ld);
        }
        if (lstLeadsToInsert.size() > 0) {
            Database.Insert(lstLeadsToInsert);
        }
        Test.startTest();
        LeadProcessor obj = new LeadProcessor();
        Database.executeBatch(obj);
        Test.stopTest();
        
        for (Lead ld : [Select Id, Status from Lead where LastName LIKE '%Kesavamattam%']) {
            System.assertEquals('Dreamforce', ld.Status);
        } 
    }
}