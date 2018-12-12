({
	getContactRecords : function(component) 
    {
        var action = component.get("c.fetchContactRecords");
        var self = this;
        action.setCallback(this,function(actionResult){
            var state = actionResult.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.Contacts", actionResult.getReturnValue());
                console.log(component.get("v.Contacts"));
            }
        });
        $A.enqueueAction(action);
	}
})