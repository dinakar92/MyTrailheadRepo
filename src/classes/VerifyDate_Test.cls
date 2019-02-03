@isTest
private class VerifyDate_Test{
  static testMethod void test_CheckDates_UseCase1(){
    VerifyDate obj01 = new VerifyDate();
    VerifyDate.CheckDates(Date.today(),Date.today());
  }
}