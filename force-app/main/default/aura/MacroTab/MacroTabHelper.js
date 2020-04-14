({
	helpgerMethod : function(c,e,h) {
		console.log("Helper");
		var workspaceAPI = c.find("workspace");
        workspaceAPI.openTab({
            url: '/lightning/r/Macro/0JZ2w000000ZtmaGAC/view',
            focus: true
        }).then(function(response) {
            workspaceAPI.getTabInfo({
                tabId: response
            }).then(function(tabInfo) {
            console.log("The recordId for this tab is: " + tabInfo.recordId);
            });
        }).catch(function(error) {
                console.log(error);
        });
	}
})