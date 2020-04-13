({
    getValueFromApplicationEvent: function (component, event, helper) {
        var recordId = event.getParam('PASS_ID');
        console.log(recordId);
        var objectApi = event.getParam('objectApi');
        console.log(objectApi);
        component.set('v.recordId', recordId);
        component.set('v.objectApi', objectApi);
    },

    showView : function(component, event, helper){                                                                  
        component.set('v.showView', false);
    },

    handleSubmit: function (component, event, helper) {
        
		event.preventDefault(); // Prevent default submit
        var fields = event.getParam("fields");
        if (!$A.util.isUndefinedOrNull(fields)) 
        {
            component.find('editRecordForm').submit(fields); // Submit form
		    console.log(fields);
        }
       // component.set('v.showView', false);   
        console.log('log handleSubmit');
    },
    
    hideModel: function (component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        component.set("v.showView", false);
    },
})