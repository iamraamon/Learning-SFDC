({
  doInit: function(component, event, helper) {
    // fetches PickList Values of Type Field
       // helper.fetchTypePicklist(component, event, helper); 
      
       var fetchTypePicklist = component.get('c.fetchTypePicklist');
        $A.enqueueAction(fetchTypePicklist);
      
        helper.fetchStagePicklist(component); // fetches PickList Values of Stage Field
        helper.fetchLeadSourcePicklist(component); // fetches PickList Values of LeadSource Field
    },
        
        
        fetchTypePicklist : function(component,event,helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.Type"),
            'nullRequired': true // includes --None--
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.TypePicklist", a.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
    }
})