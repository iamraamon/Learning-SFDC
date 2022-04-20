public without sharing class ContactController {
    @AuraEnabled  
    public static string saveContact(Contact contactRec, string file, string fileName) {  
        string contactId;  
        try{  
            Insert contactRec;  
            contactId = contactRec.Id;  
            String base64File = EncodingUtil.urlDecode(file, 'UTF-8');     
            ContentVersion contentVersionRec = new ContentVersion();  
            contentVersionRec.Title = fileName;  
            contentVersionRec.PathOnClient = '/' + fileName;  
            contentVersionRec.FirstPublishLocationId = contactRec.Id;  
            contentVersionRec.VersionData = EncodingUtil.base64Decode(base64File);  
            contentVersionRec.IsMajorVersion = true;  
            Insert contentVersionRec;  
        } catch(Exception ex){  
            system.debug('Exception===>'+ex.getMessage());  
        }  
        return contactId;  
    } 
    
    
    @AuraEnabled  
    public static string saveContactWithPLI(Contact contactRec, string file, string fileName,List<Product_Line_Item__c> plis) {  
        string contactId;  
        system.debug('---prod list'+plis);
        Savepoint sp = null;
        try{  
            Database.Insert(contactRec);  
            contactId = contactRec.Id;  
            sp = Database.setSavepoint();
            system.debug('*****************contactRec******************************************************************'+contactId);
            String base64File = EncodingUtil.urlDecode(file, 'UTF-8');     
            ContentVersion contentVersionRec = new ContentVersion();  
            contentVersionRec.Title = fileName;  
            contentVersionRec.PathOnClient = '/' + fileName;  
            contentVersionRec.FirstPublishLocationId = contactId;  
            contentVersionRec.VersionData = EncodingUtil.base64Decode(base64File);  
            contentVersionRec.IsMajorVersion = true;  
            Database.Insert(contentVersionRec);  
            system.debug('=====================******************========================================');
                     
            
            for( Product_Line_Item__c pli : plis){
                pli.Claim_Id__c =  contactId;  
                pli.File_Upload_Id__c=contentVersionRec.Id;
                pli.contact__c=contactId;
            }
            inSERT plis; 
        } catch(Exception ex){  
            system.debug('Exception===>'+ex.getMessage());  
            Database.RollBack(sp);
        }  
        return contactId;  
    } 
}