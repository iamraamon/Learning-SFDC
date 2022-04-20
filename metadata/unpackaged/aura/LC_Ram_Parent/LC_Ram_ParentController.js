({
	myAction : function(component, event, helper) {
		
	},
    
    callAuraParentMethod : function(component, event, helper) {
        alert('Iam in parent js controller');
        
      var con=  confirm('Do you want to call child component method');
        
        if(con == true){
        var childCmp = component.find("child");
        // call the aura:method in the child component
        var auraMethodResult = 
          childCmp.logParam("message sent by parent component");
        console.log("auraMethodResult: " + auraMethodResult);
        }
    },
})