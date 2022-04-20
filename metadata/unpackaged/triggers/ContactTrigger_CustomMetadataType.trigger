trigger ContactTrigger_CustomMetadataType on Contact (before insert) {
    system.debug('========= Start is ContactTrigger_CustomMetadataType========');
    // I will make use of custom metadats settings
    // 
    Trigger_Configuration__mdt triggerConfiguration = [
        SELECT
        isBefore__c
        FROM
        Trigger_Configuration__mdt
        WHERE
        Trigger_API_Name__c = 'ContactTrigger'
        LIMIT 1
    ];
    
    if(triggerConfiguration.isBefore__c) {
        if(Trigger.isBefore){
            
            
        }
        
    }
    
    if(Trigger.isBefore &&  triggerConfiguration.isBefore__c){
        system.debug('========= Start is Before========');
        
        
        
        
        system.debug('========= End is Before========');
    }
   
    
    system.debug('========= End is ContactTrigger_CustomMetadataType========');
}