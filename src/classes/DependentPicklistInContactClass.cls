public class DependentPicklistInContactClass 
{    
    @AuraEnabled
    public static List<Schema.Contact> fetchContactRecords()
    {
        return [SELECT Id,Name FROM Contact LIMIT 5];
    }
    
    @AuraEnabled
    public static List<string> fetchCountryPicklistVal()
    {
        List<string> lstCountry = new List<string>();
        List<CountryStatePicklistValue__c> lstval = [SELECT Name,Country__c,State__c FROM CountryStatePicklistValue__c ];
        
        for(CountryStatePicklistValue__c pvalrec : lstval)
        {
            lstCountry.add(pvalrec.Country__c);
            System.debug('List of Countries--->'+lstCountry);
        }
        return lstCountry;
    }
    
    @AuraEnabled
    public static List<string> fetchStatePicklistVal(String Country)
    {
        List<string> lstState = new List<string>();
        String str;
        List<CountryStatePicklistValue__c> lstval = [SELECT Name,Country__c,State__c FROM CountryStatePicklistValue__c ];
        
        for(CountryStatePicklistValue__c pvalrec : lstval)
        {
            if(pvalrec.Country__c== Country)
            {
                str = pvalrec.State__c;
                lstState = str.split(',');
            }
            System.debug('List of State--->'+lstState);
        }
        return lstState;
    }
    
    @AuraEnabled
    public static void SaveRecords(String Country,String State)
    {
        List<Schema.Contact> lstcon = new List<Schema.Contact>();
        Schema.Contact con = new Schema.Contact(Country__c=Country,State__c=State);
        lstcon.add(con);
        update lstcon;
    }
}