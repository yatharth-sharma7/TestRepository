public with sharing class AccOrConSchema {

        @AuraEnabled
        public static List<wrapper> getFieldsAccordingly(string sObj){
            system.debug(sObj);
            List<wrapper> wrapList = new List<wrapper>();
            List<String> str = new List<String>();
            str.add(sObj);
            Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
            
            Schema.DescribeSObjectResult[] descResult = Schema.describeSObjects(str);
            system.debug(descResult[0].fields.getMap());

            Map<String,Schema.SObjectField> fields = new Map<string,Schema.SObjectField>(descResult[0].fields.getMap());
            system.debug(fields);

            for(String str1: fields.keySet()){
                
                    Schema.SObjectField field = fields .get(str1);
                    Schema.DescribeFieldResult check = field.getDescribe();
                    
                    if(check.isCreateable() && check.isUpdateable() && check.isAccessible() ){
                        wrapper wrapObj = new wrapper();
                        wrapObj.nameLabel = fields.get(str1).getDescribe().getLabel();  

                        if(String.valueOf(fields.get(str1).getDescribe().getType()) == 'BOOLEAN'){
                            wrapObj.isMultiPickList = false;
                            wrapObj.isPickList = false;
                            wrapObj.typeData = 'checkbox';
                        }
                        else if(String.valueOf(fields.get(str1).getDescribe().getType()) == 'STRING'){
                            wrapObj.isPickList = false;
                            wrapObj.isMultiPickList = false;
                            wrapObj.typeData = 'text';
                        }
                        else if(String.valueOf(fields.get(str1).getDescribe().getType()) == 'DOUBLE'){
                            wrapObj.typeData = 'number';
                        }
                        else if(String.valueOf(fields.get(str1).getDescribe().getType()) == 'CURRENCY'){
                            wrapObj.isPickList = false;
                            wrapObj.isMultiPickList = false;
                            wrapObj.typeData = 'number';
                        }
                        else if(String.valueOf(fields.get(str1).getDescribe().getType()) == 'PICKLIST'){
                            wrapObj.isPickList = true;
                            wrapObj.isMultiPickList = false;
                            wrapObj.typeData = 'text';
                            wrapObj.pickListValue = getPicklistvalues_Apex(str[0],String.valueOf(fields.get(str1).getDescribe().getName()));
                        }



                        else if(String.valueOf(fields.get(str1).getDescribe().getType()) == 'MULTIPICKLIST'){
                            wrapObj.isPickList = false;
                            wrapObj.isMultiPickList = true;
                            wrapObj.typeData = 'text';
                            wrapObj.multiPickListValue = getMultiPicklistvalues_Apex(str[0],String.valueOf(fields.get(str1).getDescribe().getName()));
                        }
                        else if(String.valueOf(fields.get(str1).getDescribe().getType()) == 'REFERENCE'){
                            wrapObj.isPickList = false;
                            wrapObj.isMultiPickList = false;
                            wrapObj.typeData = 'text';
                        }
                        else if(String.valueOf(fields.get(str1).getDescribe().getType()) == 'URL'){
                            wrapObj.isPickList = false;
                            wrapObj.isMultiPickList = false;
                            wrapObj.typeData = 'url';
                        }
                        else if(String.valueOf(fields.get(str1).getDescribe().getType()) == 'PHONE'){
                            wrapObj.isPickList = false;
                            wrapObj.isMultiPickList = false;
                            wrapObj.typeData = 'number';
                        }
                        else {
                            wrapObj.isPickList = false;
                            wrapObj.isMultiPickList = false;
                            wrapObj.typeData = String.valueOf(fields.get(str1).getDescribe().getType());
                        }
                        wrapList.add(wrapObj);           
                    }
                }
               
                return wrapList;
    
        }
        private static List<String> getPicklistvalues_Apex(String objectName, String fieldName){
        
            List<String> pickListValuesList= new List<String>();
            Schema.SObjectType s = Schema.getGlobalDescribe().get(objectName);
            Schema.DescribeSObjectResult r = s.getDescribe();
            Map<String,Schema.SObjectField> fields = r.fields.getMap();

            Schema.DescribeFieldResult fieldResult = fields.get(fieldName).getDescribe();

            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            for( Schema.PicklistEntry pickListVal : ple){
                pickListValuesList.add(pickListVal.getLabel());
            }    
            

            return pickListValuesList;
        }




        private static List<String> getMultiPicklistvalues_Apex(String objectName, String fieldName){

            List<String> multiPickListValuesList= new List<String>();

            Schema.SObjectType s = Schema.getGlobalDescribe().get(objectName);
            Schema.DescribeSObjectResult r = s.getDescribe();

            Map<String,Schema.SObjectField> fields = r.fields.getMap();

            Schema.DescribeFieldResult fieldResult = fields.get(fieldName).getDescribe();

            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            for( Schema.PicklistEntry pickListVal : ple){
                multiPickListValuesList.add(pickListVal.getLabel());
            }    

            return multiPickListValuesList;
        }


        
        public class wrapper{

            @AuraEnabled public String nameLabel {get;set;}
            @AuraEnabled public String typeData {get;set;}
            @AuraEnabled public Boolean isPickList {get;set;}
            @AuraEnabled public List<String> pickListValue {get;set;}
            @AuraEnabled public Boolean isMultiPickList {get;set;}
            @AuraEnabled public List<String> multiPickListValue {get;set;}
        }
    }