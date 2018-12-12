({	    
    getCountryPicklistValues : function(component)
    {
        var action = component.get('c.fetchCountryPicklistVal');
        var self = this;
        action.setCallback(this,function(actionResult){
            var state = actionResult.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.CountryValues", actionResult.getReturnValue());
                console.log(component.get("v.CountryValues"));
            }
        });
        $A.enqueueAction(action);
    },
    
    getStatePicklistValues : function(component)
    {
        var action = component.get('c.fetchStatePicklistVal');
        var Ctry = component.find("ParentPicklist").get('v.value');
        var CtryRecords = JSON.stringify(Ctry);
        console.log('Country ka naam-->'+CtryRecords);
        action.setParams({Country : Ctry});        
        var self = this;
        action.setCallback(this,function(actionResult){
            var state = actionResult.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.StateValues", actionResult.getReturnValue());
                console.log(component.get("v.StateValues"));
            }
        });
        $A.enqueueAction(action);
    }
})