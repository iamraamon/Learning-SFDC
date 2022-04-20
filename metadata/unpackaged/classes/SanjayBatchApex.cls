global class SanjayBatchApex implements database.Batchable<sObject>,database.stateful {
    
    global class BatchStatusWrapper {
        
        Account  acc {get;set;}
        String errorMessage {get;set;}
        boolean isSuccess {get;set;}
    }
    
    string header = 'Record Id, Name , Created Date, Modified Date \n';
    string finalstr = header ;
    
    
    global set<id> allIds=new set<id>();
    global set<id> allFailedId=new set<id>();
    global set<id> allSuccessId=new set<id>();
    global integer totalSizeRecords=0;
    
    
    global set<BatchStatusWrapper> allAccountsStatus=new set<BatchStatusWrapper>();
    global set<Account> allAccountsFailed=new set<Account>();
    global set<Account> allAccountsSuccess=new set<Account>();
    
    
    global database.QueryLocator start(database.BatchableContext bc){
        string myQuery='select id,name,rating,phone,MyEmail__c,type,industry from Account';
        return database.getQueryLocator(myQuery);
    }
    //execute Method
    global void execute(database.BatchableContext bc,list<Account> scope){
        totalSizeRecords+=scope.size();
        List<Account> accList = new List<Account>();
        for(Account a:scope){
            a.Industry='Education';
            allIds.add(a.id);
            accList.add(a);
        }
        system.debug('====All Ids===' +allIds);
        
        database.SaveResult[] myResult=database.update(scope,false);
        
        for(Integer i=0; i < myResult.size(); i++) {
            if(myResult.get(i).isSuccess()) {
                System.debug('Records are updated Successfully');
                allSuccessId.add(myResult.get(i).Id);
                //below to add succesfull account 
                // allAccountsSuccess.add(new Account(myResult.get(i).Id));
                BatchStatusWrapper  bsw = new BatchStatusWrapper();
                bsw.acc =new Account(id=myResult.get(i).Id);
                bsw.isSuccess = true;                
                allAccountsStatus.add(bsw);
            } 
            else if(!myResult.get(i).isSuccess()) {
                Database.Error errors =  myResult.get(i).getErrors().get(0);
                System.debug('Error Occurs While Processing The Record'+errors.getMessage());
                // System.debug('Failure Record Ids While Updating'+myResult.get(i).Id);
                allFailedId.add(accList.get(i).Id);
                
                //below to add failed account 
                //allAccountsFailed.add(new Account(myResult.get(i).Id));
                
                BatchStatusWrapper  bsw = new BatchStatusWrapper();
                bsw.acc =new Account(id=myResult.get(i).Id);
                bsw.errorMessage=errors.getMessage();
                bsw.isSuccess = false;                
                allAccountsStatus.add(bsw);
            }
        }
        
    }
    //finish Method  
    global void finish(database.BatchableContext bc){
        system.debug('All fails Ids===> ' +allFailedId);
        system.debug('All success Id---> ' +allSuccessId);
        system.debug('Total number of records processed ==> ' +totalSizeRecords);
        
        //send email 
        //
        List<Account > acclist = [Select id,name , CreatedDate , lastModifiedDate from Account limit 10];
        string header = 'Record Id, Name , Created Date, Modified Date \n';
        string finalstr = header ;
        for(Account a: acclist)
        {
            string recordString = '"'+a.id+'","'+a.Name+'","'+a.CreatedDate+'","'+a.LastModifiedDate +'"\n';
            finalstr = finalstr +recordString;
        }
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalstr);
        string csvname= 'Account.csv';
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
        String[] toAddresses = new list<string> {'test@test.com'};
            String subject ='Account CSV';
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setPlainTextBody('Account CSV ');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        
        
    }
    
}