public class FetchAccountDetailsClass 
{
    public class DisplayAccountRecords 
    {
        @AuraEnabled public boolean isSelected;
        @AuraEnabled public string AccountName;
        @AuraEnabled public string Industry;
        @AuraEnabled public string CreatedDate;
        @AuraEnabled public string AccountId;
        
        public DisplayAccountRecords(){
            isSelected = false;
            AccountName='';
            Industry = '';
            CreatedDate = '';
            AccountId = '';
        }
    }
    
    @AuraEnabled
    public static List<DisplayAccountRecords> getAccountRecords() {
        
        List<DisplayAccountRecords> lstAccountRecords = new List<DisplayAccountRecords>();
        
        List<Account> lstAccounts =  [SELECT Id,Name,Industry,Creation_Date__c FROM Account];
        
        if(lstAccounts != null && lstAccounts.size() > 0)
        {
            
            for(Account act : lstAccounts){
                
                DisplayAccountRecords ActRec = new DisplayAccountRecords();
                ActRec.AccountId = act.Id;
                ActRec.AccountName = act.Name;
                ActRec.Industry = act.Industry;
                ActRec.CreatedDate = String.valueOf(act.Creation_Date__c);
                
                lstAccountRecords.add(ActRec);
            }
            
        }
        
        
        return lstAccountRecords;
        
    }    
    @AuraEnabled
    public static List<DisplayAccountRecords> DisplayRecords(string AccountRecords) 
    {
        
        List<DisplayAccountRecords> lstAct = new List<DisplayAccountRecords>();
        if(!string.isBlank(AccountRecords)){
            
            List<DisplayAccountRecords> lstAccountRecords = 
                (List<DisplayAccountRecords>)System.JSON.deserialize(AccountRecords,List<DisplayAccountRecords>.class);
            
            system.debug('Debug for Dsiplaying all the records: lstAccountRecords'+lstAccountRecords);    
            
            for(DisplayAccountRecords objAccountRecords:lstAccountRecords)
            {
                if(objAccountRecords.isSelected == true)
                {   
                    DisplayAccountRecords ActRecds = new DisplayAccountRecords();
                    ActRecds.AccountId = objAccountRecords.AccountId;
                    ActRecds.AccountName = objAccountRecords.AccountName;
                    ActRecds.Industry = objAccountRecords.Industry;
                    ActRecds.CreatedDate = String.valueOf(objAccountRecords.CreatedDate);
                    
                    lstAct.add(ActRecds);
                    system.debug('Selected Record :'+objAccountRecords);
                }
            }           
        }
         return lstAct;
    }
    
}