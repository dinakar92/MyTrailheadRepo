({
	onAccSelect : function(component, event, helper) {
        
        var acc = event.getParam("acc");
        //component.set("v.acc", acc);
        component.set("v.id", acc.Id);
        component.set("v.showdata", true);
        //document.getElementById("dynamic").innerHTML += '<force:recordData aura:id="service" recordId="{!v.id}" fields="Id, Name, AccountNumber, OwnerId, AccountSource, ParentId, AnnualRevenue, Type, CreatedById, LastModifiedById, Industry, Description, Phone, Fax" targetFields ="{!v.acc}" targetError="{!v.recordError}" mode="VIEW"/>';
        component.find("service").reloadRecord();
	},
    
})