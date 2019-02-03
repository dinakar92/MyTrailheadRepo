public class FetchAccounts {
    @AuraEnabled
    public static List <String> getselectOptions(sObject objObject, string fld) {
        List <String> allOpts = new list <String> ();
        Schema.sObjectType objType = objObject.getSObjectType();
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        map <String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
        list <Schema.PicklistEntry> values = fieldMap.get(fld).getDescribe().getPickListValues();
        for (Schema.PicklistEntry a : values) {
            allOpts.add(a.getValue());
        }
        allOpts.sort();
        return allOpts;
    }
    
	@AuraEnabled
    public static List<Account> getAccounts() {
        List<Account> lstAcc = [Select Id, Name, AccountNumber, Owner.Name, OwnerId, AccountSource, AnnualRevenue, Type, Industry, ParentId, CreatedBy.Name, CreatedById, Phone, Fax, Description, LastModifiedById from Account order by CreatedDate DESC limit 10];
        return lstAcc;
    }
    
    @Auraenabled
    public static List<Account> delteAccount(String accid)
    {
        Account delAccount = [Select Id from Account where id =: accid];
        delete delAccount;
        return [Select Id, Name, AccountNumber, Owner.Name, OwnerId, AccountSource, AnnualRevenue, Type, Industry, ParentId, CreatedBy.Name, CreatedById, Phone, Fax, Description, LastModifiedById from Account order by CreatedDate DESC LIMIT 10];
    }
    
    @AuraEnabled
 	public static void deleteRecords(List <String> lstRecordId) {
    	List <Account> lstDeleteRec = [select Id from Account where id IN: lstRecordId];
        delete lstDeleteRec;
    }
    
    @AuraEnabled
 	public static void massUpdateAccSource(List <Account> lstAcc, String newAccSrc) {
        List <Account> newlst = new List <Account>();
        for (Account acc : lstAcc) {
            acc.AccountSource = newAccSrc;
            newlst.add(acc);
        }
        update newlst;
    }
    
}