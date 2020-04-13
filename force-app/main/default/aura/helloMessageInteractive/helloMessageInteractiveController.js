({
	handleClick : function(c, e, h) {
		var btnClicked = e.getSource();
        var btnMessage = btnClicked.get("v.label");
        c.set("v.message",btnMessage);
	}
})