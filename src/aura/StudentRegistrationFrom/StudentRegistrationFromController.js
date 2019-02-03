({
    doInit : function(cmp, e, hlpr) {
        alert('init method called');
        cmp.set('v.StudentName','test student');
        cmp.set('v.FatherName','test father');
        cmp.set('v.Mobile', '0000000000');
    },
    
	createStudent : function(cmp, e, hlpr) {
        if (cmp.get('v.StudentName') == '' || cmp.get('v.FatherName') == '' || cmp.get('v.Mobile') == '' || cmp.get('v.Fee') == '') {
            alert("Please enter all required details");
        }
        else {
            var action = cmp.get("c.CreateStudentEntry");
            action.setParams({"studentName": cmp.get('v.StudentName'),
                              "fatherName": cmp.get('v.FatherName'),
                              "mobile": cmp.get('v.Mobile'),
                              "fee": cmp.get('v.Fee')});
    
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state == "SUCCESS") {
                    alert("Student Entry Successful !!!");
                    location.reload();
                    console.log(state);
                } 
                else {
                    alert("Student Entry Failed !!!");
                    console.log(state);
                }
            });     
            
            $A.enqueueAction(action);
        }
        
        
		/*var checkxyz = comp.get("v.xyz");
        if (checkxyz == "false")
            comp.set("v.xyz","true");
        else
            comp.set("v.xyz","false");
        alert("value of xyz = "+ comp.get("v.xyz"));*/
	}
})