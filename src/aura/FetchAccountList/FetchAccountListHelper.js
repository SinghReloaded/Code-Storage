({
    getAccountDetails : function(component) 
    {
        var action = component.get("c.getAccountRecords");
        var self = this;
        /*if(isDisabled.Checked=='true'){ 
            var button = event.getSource();
            button.set('v.isDisabled',false);
        }*/
        action.setCallback(this,function(actionResult){
            var state = actionResult.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.Accounts", actionResult.getReturnValue());
                console.log(component.get("v.Accounts"));
            }
        });
        $A.enqueueAction(action);
    }
})