({
	createItem : function(component, newCampingItem) {
        var action = component.get("c.saveItem");
        action.setParams({
            "camping": newCampingItem
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var campings = component.get("v.items");
                var item = JSON.parse(JSON.stringify(newCampingItem));
                 
                campings.push(item);
                 
                component.set("v.items",campings);
                component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                'Price__c': 0,'Packed__c': false });
            }
        });
        $A.enqueueAction(action);
    }
})