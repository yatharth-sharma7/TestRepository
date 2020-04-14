({
	search : function(c, e, h) {
		h.search_Helper (c, e, h);
	},
    
    select : function(c, e, h) {
		h.select_Helper (c, e, h);
	},
   
    //\
    closeSearech : function(c, e, h){
        c.set('!v.isSelected',false);
    }
})