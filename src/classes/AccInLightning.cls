global class AccInLightning
{
    @auraenabled
    public static void aa(String First)
    {
        List<Account> Acc = new List<Account>();
        Account a1 = new Account(Name=First);
        System.debug('&&&&'+First);
        Acc.add(a1);
        insert  Acc;
    }

}