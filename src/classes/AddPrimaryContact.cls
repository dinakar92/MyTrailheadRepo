public class AddPrimaryContact implements Queueable {

    private String state;
    private Contact c = new Contact();
    
    public AddPrimaryContact (Contact con, String stateAbb) {
        this.state = stateAbb;
        this.c = con;
    }
    
    public void execute (QueueableContext q) {
        List<Account> lstAcc = [Select Id, Name, (Select Id, FirstName, LastName from Contacts) from Account where BillingState =: state limit 200];
        List<Contact> lstCon = new List<Contact>();
        for (Account acc : lstAcc) {
            Contact cont = c.clone(false,false,false,false); 
            cont.AccountId = acc.Id;
            lstCon.add(cont);
        }
        if (lstCon.size() > 0) {
            Database.Insert(lstCon);
        }
    }
}