({
openTab: function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            url: '/lightning/r/Account/0012w000004EqshAAC/view',
        }).then(function(response) {
            workspaceAPI.focusTab({tabId : response});
       })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    closeTab: function (component, event, helper) {
    	
		var workspaceAPI = component.find("workspace");
         	workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.closeTab({tabId: focusedTabId});
        	})
	},
    
    generateConsoleUrl : function(component, event, helper) {
        var workspaceAPI = cmp.find("workspaceAPI");
        workspaceAPI.generateConsoleURL({
            "pageReferences": [
                {
                    "type": "standard__recordPage",
                    "attributes": {
                        "objectApiName": "Account",
                        "actionName": "view",
                        "recordId": "0012w000004EqshAAC"
                    },
                    "state": {}
                }
          
            ]
        }).then(function(url) {
            console.log(url);
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    getEnclosingTabId : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getEnclosingTabId().then(function(tabId) {
            console.log(tabId);
       })
        .catch(function(error) {
            console.log(error);
        });
    },
    closeFocusedTab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.closeTab({tabId: focusedTabId});
       })
        .catch(function(error) {
            console.log(error);
        });
    },
    getAllTabInfo : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getAllTabInfo().then(function(response) {
            console.log(response);
       })
        .catch(function(error) {
            console.log(error);
        });
    },
        isFocusedTabSubtab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            workspaceAPI.isSubtab({
                tabId: response.tabId
            }).then(function(response) {
                if (response) {
                    confirm("This tab is a subtab.");
                }
                else {
                    confirm("This tab is not a subtab.");
                }
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    }
})