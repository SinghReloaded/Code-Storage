({
	clickCreate : function(component, event, helper) 
    {
        var FN=component.get('v.FirstName');
        var action=component.get('c.aa');
        action.setParams({'FirstName':FN});        
        $A.enqueueAction(action);
	}
})