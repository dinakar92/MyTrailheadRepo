({
    showAlert : function(component, event, helper) {
        alert('Test Alert');
    },
   
    doInit : function(component, event, helper) {
        var userId = $A.get("$SObectType.CurrentUser.Id");
        console.log(userId);
        //component.set("v.currentUserName",userId);

    }
})