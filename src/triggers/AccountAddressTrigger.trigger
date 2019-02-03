trigger AccountAddressTrigger on Account (before insert, before update) {
    //TEST CODE VS CODE UPDATE 1
    for (Account a : Trigger.New) {
        if(String.isNotBlank(a.BillingPostalCode) && a.Match_Billing_Address__c == true) {
             a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}