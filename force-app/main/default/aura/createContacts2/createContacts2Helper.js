({
    showModel_Helper : function (c, e, h) {
        c.set('v.showBox', true);
    },
    
    hideModel_Helper : function (c, e, h) {
        c.set('v.showBox', false);
    },
    
    search_Helper : function (c, e, h) {
        const action = c.get("c.returnAccounts");
            action.setParams({ 
                contactRecord : contactRecord 
            });
            action.setCallback(this, function(response) {
                const state = response.getState();
                if (state === "SUCCESS") {
                    if (response.getReturnValue()) {
                        var l1= [];
                        for(var i=0;i<response.getReturnValue().length;i++){
                            l1.push(response.getReturnValue()[i]);
                        }
                        c.set('v.iteratorList',l1);
                    } else {
                        h.showToast(c, 'error', 'Unable to save!');
                    }
                } else if (state === "ERROR") {
                    console.log("Unknown error", response.getError());
                }
            });
            $A.enqueueAction(action);
    },

    save_Helper : function (c, e, h) {
        const contactRecord = c.get('v.contactRecord');
        if (!$A.util.isUndefinedOrNull(contactRecord) && !$A.util.isUndefinedOrNull(contactRecord.LastName)) {
            contactRecord.AccountId = c.get('v.recordId');
            
            const action = c.get("c.createContact");
            action.setParams({ 
                contactRecord : contactRecord 
            });
            action.setCallback(this, function(response) {
                const state = response.getState();
                if (state === "SUCCESS") {
                    if (response.getReturnValue()) {
                        h.showToast(c, 'success', 'Saved!');
                        c.set('v.showBox', false);
                    } else {
                        h.showToast(c, 'error', 'Unable to save!');
                    }
                } else if (state === "ERROR") {
                    console.log("Unknown error", response.getError());
                }
            });
            $A.enqueueAction(action);
            
        } else {
            h.showToast(c, 'error', 'Required field missing.'); 
        }
        console.log(JSON.stringify());
    },
    
    showToast : function(c, variant, message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "message": message,
            "type": variant
        });
        toastEvent.fire();
    }
})