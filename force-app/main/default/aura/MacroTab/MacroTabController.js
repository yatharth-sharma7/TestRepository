({
openTabMacors : function(c,e,h) {
    console.log("controller");
    var workspaceAPI = c.find("workspace");
        workspaceAPI.openTab({
            url: '/lightning/r/Macro/0JZ2w000000ZtmaGAC/view'
        }).then(function(response) {
            workspaceAPI.getTabInfo({
                tabId: response
            }).then(function(tabInfo) {
            console.log("The recordId for this tab is: " + tabInfo.recordId);
            });
        }).catch(function(error) {
                console.log(error);
        });
        
    },
    
    openFirstUtility : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.getAllUtilityInfo().then(function(response) {
            var myUtilityInfo = response[0];
            console.log(myUtilityInfo)
            utilityAPI.openUtility({
                utilityId: myUtilityInfo.id
            });
       })
        .catch(function(error) {
            console.log(error);
        });
    }
})