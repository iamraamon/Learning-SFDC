({
	myAction : function(component, event, helper) {
		
	}  ,
    
    
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
                
                  component.set("v.ramAllCountries","ram");
                
                
            }
            
        }) ;
        
        $A.enqueueAction(action);
	}   ,
    
    doretrieveCountryInfoByAlphaCode:function(component, event, helper) {
		//alert(" Iam in doretrieveCountryInfoByAlphaCode") ;
		//
		 component.set("v.isModalOpen", true);
        
        var alphaCodeFromCmp = event.getSource().get("v.value");
        alert("alphaCodeFromCmp"+alphaCodeFromCmp);
        var code ="";
        var action = component.get("c.retrieveCountryInfoByCode");
        
        action.setParams({"countryCode": alphaCodeFromCmp }) ;
        
        action.setCallback(this,function(response){
            if(response!=null){
                var results = response.getReturnValue();
                
                console.log(results) ;
                
                //alert(results);
                
                
                component.set("v.displayCountryByCode",results);
                
                
                
            }
            
        }) ;
        
        $A.enqueueAction(action);
	} ,
    
    closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   }
})