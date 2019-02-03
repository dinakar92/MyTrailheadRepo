({
    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    
    handleAddItem: function(component, event, helper) {
        var newCamping = event.getParam("item");
        var action = component.get("c.saveItem");
        action.setParams({
            "camping": newCamping
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var campaigns = component.get("v.items");
                campaigns.push(response.getReturnValue());
                component.set("v.items", campaigns);
            }
        });
        
         $A.enqueueAction(action);
    }
})