({
    doInit : function(component, event, helper) {
        helper.getCountryPicklistValues(component);
    },
    
    PickChange : function(component, event, helper){
        helper.getStatePicklistValues(component);
        
    },
    
    doSave : function(component, event, helper)
    {
        var ctry = component.get('v.CountryValues');
        var state = component.get('v.StateValues');
        var cntct = component.get('v.Contacts');
        var ctlst = JSON.stringify(cntct);
        var action = component.get('c.SaveRecords');
        action.setParams({ 'Contact' : ctlst,'Country' : ctry,'State' : state});
        action.setCallback(this,function(response){
            if (response.getState() === "SUCCESS") {
                //var res = response.getReturnValue();
                console.log('SUCCESS!!');
                alert('Success!!');
            }
            else{
                alert(JSON.stringify(response.getError()));
            }
            
        });   
        $A.enqueueAction(action);        
    }
})