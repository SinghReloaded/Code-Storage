public class Buttons 
{   
    public integer counter=0;
    public integer list_size=10;
    public integer a=0;
    public integer total_size; 
    public List<Account> la{get;set;}
    public Buttons()
    {
       la=new List<Account>();
       la=[select Name,AccountNumber,Creation_Date__c from Account Order By Name limit 10]; 
       total_size=[select count() from Account];
    }
         
    public PageReference first() {  
       counter=0;
       a=0;
       la=[select Name,AccountNumber,Creation_Date__c from Account Order By Name limit 10];        
       return null;
    }

    public PageReference previous() {
         counter -= list_size;
         a=a-10;
         la=[select Name,AccountNumber,Creation_Date__c from Account Order By Name limit 10 offset :a]; 
         return null;
    }
    
    public PageReference next() {    
        counter += list_size;
        a=a+10;
        la=[select Name,AccountNumber,Creation_Date__c from Account Order By Name limit 10 offset :a];
        return null;
    }

    public PageReference last() {     
         counter = total_size - math.mod(total_size, list_size);
         a=total_size - math.mod(total_size, list_size);
         la=[select Name,AccountNumber,Creation_Date__c from Account Order By Name limit 10 offset :counter];
        return null;
    }
    
     public Boolean getDisabledPrevious() {
        if(counter>0)
             return false;
         else 
             return true;
        
    }

    public Boolean getDisabledNext() {    
        if (counter + list_size < total_size) 
            return false; 
        else 
            return true;
     }
}