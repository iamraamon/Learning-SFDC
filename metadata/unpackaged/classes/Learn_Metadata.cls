public class Learn_Metadata {
    
    public static void getTriggerMetadataInfo(){
        
        
        //getAll() Example :
        Map<String, Trigger_Configuration__mdt> mapTrigCodes = Trigger_Configuration__mdt.getAll();
        for(String name: mapTrigCodes.keySet()){
            System.debug(name+' --> '+mapTrigCodes.get(name).isBefore__c+'--->'+mapTrigCodes.get(name).Trigger_API_Name__c);
        }
        //Australia --> AUS
        //India --> IND
        
        
        // direct soql
        // 
        system.debug('-----------------------------------');
        List<         Trigger_Configuration__mdt > triggerConfigurationLst = [
            SELECT
            isBefore__c,Trigger_API_Name__c
            FROM
            Trigger_Configuration__mdt
            
        ];
        
        for(Trigger_Configuration__mdt tcl : triggerConfigurationLst){
            System.debug(+tcl.isBefore__c+'--->'+tcl.Trigger_API_Name__c);
        }
    }
    
}