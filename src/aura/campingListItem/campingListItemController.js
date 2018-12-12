({
	packItem : function(component, event, helper) {
        var ItemVal = component.get('v.item');
        ItemVal.Packed__c = true;
        component.set('v.item',ItemVal);
        var BtnClicked = event.getSource();
		BtnClicked.set('v.Disabled',true);
	}
})