public class ChildRecordCreation {
 
    public Account accObj ;
    public ChildRecordCreation(ApexPages.StandardController controller) {
       accObj = new Account();
       
       accObj = (Account)controller.getRecord();
        
    }
      
    public PageReference doSave()
    {
        System.debug( 'Account Name--- ' +  accObj.Name +  ' AccountNumber   ' + accObj.AccountNumber + ' Type  ' +  accObj.Type  );

        insert accObj ;
        
        List<AccountChild__c> l2 = new List<AccountChild__c>();
        AccountChild__c Al = new AccountChild__c();
        Al.Name = accObj.Name ;
        Al.AccName__c = accObj.AccountNumber ;
        Al.AccNumber__c = accObj.Type ;
        Al.Type__c = accObj.Type ;
        Al.AccountRelation__c = accObj.Id ;
        
        l2.add(Al);
        insert l2;
        
        return null;
    }
}