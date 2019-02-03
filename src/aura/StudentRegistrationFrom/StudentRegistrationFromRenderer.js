({
    render : function (component, helper) {
        var v = this.superRender();
        console.log("From Render method");
        return v;
    },
    
    afterRender : function (component, helper) {
        this.superAfterRender();
        console.log("From afterRender method");
    },
 
     rerender : function (component, helper) {
        this.superRerender();
        console.log("From reRender method");

    },

    unrender : function (component, helper) {
        this.superUnrender();
        console.log("From unRender method");
    }
})