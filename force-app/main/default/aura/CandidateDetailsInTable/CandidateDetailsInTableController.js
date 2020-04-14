({
    init: function (c, e, h) {
        c.set('v.columns', [
            {label: 'Candidate Name', fieldName: 'Name', type: 'text' ,editable: true},
            {label: 'Father Name', fieldName: 'Father_s_Name__c', type: 'text' ,editable: true},
            {label: 'Phone', fieldName: 'Phone__c', type: '	Phone' ,editable: true},
            {label: 'Gender', fieldName: 'Gender__c', type: 'List' ,editable: true},
            {label: 'Status', fieldName: 'Status__c', type: 'List' ,editable: true},
            {label:'Action',type:'button',typeAttributes:
            {iconName: 'utility:preview', label:'View', name:'View', disabled:false, value:'view'}},
            {type: "button", typeAttributes: {
                iconName: 'utility:delete',
                label: 'Delete',
                name: 'Delete',
                disabled: false,
                value: 'delete',
            }},
            {type: "button", typeAttributes: {
                iconName: 'utility:edit',
                label: 'Edit',
                name: 'Edit',
                disabled: false,
                value: 'edit',
            }}
     
        ]);
        h.fetchData_Helper(c,e,h);
    },
    handleSaveEdition: function (c, e, h) {
        h.handleSaveEdition_Helper(c,e,h);
    },
    isRefreshed: function(c, e, h) {
        location.reload();
    },
    handleRowAction: function(c, e, h){
        h.handleRowAction_Helper (c, e, h);
    },
    hideModel: function(c, e, h){
        h.hideModel_Helper (c, e, h);
    },
    hideBoxEdit: function(c, e, h){
        $A.get('e.force:refreshView').fire();
        c.set('v.showBoxEdit', false);
    },
    handleSubmit: function (c, e, h) {
        
		e.preventDefault();
        var fields = e.getParam("fields");
    
            c.find('editRecordForm').submit(fields); 
            $A.get('e.force:refreshView').fire();
		    console.log(fields);
       
      
        console.log('log handleSubmit');
    },
    
})