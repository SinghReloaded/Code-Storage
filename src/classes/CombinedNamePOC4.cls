public class CombinedNamePOC4 
{
    public Account accObj ;
    public String Combine{get;set;}
    public CombinedNamePOC4(ApexPages.StandardController controller)
    {
       accObj = new Account();      
       accObj = (Account)controller.getRecord();
    }  
    public void Done()
    {
       //Combine=accObj.Salutation__c+accObj.Name;
       //insert accObj ;
       //System.debug(Combine);
       //ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO,Combine));
       //return null;
    }
}