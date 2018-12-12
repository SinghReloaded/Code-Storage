public class AttachFile_Demo 
{
    public Candidate__c myCandidate;
    private Attachment myDocument;
    public Attachment myDoc
{
        get
        {
            if(myDocument==null)
            {
                myDocument = new Attachment();
            }
            return myDocument;
        }
        set;
    }
    public AttachFile_Demo(ApexPages.StandardController controller)
    {
        myCandidate = new Candidate__c();
        myCandidate = (Candidate__c) controller.getRecord();
    } 
    public PageReference upload()
    {
        insert myCandidate;
        myDoc.parentId = myCandidate.Id;
        insert myDoc;
        return null;
    }
}