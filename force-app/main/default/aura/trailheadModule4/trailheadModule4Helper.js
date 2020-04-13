({
	handleClick: function(component, event, helper) {
            var btnClicked = event.getSource(); 
    var btnMessage = btnClicked.get("v.label"); // the button's label
        // the button
         component.set("v.message", btnMessage);     // update our message


	}
})