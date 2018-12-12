global class CreatingAccount 
{
    @auraenabled
    public static void MyAccount(String First,String ANum,String CDate,String PVal)
    {
        List<Account> la=new List<Account>();
        Account act=new Account(Name=First,AccountNumber=ANum,Creation_Date__c=Date.valueOf(CDate),Ownership=PVal);
        la.add(act);
        insert la;
    }

}