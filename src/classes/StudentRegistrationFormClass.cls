public class StudentRegistrationFormClass {
    @AuraEnabled
    public static void CreateStudentEntry (String studentName, String fatherName, Integer mobile, Integer fee) {
        try {
            if (studentName != null && fatherName != null && mobile != null && fee != null) {
            	Database.Insert(new Student_Registration__c (Name= studentName, Father_Name__c= fatherName, Mobile__c= mobile, Fee__c= fee));        
            }
        }
        catch (Exception e) {
            system.debug('Error in creating Student detail :: '+e.getMessage());
        }
    }
}