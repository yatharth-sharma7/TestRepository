({
    lightning_Helper : function(c, e, h) {
		c.set('v.message',e.getSource().get('v.value'));
    },
    alert_Helper : function(c, e, h){
        var show = e.getSource().get('v.value');
        
        alert();
    },
    findAccount_Helper : function(c, e, h){
      
        const action = c.get("c.accountSearch");
        var accName = c.get("v.accName");
        
        action.setParams({
            accountName : accName
        });
       
    }
})