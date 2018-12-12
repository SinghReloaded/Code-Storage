({
    handleUploadFinished: function (component, event,helper) {
        // Get the list of uploaded files
        var uploadedFiles = event.getParam("files");
        var uploadedFilesObj;
        for( var item in uploadedFiles){
            console.log("Files uploaded333 : " + JSON.stringify(uploadedFiles[item]) );
            uploadedFilesObj = uploadedFiles[item] ;
        }
        
        //helper.uploadHelper(component, event, helper, uploadedFilesObj );
    }
})