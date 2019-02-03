@isTest
private class EmailManager_Test{
  static testMethod void test_sendMail_UseCase1(){
    EmailManager obj01 = new EmailManager();
    EmailManager.sendMail('dinakar.zt@gmail.com','test data','test data');
  }
}