({
    onLoad: function(component, event) {
        var action = component.get("c.getAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accountsList", response.getReturnValue());
            }
            else {
                alert("Load failed");
            }
        });
        $A.enqueueAction(action);
    },
    
	deleteAcc : function(component, event) {
        var selectedItem = event.currentTarget;
        var index = selectedItem.dataset.record; 
        var selectedAcc = component.get("v.accountsList")[index];
        
		var action = component.get("c.delteAccount");
        action.setParams({"accid" : selectedAcc.Id});
        action.setCallback(this, function(response) {
        	component.set("v.accountsList",response.getReturnValue());
        });
        $A.enqueueAction(action);
	},
    
    deleteSelectedHelper : function(component, event, deleteRecordsIds) {
    	var action = component.get("c.deleteRecords");
        action.setParams({
            "lstRecordId": deleteRecordsIds
        });
        action.setCallback(this, function(response) {
        	var state = response.getState();
            if (state === "SUCCESS") {
            	this.onLoad(component, event);
            }
            else {
                alert("Error occured during mass delete");
            }
        });
        $A.enqueueAction(action);
    },
    
    refresh : function(component, event) {
  		this.onLoad(component, event);
    },
})