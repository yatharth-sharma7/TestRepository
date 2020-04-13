({
   selectRecord : function(c, e, h){      
    // get the selected record from list  
      var getSelectRecord = c.get("v.oRecord");
    // call the event   
      var compEvent = c.getEvent("oSelectedRecordEvent");
    // set the Selected sObject Record to the event attribute.  
         compEvent.setParams({"recordByEvent" : getSelectRecord });  
    // fire the event  
         compEvent.fire();
    },
})