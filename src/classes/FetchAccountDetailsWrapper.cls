public class FetchAccountDetailsWrapper 
{
    public class DisplayAccountRecords 
    {
        @AuraEnabled public boolean isSelected;
        @AuraEnabled public boolean isDisabled;
        @AuraEnabled public string AccountName;
        @AuraEnabled public string Industry;
        @AuraEnabled public string CreatedDate;
        @AuraEnabled public string AccountId;
        
        public DisplayAccountRecords(){
            isSelected = false;
            isDisabled = true;
            AccountName='';
            Industry = '';
            CreatedDate = '';
        }
    }
}