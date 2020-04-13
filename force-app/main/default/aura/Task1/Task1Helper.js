({
   
    showModel_Helper : function (c, e, h) {
        c.set('v.showBox', true);
    },
    
    hideModel_Helper : function (c, e, h) {
        c.set('v.showBox', false);
        c.set('v.createAccBoolean',false);
    },
    showAccounts_helper :function(c,e,h){
        console.log("fired");
        
        const action = c.get("c.accountSearch");
        var accountName = c.get("v.accountName");
        console.log(accountName);
        action.setParams({ 
                accountName : accountName 
            });
        action.setCallback(this, function(response)
         {
         	var state = response.getState();
         	if (state == "SUCCESS") 
         	{
                console.log("success");
                var objectData = [];
                for(var i=0;i<response.getReturnValue().length;i++)
                {
                    objectData.push(response.getReturnValue()[i]);
                }
                console.log(objectData);
               c.set("v.AccountNameList",objectData);
         	}
         	else
         	{
                alert('Account not fetched');
         	}    
         });
        $A.enqueueAction(action);
         
    },
    save_Helper : function (c, e, h) {
        const contactRecord = c.get('v.contactRecord');
        console.log({contactRecord});
        if (!$A.util.isUndefinedOrNull(contactRecord) && !$A.util.isUndefinedOrNull(contactRecord.LastName)) {
            contactRecord.AccountId = c.get('v.recordId');
            
            const action = c.get("c.createContact");
            action.setParams({ 
                contactRecord : contactRecord 
            });
            action.setCallback(this, function(response) {
                const state = response.getState();
                console.log(state);
                console.log(response.getReturnValue());
                if (state == 'SUCCESS') {
                    if (response.getReturnValue()) {
                        h.showToast(c, 'Success', 'Saved!');
                        c.set('v.showBox', false);
                    } else {
                        h.showToast(c, 'error', 'Unable to save!');
                    }
                } else if (state == "ERROR") {
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
            'message': message,
            'type': variant
        });
        toastEvent.fire();
    },
    changeParam_helper : function(c,e,h){
        c.set('v.message', e.getSource().get('v.value'));
    },
    createAccount_helper: function(c,e,h){
        c.set('v.showBox',false);
        c.set('v.createAccBoolean',true);
    },
    selectAccount_helper:function(c,e,h){
        console.log('fired');
        c.set('v.accSelected',e.getSource().get('v.value'));
        console.log('v.accSelected');
        var resultCmp = cmp.find("singleResult");
        resultCmp.set("v.value",e.getSource().get('v.value') );
    },
    saveAcc_helper: function(c,e,h){
        var accObj = c.get('v.accountRecord');
        if (!$A.util.isUndefinedOrNull(accObj) && !$A.util.isUndefinedOrNull(accObj.Name)) {
            const action = c.get("c.createAccounts");
            console.log({accObj});
            action.setParams({ 
                accObj : accObj 
            });
            action.setCallback(this, function(response) {
                const state = response.getState();
                console.log(state);
                console.log(response.getReturnValue());
                if (state == "SUCCESS") {
                    if (response.getReturnValue()) {
                        h.showToast(c, 'Success', 'Saved!');
                        c.set('v.createAccBoolean', false);
                    } else {
                        h.showToast(c, 'error', 'Unable to save!');
                    }
                } else if (state == "ERROR") {
                    console.log("Unknown error", response.getError());
                }
            });
            $A.enqueueAction(action);
            
        } else {
            h.showToast(c, 'error', 'Required field missing.'); 
        }
        }
    
})