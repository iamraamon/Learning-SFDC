({
	myAction : function(component, event, helper) {
		
	} ,
    
    doStudentInit: function(component, event, helper) {
		 // How to call Apex Controller method =====
        // 
       
        var action = component.get("c.retrieveAllStudentRecords") ;
        
         action.setParams({
                         });
        
        action.setCallback(this,function(response){
            if(response != null){
                var result = response.getReturnValue();
                console.log('results: '+JSON.stringify(result));
                
                     component.set("v.all_student_records",result);           
                
            }
        });
        
        
        //LDS to enqueue - Lightning Data Service
        
        $A.enqueueAction(action);
	} ,
    
    
    handleSaveClick :  function(component, event, helper) {
		alert("Iam in alert Just now I clicked save button") ;
    console.log(" Iam in console jist now clicked save button");
        
        alert(" Student Name : " +component.get("v.student_name") );
        
        // get the values from the component/page/view
        var sN = component.get("v.student_name");
      //   var sId = component.get("v.student_id");
         var sAddress = component.get("v.address");
         var sContactPhone = component.get("v.contact_phone");
         var sEmail = component.get("v.email");
         var sCity = component.get("v.city");
        
        alert(" Student sAddress : " +sAddress );
        alert(" Student sContactPhone : " +sContactPhone );
        alert(" Student sEmail : " +sEmail );
        alert(" Student sCity : " +sCity );
        
        // How to call Apex Controller method =====
        // 
       
        var action = component.get("c.createStudent") ;
        
        action.setParams({name:sN ,
                          address: sAddress,
                          contactPhone:sContactPhone,
                          email:sEmail,
                          city:sCity
                          
                         });
        
        action.setCallback(this,function(response){
            if(response != null){
                var result = response.getReturnValue();
                console.log('results: '+JSON.stringify(result));
                
                alert("Created Student Succesfully : "+result.Name);
                
                
            }
        });
        
        
        //LDS to enqueue - Lightning Data Service
        
        $A.enqueueAction(action);
	}
    
})