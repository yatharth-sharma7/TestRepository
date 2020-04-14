({
    showModel_Helper : function (c, e, h) {
        c.set('v.showBox', true);
    },
    
    hideModel_Helper : function (c, e, h) {
        c.set('v.showBox', false);
    },

    hideModelQual_Helper : function (c, e, h) {
        c.set('v.showBoxQual', false);
    },

    hideModelExp_Helper : function (c, e, h) {
        c.set('v.showBoxExp', false);
    },

    save_Helper : function (c, e, h) {
        console.log("inside save_helper")
        const candidateRecord = c.get('v.candidateRecord');
        console.log(candidateRecord);
        if (!$A.util.isUndefinedOrNull(candidateRecord)) {
            
            const action = c.get("c.createCandidate");
            action.setParams({ 
                candidateRecord : candidateRecord 
            });
            action.setCallback(this, function(response) {
                const state = response.getState();
                console.log(state);
                console.log(response.getReturnValue());
                if (state === "SUCCESS") {
                
                    if (response.getReturnValue()) {
                        
                        c.set('v.CandidateID',response.getReturnValue().Id);
                        c.set('v.showBox', false);
                        c.set('v.showBoxQual', true);
                        console.log(c.get('v.CandidateID'))
                    }
                    else{
                        console.log('Toast There is some Error.');
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "title": "Error!",
                            "message": "There is some Error."
                        });
                        toastEvent.fire();
                    }
                } else if (state === "ERROR") {
                    console.log("Unknown error", response.getError());
                }
            });
            $A.enqueueAction(action);
            
        }
    },

    saveQual_Helper : function (c, e, h) {
        console.log("inside save_helper")
        const qualificationRecord = c.get('v.qualificationRecord');
        console.log(qualificationRecord);
        if (!$A.util.isUndefinedOrNull(qualificationRecord)) {
            qualificationRecord.CandidateID__c=c.get('v.CandidateID');

            const action = c.get("c.createQualification");
            action.setParams({ 
                qualificationRecord : qualificationRecord
            });
            action.setCallback(this, function(response) {
                const state = response.getState();
                console.log(state);
                console.log(response.getReturnValue());
                if (state === "SUCCESS") {
                    if (response.getReturnValue()) {
                        if(c.get('v.checkExp') == true){
                            c.set('v.showBoxQual', false);
                
                            $A.get('e.force:refreshView').fire();}
                        else
                        {
                            if(c.get('v.newQual') == true){
                                console.log('lets create new');
                                c.set('v.qualificationRecord',{})
                                c.set('v.newQual', false);
                            }
                            else{
                                c.set('v.showBoxQual', false);
                                c.set('v.showBoxExp', true);
                            }
                        } 
                    }
                } else if (state === "ERROR") {
                    console.log("Unknown error", response.getError());
                }
            });
            $A.enqueueAction(action);

        }
    },

    saveExp_Helper : function (c, e, h) {
        console.log("inside save_helper")
        const experienceRecord = c.get('v.experienceRecord');
        console.log(experienceRecord);
        if (!$A.util.isUndefinedOrNull(experienceRecord)) {
            experienceRecord.CandidateID__c=c.get('v.CandidateID');
            
            const action = c.get("c.createExperience");
            action.setParams({ 
                experienceRecord : experienceRecord 
            });
            action.setCallback(this, function(response) {
                const state = response.getState();
                console.log(state);
                console.log(response.getReturnValue());
                if (state === "SUCCESS") {
                    if (response.getReturnValue()) {
                        if(c.get('v.newExp')== true){
                            console.log('lets create new');
                            c.set('v.experienceRecord',{})
                            c.set('v.newExp', false);
                        }
                        else{
                            c.set('v.showBoxExp', false);
                            //call DOinit here
                            $A.get('e.force:refreshView').fire();
                        }
                        
                    }
                } else if (state === "ERROR") {
                    console.log("Unknown error", response.getError());
                }
            });
            $A.enqueueAction(action);
        }
    }
})