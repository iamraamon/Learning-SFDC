({
	myAction : function(component, event, helper) {
		
	},
     doAllCountriesInit :function(component, event, helper) {
		//alert(" Iam in doAllCountriesInit") ;
        
        var action = component.get("c.retrieveAllCountries");
        
        action.setParams({ }) ;
        
        action.setCallback(this,function(response){
            if(response!=null){
                var results = response.getReturnValue();
                
                console.log(results) ;
                
                //alert(results);
                
                
                component.set("v.allCountries",results);
                
             
                
                
            }
            
        }) ;
        
        $A.enqueueAction(action);
	}   ,
    
     doretrieveCountryInfoByCode:function(component, event, helper) {
		
        var codeFromCmp = event.getSource().get("v.value");
         alert("codeFromCmp  :  "+codeFromCmp);
        var code ="";
        var action = component.get("c.retrieveCountryInfoByCode");
        
        action.setParams({"countryCode": codeFromCmp }) ;
        
        action.setCallback(this,function(response){
            if(response!=null){
                var results = response.getReturnValue();
                
                console.log(results) ;
                
               // alert(results);
                
                
                component.set("v.displayCountriesByCode",results);
                
                
                  component.set("v.isModalOpen", true);
                
            }
            
        }) ;
        
        $A.enqueueAction(action);
	} ,
    
    closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   }
})