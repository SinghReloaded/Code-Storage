@istest
public class MyFirstTestClass{

    
    public static testmethod void  methodOne(){
    
        List<Account> accList = [select name from Account where  id = '0011N00001ET3gA' ];
        
        System.debug( 'accList ' + accList );
    }
}