global class LeadProcessor implements Database.Batchable<sObject>  {
    global Database.QueryLocator start (Database.BatchableContext bc) {
        return Database.getQueryLocator('Select Id, LeadSource from Lead');
    }
    global void execute (Database.BatchableContext bc, List<Lead> scope) {
        List<Lead> lstLeadsToUpdate = new List<Lead>();
        for (Lead ld : scope) {
            ld.LeadSource = 'Dreamforce';
            lstLeadsToUpdate.add(ld);
        }
        if (lstLeadsToUpdate.size() > 0) {
            Database.Update(lstLeadsToUpdate);
        }
    }
    global void finish (Database.BatchableContext bc) {
    
    }
}