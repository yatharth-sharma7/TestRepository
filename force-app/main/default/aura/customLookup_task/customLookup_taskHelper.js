({
	search_Helper : function(c, e, h) {
		try{
			const searchKey = e.getSource().get('v.value');
			if(!$A.util.isUndefinedOrNull(searchKey)&& !$A.util.isEmpty(searchKey)&& !$A.util.isUndefinedOrNull(c.get('v.sobjectApi'))){
				const action = c.get("c.findRecords_Apex");
				action.setParams({
					searchKey : searchKey,
					sobjectApi : c.get('v.sobjectApi')
				});
				action.setCallback(this, function(response){
					const state = response.getState();
					if(state === "SUCCESS"){
						c.set('v.searchList', response.getReturnValue());
					}
					else if(state === "ERROR"){
						c.set('v.searchList',[]);
						console.log("Unknown Error",response.getError());
					}
				});
				$A.enqueueAction(action);
			}
			else{
				c.set('v.searchList',[]);
			}
		}
		catch(ex){
			console.log(ex);
		}
	},
	select_Helper : function (c, e, h) {
        c.set('v.selectedId', e.currentTarget.dataset.id);
        c.set('v.selectedName', e.currentTarget.dataset.name);
        c.set('v.searchList', []);
        c.set('v.searchKey', '');
        c.set('v.isSelected', true);
    },

    closeSearech_helper : function (c, e, h){
        c.set('!v.isSelected',false);
    }
})