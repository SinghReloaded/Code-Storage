({
	InsertIntoAccountController : function(component, event, helper) 
    {
        var FN=component.get('v.FName');
        var AN=component.get('v.ANumber');
        var CD=component.get('v.Dt');
        var O=component.get('v.PickVal');
        var action=component.get('c.MyAccount');
        action.setParams({'First':FN,'ANum':AN,'CDate':CD,'PVal':O});
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