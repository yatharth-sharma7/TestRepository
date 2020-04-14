({
    init : function (c, e, h) {
        console.log('controller init');
        h.init_Helper(c, e, h);
    },
    showSelectedBox : function (c, e, h) {
        c.set('v.showSelectedBox', true);
    },
    hideSelectedBox : function (c, e, h) {
        c.set('v.showSelectedBox', false);
    },
    showNewBox : function (c, e, h) {
        c.set('v.showNewBox', true);
    },

    hideNewBox : function (c, e, h) {
        c.set('v.showNewBox', false);
    }

})