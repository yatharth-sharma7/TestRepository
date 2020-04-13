({

    init_Helper: function (c, e, h) {
        console.log('Helper init');
        try{
            var action = c.get("c.totalData");
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log(state);
                if (state === "SUCCESS") {
                    c.set('v.totaCandidates',response.getReturnValue());
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


        try{
            console.log('Helper init');

            var action = c.get("c.selectedData");
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log(state);
                if (state === "SUCCESS") {
                    c.set('v.totaSelectedCandidates',response.getReturnValue());
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

        try{
            var action = c.get("c.newData");
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log(state);
                if (state === "SUCCESS") {
                    c.set('v.totaNewCandidates',response.getReturnValue());
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