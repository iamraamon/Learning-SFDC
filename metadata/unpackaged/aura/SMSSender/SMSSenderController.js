({
	onClickSend : function(component, event, helper) {
        
        alert("Iam onClick");
        
       var recId = component.get("v.recordId");
         var emailField = component.get("v.objectDesignFieldEmail");
         var phoneField = component.get("v.objectDesignFieldPhone");
         var objectVar = component.get("v.objectDesignObject");
         var recordVar = component.get("v.record");
        
          console.log(" recId --"+recid);
             console.log(" emailField --"+emailField);
             console.log(" phoneField --"+phoneField);
             console.log(" object --"+objectVar);
             console.log(" record --"+recordVar);
        
        alert(" recId --"+recid+" emailField --"+emailField+
             " phoneField --"+phoneField+" object --"+objectVar+" record --"+recordVar);
        
		
	}
})