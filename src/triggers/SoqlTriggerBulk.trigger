trigger SoqlTriggerBulk on Account (after update) {
    for (Opportunity op : [SELECT Id, Name, CloseDate FROM Opportunity 
                                                    WHERE AccountId IN : Trigger.New]) {

    }
}