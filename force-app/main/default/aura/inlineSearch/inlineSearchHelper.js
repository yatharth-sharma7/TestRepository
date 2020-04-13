({
    handleClick_Helper : function (c, e, h){
        try{
            
            var name = e.getSource().get('v.value');
            console.log(name);
            var action=c.get("c.returnList");
            action.setParams({
                accName : name,
                sobjectApi : c.get('v.sobjectApi')
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log(state);
                if (state === "SUCCESS") {
                    c.set('v.searchList', response.getReturnValue());
                    console.log(response.getReturnValue());
                }
                else if (state === "ERROR") {
                var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                        }
                    } 
                    else {
                        console.log("Unknown error");
                    }
                }
            });$A.enqueueAction(action);
        }
        catch(ex) {
            console.log(ex);
        }
    }
})