trigger CreatePolicy on Policy_Details__c (after insert) 
{
    List<Policy__C> lp=new List<Policy__C>();
    for(Policy_Details__c pd : trigger.new)
    {
        Policy__c p=new Policy__C();
        p.Name=pd.Policy_Name__c;
        p.Policy_Number__c=pd.Name;
        p.Policy_Holder__c=pd.Policy_Holder__c;
        lp.add(p);
        insert lp;
    }

}