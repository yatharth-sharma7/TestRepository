({
	showModel : function (c, e, h) {
		h.showModel_Helper (c, e, h);
	},
    
    hideModel : function (c, e, h) {
        h.hideModel_Helper (c, e, h);
    },
    
    save : function (c, e, h) {
        console.log("inside save function");
        h.save_Helper (c, e, h);
    },
    
    hideModelQual : function (c, e, h) {
        h.hideModelQual_Helper (c, e, h);
    },

    newQual : function (c, e, h) {
        console.log("inside save new qual again function");
        c.set('v.newQual', true);
        h.saveQual_Helper (c, e, h);
    },
    saveQual : function (c, e, h) {
        console.log("inside save qual function");
        h.saveQual_Helper (c, e, h);
    },
    saveQualAndEnd : function (c, e, h) {
        console.log("inside save new qual again function");
        c.set('v.checkExp', true);
        h.saveQual_Helper (c, e, h);
    },
    
    hideModelExp : function (c, e, h) {
        h.hideModelExp_Helper (c, e, h);
    },

    saveExp : function (c, e, h) {
        console.log("inside save exp function");
        h.saveExp_Helper (c, e, h);
    },
    newExp : function (c, e, h) {
        console.log("inside save  again exp function");
        c.set('v.newExp', true);
        h.saveExp_Helper (c, e, h);
    },
    
    
})