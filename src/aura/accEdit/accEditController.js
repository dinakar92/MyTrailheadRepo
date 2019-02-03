({
	handleSaveRecord: function(component, event, helper) {
        component.find("recordEdit").saveRecord($A.getCallback(function(response) {
            if (response.state === "SUCCESS" || response.state === "DRAFT") {
                console.log("Save completed successfully.");
            } else if (response.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (response.state === "ERROR") {
                console.log('Problem saving record, error: ' + 
                           JSON.stringify(response.error));
            } else {
                console.log('Unknown problem, state: ' + response.state + ', error: ' + JSON.stringify(response.error));
            }
        }));
    }
})