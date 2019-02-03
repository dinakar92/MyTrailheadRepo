({
	buttonClick : function(cmp, event, helper) {
        var lb = event.getSource().get("v.label");
        if (lb == "Close Form") {
            cmp.set("v.dynamicLabel","Open Form");
            cmp.set("v.showForm",false);
        }
         if (lb == "Open Form") {
            cmp.set("v.dynamicLabel","Close Form");
            cmp.set("v.showForm",true);
        }
            
        
	}
})