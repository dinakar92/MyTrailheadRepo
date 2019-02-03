({
	doInit : function(component, event, helper) {
		var action = component.get("c.getAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accountsList", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
	},
    
    getAccDetail : function(component, event, helper) {
        var selectedItem = event.currentTarget;
        var index = selectedItem.dataset.record; 
        var selectedAcc = component.get("v.accountsList")[index];
	        
        component.set("v.id", selectedAcc.Id);
        component.set("v.showdata", "true");
    },
    
    editAccount : function(component, event, helper) {
        var selectedItem = event.currentTarget;
        var index = selectedItem.dataset.record; 
        var selectedAcc = component.get("v.accountsList")[index];
        
    	var editRecord = $A.get("e.force:editRecord");
        editRecord.setParams({
            "recordId": selectedAcc.Id
        });
        editRecord.fire();
    },
    
    refreshList : function(component, event, helper) {
        $A.get("e.force:refreshView").fire();
    },
    
    deleteAccount : function(component, event, helper) {
        if(confirm("Are you sure?")) {
    		helper.deleteAcc(component, event);    
        }
    },
    
    deleteAccounts : function(component, event, helper) {
        var delId = [];
  		var getAllId = component.find("AccSel");    
        for (var i = 0; i < getAllId.length; i++) {
            if (getAllId[i].get("v.checked") == true) {
                delId.push(getAllId[i].get("v.value").Id);
            }
        }
        if(delId.length == 0) {
            alert("Select Accounts to Delete");
        }
        else if(confirm("Are you sure?")) {
        	helper.deleteSelectedHelper(component, event, delId);
        }
    },
    
    createNewAccount : function(component, event, helper) {
		var createRecord = $A.get("e.force:createRecord");
        createRecord.setParams({
            "entityApiName": "Account"
        });
        createRecord.fire();
	},

    openModel: function(component, event, helper) {
        var updtAcc = [];
        var getAllId = component.find("AccSel");    
        for (var i = 0; i < getAllId.length; i++) {
            if (getAllId[i].get("v.checked") == true) {
                updtAcc.push(getAllId[i].get("v.value"));
            }
        }
        if(updtAcc.length == 0) {
            alert("Select Accounts to Update");
        }
        else {
            component.set("v.updateableAccounts", updtAcc);
            component.set("v.isOpen", true);
        }
        
   },
 
   closeModel: function(component, event, helper) {
      component.set("v.isOpen", false);
   },
 
   updateAcc: function(component, event, helper) {
      var accSrc = component.find("selectAccSrc").get("v.value");
      console.log(accSrc);
      var accsToUpdt = component.get("v.updateableAccounts");
      console.log(accsToUpdt);
      var action = component.get("c.massUpdateAccSource");
      action.setParams({"lstAcc": accsToUpdt, "newAccSrc": accSrc});
      action.setCallback(this, function(response) {
          var state = response.getState();
          if (state === "SUCCESS") {
              component.set("v.isOpen", false);
              helper.refresh(component, event);
          }
          else {
              console.log("Failed with state: " + state);
          }
      });
      $A.enqueueAction(action);
   },
    
})