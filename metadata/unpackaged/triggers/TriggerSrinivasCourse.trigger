trigger TriggerSrinivasCourse on Course__c (before insert ,after insert,before update,after update,before delete,after delete) {
     //trigger <TriggerName> on <sObject> (before insert)  
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            system.debug('**********Start Trigger on Course Before Insert***************');
            
            List<Course__c> courseList =trigger.new ;
            Integer triggerSize = courseList.size() ;
            system.debug(' size of records in  TriggerSrinivasCourse  : '+triggerSize);
            for(Integer i=0;i< triggerSize ;i++){
                //  Student__c s =   new Student__c();
                Course__c a = courseList[i];
                
                a.Name  =a.Name+ '_Kasmo' ;
                // insert a;
                // 
                system.debug('**********End Trigger on Course Before Insert***************');
            }
        } 
        else if(Trigger.isAfter){
            
            system.debug('**********Start Trigger on Course After Insert***************');
            List<Course__c> courseList =Trigger.new ;
            Integer triggerSize = courseList.size() ;
            system.debug(' size of records in  TriggerSrinivasCourse  : '+triggerSize);
            for(Integer i=0;i< triggerSize ;i++){
                Student__c s =   new Student__c();            
                s.Name=' Ravi created from after Course Trigger';
                s.Address__c='ATP';
                insert s;
            }        
            
            system.debug('**********End Trigger on Course After Insert***************');
            
        }        
    }    
   else  if(Trigger.isUpdate){
        system.debug('**********Start Trigger on Course id Update***************');
          if(Trigger.isBefore){
               system.debug('******Start****IS BEFORE***************');
             List<Course__c>  courseOldList= Trigger.old; 
               List<Course__c>  courseNewList= Trigger.new;
              
              for(Integer i=0; i<courseOldList.size();i++){
                  
                  Course__c oldC = courseOldList[i];
                  Course__c newC = courseNewList[i];
                  
                  if ( oldC.Duration__c == newC.Duration__c){
                      
                       system.debug(oldC.Duration__c+': old Duration **************  new Duration :'+newC.Duration__c);
                      //throw error
                      //a
                      oldC.Duration__c.addError(' not able to update Name field since new Duration and old duration is same');
                  }else{
                     // newC.Name =
                  }
                  
                  
              }
             system.debug('******End****IS BEFORE***************');  
          }
         else if(Trigger.isAfter){
              system.debug('******Start****IS AFTER***************');
             
             
             
             
              system.debug('******End****IS AFTER***************');
         }    
      }
  else  if(Trigger.isDelete){
          if(Trigger.isBefore){
              
          }
         else if(Trigger.isAfter){
             
         }
       }
   else  if(Trigger.isUndelete){
          if(Trigger.isBefore){
              
          }
         else if(Trigger.isAfter){
             
         }
    }
    
    //List<  Course__c>  couseObj = Trigger.new ;
    //List<Course__c> courseList2 =    [select Id,Name from Course__c];
    //Course__c courseObj2 =    [select Id,Name from Course__c where Id =:'a010K000026ZV7BQAW' limit 10 ];
    
}