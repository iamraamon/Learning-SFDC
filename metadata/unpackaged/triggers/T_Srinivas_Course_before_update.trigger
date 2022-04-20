trigger T_Srinivas_Course_before_update on Course__c (before update) {
    
            List<Course__c> newList= Trigger.New;
    
    for( Course__c   cObj   : newList)    {
        
        cObj.Name='Update_Ram_'+cObj.Name;
         cObj.Duration__c=180;
    } 
    
  /*  
           List<Course__c> oldList= Trigger.old;
    
    for( Course__c   cObj   : oldList)    {
        
      //  cObj.Name='Update_Ram_'+cObj.Name;
        cObj.Duration__c=180;
    }

*/
}