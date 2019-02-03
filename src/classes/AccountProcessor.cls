public class AccountProcessor {
    //TEST CODE VS CODE UPDATE 1
    @future
    public static void countContacts(List<ID> AccIDs) {        
        List<Account> lstAcc = [Select Id, Name, Number_of_Contacts__c, (Select Id, Name from Contacts) from Account where Id IN: AccIDs];
        List<Account> accToUpdate = new List<Account>();
        for (Account acc : lstAcc ) {
            acc.Number_of_Contacts__c = acc.Contacts.size();
            accToUpdate.add(acc);
        }
        if (accToUpdate.size() > 0) {
            Database.Update(accToUpdate);
        }
    }
}