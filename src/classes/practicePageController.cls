public class practicePageController {

     public String myOffice{
    
        get{
            return 'Capgemini';
        }
        
        set;
    }
    
    
    public String getBangaloreOffice(){
        return 'Whitefield';
    }
    
    public List<String> countryList = new List<String>();
    public String officeAddr    {get;set;}
    
    public practicePageController(){
        /*countryList.add('A');
        countryList.add('B');
        countryList.add('C');
        countryList.add('D');
        countryList.add('E');*/
        
        officeAddr = 'Kolkata';
        
        myOffice = 'Bangalore';
        
    }
}