({
    fetchData_Helper: function (c, e, h) {
        try{
            var action = c.get("c.CandidateList");
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log(state);
                if (state === "SUCCESS") {
                    c.set('v.data',response.getReturnValue());
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
    },
    
    handleSaveEdition_Helper: function (c, e, h) {
        var draftValues = e.getParam('draftValues');
        console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'+draftValues);
        var action = c.get("c.updateCandidate");
        action.setParams({ candidate : draftValues});
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log(state);
            $A.get('e.force:refreshView').fire();
            }
            else if (state === "INCOMPLETE") {
                console.log(state);
            }
            else if (state === "ERROR"){
                console.log(state);
            }
        });
        $A.enqueueAction(action);
        
    },

    handleRowAction_Helper: function (c, e, h) {
        console.log("handleRowAction_Helper");
 
        var row = e.getParam('row');

        console.log(JSON.stringify(row));
        var Rid=row.Id;
        console.log(Rid);
        c.set('v.viewID',Rid);
        console.log(c.get('v.viewID'));

        var action1 = e.getParam('action').name;
        console.log(action1);
        
        if(action1=='View'){   
            console.log("starting of apex calling");
            var action =  c.get("c.InitMethodWrap");
            console.log(Rid);
            action.setParams({
                RowID : Rid
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log(state);
                if (state === "SUCCESS") {
                    console.log(response.getReturnValue());
                    c.set('v.WrapperList', response.getReturnValue());
                    console.log('this is the variable');
                    console.log(c.get('v.WrapperList'));
                    console.log(state);
                }
                else if (state === "INCOMPLETE") {
                    console.log(state);
                }
                else if (state === "ERROR"){
                    console.log(state);
                }
            });
            $A.enqueueAction(action);
            console.log("end of apex calling");

            console.log("Show box");
            c.set('v.showBox',true);
        }

        if(action1=='Delete'){
            console.log("starting of apex calling");
            var action =  c.get("c.deleteAcnd");
            console.log(Rid);
            action.setParams({
                RowID : Rid
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log(state);
                if (state === "SUCCESS") {
                    console.log(response.getReturnValue());
                    
                    console.log(state);
                    $A.get('e.force:refreshView').fire();
                }
                else if (state === "INCOMPLETE") {
                    console.log(state);
                }
                else if (state === "ERROR"){
                    console.log(state);
                }
            });
            $A.enqueueAction(action);
            console.log("end of apex calling");
        }
        if(action1=='Edit'){
           c.set('v.showBoxEdit', true);}
    },

    hideModel_Helper : function (c, e, h) {

        c.set('v.WrapperList',[]);
        c.set('v.showBox',false);
    }
})