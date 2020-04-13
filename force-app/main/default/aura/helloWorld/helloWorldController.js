({
	updateMessage : function(c, e, h) {
        console.log('message:: ', c.get('v.message'));
        c.set('v.message', 'Update Message!');
	},
    
    changeHandler : function (c, e, h) {
        h.changeHandler_Helper (c, e, h);
    }
})