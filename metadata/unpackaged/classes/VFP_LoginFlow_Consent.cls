public class VFP_LoginFlow_Consent {
    
    public String Page {get; set;}
    public String OpenPageURL {get; set;}
    public   String    userid {get; set;}
    public  Boolean hasNotAcceptedTerms  {get; set;}
    public void OnLoadController()
    {
        
        system.debug('=======================OnLoadController===========================================');
        Page = '' ;
        OpenPageURL = '' ;
        
        userid = Userinfo.getUserId();
        hasNotAcceptedTerms=true;
        User usr = [Select Id,Name,Has_Accepted_Terms__c From User where Id = :userid Limit 1];
        String   userName = usr.Name; //remove String userName and only use userName
        hasNotAcceptedTerms=!( usr.Has_Accepted_Terms__c);
         hasNotAcceptedTerms=true;
        system.debug('----userName---'+userName);
        
        system.debug('----hasAcceptedTerms---'+hasNotAcceptedTerms);
    }
    
    public PageReference redirect()
    {
        if(Page == 'Accept')
        {
            //If user already accepted then don't call consent again
            
            User usr = [Select Id,Name,Has_Accepted_Terms__c From User where Id = :userid Limit 1];
            String   userName = usr.Name; //remove String userName and only use userName
            hasNotAcceptedTerms=!( usr.Has_Accepted_Terms__c);
            
            usr.Has_Accepted_Terms__c =true;
            
            update usr ;
            
            Blob beforeblob=Blob.valueOf('Consent Signature of '+userName+' has been captured');
            
            ContentVersion cv = new ContentVersion();
            cv.title = 'Consent Signature of '+userName;      
            cv.PathOnClient ='\nConsent';           
            cv.VersionData =beforeblob;          
            insert cv;         
            
            ContentVersion testContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :cv.Id];
            
            ContentDocumentLink contentlink=new ContentDocumentLink();
            contentlink.LinkedEntityId=usr.id;
            contentlink.ShareType= 'V';
            contentlink.ContentDocumentId=testcontent.ContentDocumentId;
            
            insert contentlink;
            
            
            system.debug('----userName---'+userName);
            
            system.debug('----hasAcceptedTerms---'+hasNotAcceptedTerms);
            
            
            OpenPageURL = '<a target="_blank" href="http://www.google.co.in/" rel="nofollow">http://www.google.co.in/</a>' ;
        }
        
        return null;
    }
    
}