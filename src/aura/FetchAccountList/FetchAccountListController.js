({
    doInit : function(component, event, helper) 
    {
        helper.getAccountDetails(component);		
    },
    
    display : function(component, event, helper) 
    {        
        var lstAcc = component.get("v.Accounts");
        component.set("v.isDisabled", true);
        if(!$A.util.isEmpty(lstAcc) && !$A.util.isUndefined(lstAcc))
        {
            var action = component.get("c.DisplayRecords");
            var AccRecords = JSON.stringify(lstAcc); 
            console.log('AccRecords-->'+AccRecords);
            action.setParams({AccountRecords : AccRecords});
            
            action.setCallback(this,function(a){
                var state = a.getState();
                if(state == "SUCCESS"){
                    alert('Success in calling server side action');  
                    component.set('v.Accounts',a.getReturnValue());
                } else if(state == "ERROR"){
                    alert('Error in calling server side action');
                }
            });
            
            $A.enqueueAction(action);
            
        }
        
        
    }
})