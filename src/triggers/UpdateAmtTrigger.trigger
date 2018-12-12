trigger UpdateAmtTrigger on Account (before update) 
{
    for(Account ac : trigger.new)
    {
    if(ac.New_Amount__c != null && trigger.oldMap.get(ac.id).New_Amount__c != null && trigger.newMap.get(ac.id).New_Amount__c != null)
    {
        ac.Old_Amount__c=trigger.oldMap.get(ac.id).New_Amount__c;
        ac.New_Amount__c=trigger.newMap.get(ac.id).New_Amount__c;
    }    
    }    
}