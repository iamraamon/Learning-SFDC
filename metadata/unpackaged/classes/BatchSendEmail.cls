global class BatchSendEmail{
    
/*
implements database.Batchable<sObject>,database.stateful {
    
    global database.QueryLocator start(database.BatchableContext bc){
        string myQuery='select id,name,rating,phone,MyEmail__c,type,industry from Account';
        return database.getQueryLocator(myQuery);
    }
    
    
    global void execute(Database.batchablecontext bc ,list<Account> scope){
        
        // Check batch status - IF COMPLETED then 
        AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed,
                          TotalJobItems, CreatedBy.Email, ExtendedStatus
                          from AsyncApexJob where Status == 'Failed'];        
        
        if(a.Status == 'Failed') {
            
            
            // 1. Send Email (CSV created in execute method)
            
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            // Send the email to the job submitter
            String[] toAddresses = new String[] {a.CreatedBy.Email};
                mail.setToAddresses(toAddresses);
            mail.setSenderDisplayName('Batch Processing');
            mail.setSubject('x70RecordExtract  Status: ' + a.Status);
            mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems +
                                  ' batches with '+ a.NumberOfErrors + ' failures. ExtendedStatus: ' + a.ExtendedStatus);
            
            // Add your attachment to the email.
            
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
            
            // 2. database.executebatch(new chain_batch(),200);
            
        }
    }
    global void finish(database.BatchableContext bc){
    }
*/
}