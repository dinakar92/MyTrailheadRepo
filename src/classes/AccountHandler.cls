public class AccountHandler {
    //TEST CODE vscode 02032019 update 1
    public static Account insertNewAccount (string accName) {
        Account acc = new Account(Name=accName);
        try {
        	Database.SaveResult sr = Database.insert(acc,false);
            if(sr.isSuccess()){
                return acc;   
            }
            else {
                return null;
                //test line
            }    
        }
        catch (DmlException e) {
            system.debug('EXCEPTION :: '+ e.getMessage());
            return null;
        }
    }
}