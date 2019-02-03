global class DailyLeadProcessor implements Schedulable {
    global void execute (SchedulableContext sc) {
        List<Lead> leadLstToUpdate = new List<Lead>();
        List<Lead> lstLead = [Select Id, LeadSource from Lead where LeadSource = null limit 200];
        for (Lead ld : lstLead) {
            ld.LeadSource = 'Dreamforce';
            leadLstToUpdate.add(ld);
        }
        if (leadLstToUpdate.size() > 0) {
            Database.Update(leadLstToUpdate);
        }
    }
}