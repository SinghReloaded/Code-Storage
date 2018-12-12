public class Book {
    public string name{get;set;}
    public string price{get;set;}
    
    public Book(ApexPages.StandardController controller)
    {
        name='sfdc_tutorial';
        price='$200';
    }
    public string createPriceItems(String name, Integer pages)
    {
        String concatVal = name+pages;
        return concatVal;
    }
}