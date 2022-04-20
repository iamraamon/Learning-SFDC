({
	myAction : function(component, event, helper) {
		
	},
    logParam : function(cmp, event) {
        alert('Iam in child js controller');
        var params = event.getParam('arguments');
        if (params) {
            var message = params.message;
            alert("message : "+message);
            console.log("message: " + message);
            return message;
        }
    },
})