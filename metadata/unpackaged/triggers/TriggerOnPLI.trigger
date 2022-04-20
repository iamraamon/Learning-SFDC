trigger TriggerOnPLI on Product_Line_Item__c (before insert) {
    system.debug('==================================start==TriggerOnPLI=============================');
    
    if(Trigger.isBefore){
        
        
      /*  for(Product_Line_Item__c  pli : Trigger.new){
            pli.contact__c=pli.File_Upload_Id__c;
        }
        */
    }
    
        system.debug('==================================start==TriggerOnPLI=============================');
}