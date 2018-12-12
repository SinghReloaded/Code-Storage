public class uploadImageClass {
    
    
    @AuraEnabled
    public static Id saveChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert, 
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks   
        saveTheFile(parentId, fileName, base64Data, contentType);
        return Id.valueOf(fileId);
    }
    
    
    public static void saveTheFile(Id parentId, String fileName, String base64Data, String contentType) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
 
        Attachment oAttachment = new Attachment();
        oAttachment.parentId = parentId;
 
        oAttachment.Body = EncodingUtil.base64Decode(base64Data);
        oAttachment.Name = fileName;
        oAttachment.ContentType = contentType;
 
        insert oAttachment;
        
        
        // User uobj = new User();
        // uobj.Id = parentId ;
        // uobj.FullPhotoUrl = EncodingUtil.base64Decode(base64Data);
 		
        // update uobj ;
        
    }
    
    
    
}