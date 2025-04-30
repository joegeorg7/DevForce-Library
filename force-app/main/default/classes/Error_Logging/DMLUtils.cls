
public inherited sharing class DMLUtils {
    
    public static final String METHOD_NAME  = 'doInsertRecordList';
    public static final String CLASS_NAME  = 'DMLUtils';


        public static DMLUtilsWrapper  doInsertRecord(sObject obj, String referenceId, String orderId, String sMethodName, String sClassName) {        
            return doInsertRecordList(new List<sObject>{obj}, new List<String>{referenceId}, new List<String>{orderId}, sMethodName, sClassName, new Database.DMLOptions());
         }

        public static DMLUtilsWrapper  doInsertRecord(sObject obj, String referenceId, String orderId, String sMethodName, String sClassName, Database.DMLOptions dmlOptions) {        
           return doInsertRecordList(new List<sObject>{obj}, new List<String>{referenceId}, new List<String>{orderId}, sMethodName, sClassName, dmlOptions);
        }
    
        public static DMLUtilsWrapper  doInsertRecordList(List<sObject> sObjectList, List<String> referenceIds, List<String> orderIds, String sMethodName, String sClassName) {
            return doInsertRecordList(sObjectList, referenceIds, orderIds, sMethodName, sClassName, new Database.DMLOptions());
        }
        
        public static DMLUtilsWrapper  doInsertRecordList(List<sObject> sObjectList, String sMethodName, String sClassName, Database.DMLOptions options) {
            return doInsertRecordList(sObjectList, null, null, sMethodName, sClassName, new Database.DMLOptions());
        }
    
        public static DMLUtilsWrapper  doInsertRecordList(List<sObject> sObjectList, List<String> referenceIds, List<String> orderIds, String sMethodName, String sClassName, Database.DMLOptions dmlOptions) {
            if(!sObjectList.isEmpty()) {
                List<Database.Error> dbErrorList   = new List<Database.Error>();
                List<Database.SaveResult> dataList = new List<Database.SaveResult>();
                List<String> errorReferenceIds = new List<String>();
                try {
                    //perform DML with the sent DML Options
                    dataList = Database.insert(sObjectList, dmlOptions);
                    
                    //loop through the saveresult to see if there were any failures
                    for (Integer i = 0; i < dataList.size(); i++) {
                        if (referenceIds != null){
                            errorReferenceIds.add(referenceIds[i]);
                        }
                        else {
                            errorReferenceIds.add(null);
                        }
                        if (!dataList[i].isSuccess()) {
                            dbErrorList.addAll(dataList[i].getErrors());
                        }     
                    }
                } 
                catch(Exception err) {
                    //Log Exception
                    ErrorLoggerFramework.insertApplicationErrorLog(sClassName, sMethodName, err, null);
                }
    
                DMLUtilsWrapper  wrapper = new DMLUtilsWrapper (dataList, dbErrorList);
                //if there were failures, log those errors by creating CRM_CP_Error_Log__c record
                if(!dbErrorList.isEmpty()){
                    ErrorLoggerFramework.insertDMLApplicationErrorLogs(wrapper, errorReferenceIds, orderIds, sClassName, sMethodName);
                }
    
                return wrapper;
            }
            //return null if nothing is sent
            return null;
            
        } 

        public static DMLUtilsWrapper  doUpdateRecord(sObject obj, String sMethodName, String sClassName) {        
            return doUpdateRecordList(new List<sObject>{obj}, sMethodName, sClassName, new  Database.DMLOptions());
        } 

        public static DMLUtilsWrapper  doUpdateRecord(sObject obj, String sMethodName, String sClassName, Database.DMLOptions dmlOptions) {        
            return doUpdateRecordList(new List<sObject>{obj}, sMethodName, sClassName, dmlOptions);
        }
    
        public static DMLUtilsWrapper  doUpdateRecordList(List<sObject> sObjectList, String sMethodName, String sClassName) {
            return doUpdateRecordList(sObjectList, sMethodName, sClassName, new  Database.DMLOptions());
         }
        
        public static DMLUtilsWrapper  doUpdateRecordList(List<sObject> sObjectList, String sMethodName, String sClassName, Database.DMLOptions dmlOptions) {
    
            if(!sObjectList.isEmpty()) {
                List<Database.Error> dbErrorList   = new List<Database.Error>();
                List<Database.SaveResult> dataList = new List<Database.SaveResult>();
                List<String> referenceIds = new List<String>();
                String currReferenceId;
                try {
                    //perform DML with the sent DML Options
                    dataList = Database.update(sObjectList, dmlOptions);
                                    
                    //loop through the saveresult to see if there were any failures
                    for (Integer i = 0; i < dataList.size(); i++) {
                        currReferenceId = sObjectList[i].Id;
                        referenceIds.add(sObjectList[i].Id);
                        if (!dataList[i].isSuccess()) {
                            dbErrorList.addAll(dataList[i].getErrors());
                        }     
                    }
                } 
                catch(Exception err) {
                    //Log Exception
                    ErrorLoggerFramework.insertApplicationErrorLog(sClassName, sMethodName, err, currReferenceId);
                }
    
                DMLUtilsWrapper  wrapper = new DMLUtilsWrapper (dataList, dbErrorList);
                
                //if there were failures, log those errors by creating CRM_CP_Error_Log__c record
                if(!dbErrorList.isEmpty()){
                    String objectName;
        			if (referenceIds[0] != null && referenceIds[0] != '' && referenceIds[0] InstanceOf Id){
            			Id referenceIdAsId = (Id) referenceIds[0];
            			objectName = referenceIdAsId.getSobjectType().getDescribe().getName();
                    }
                    List<String> orderIds = new List<String>();
                    if(objectname == CRM_CP_GlobalConstants.OBJECT_ORDER_STRING){
                        for(String referenceId : referenceIds){
                            orderIds.add(referenceId);
                        }
                    }
                    ErrorLoggerFramework.insertDMLApplicationErrorLogs(wrapper, referenceIds, orderIds, sClassName, sMethodName);
                }     
                return wrapper;
            }
            //return null if nothing is sent
            return null;     
        }

        public static DMLUtilsWrapper  doDeleteRecord(sObject obj, String sMethodName, String sClassName) {        
            return doDeleteRecordList(new List<sObject>{obj}, sMethodName, sClassName, false);
        }
    
        public static DMLUtilsWrapper  doDeleteRecord(sObject obj, String sMethodName, String sClassName, Boolean allOrNone) {        
            return doDeleteRecordList(new List<sObject>{obj}, sMethodName, sClassName, allOrNone);
        }
        
        public static DMLUtilsWrapper  doDeleteRecordList(List<sObject> sObjectList, String sMethodName, String sClassName) {
            return doDeleteRecordList(sObjectList, sMethodName, sClassName, false);
        }
    
        public static DMLUtilsWrapper  doDeleteRecordList(List<sObject> sObjectList, String sMethodName, String sClassName, Boolean allOrNone) {
    
            if(!sObjectList.isEmpty()) {
                List<Database.Error> dbErrorList   = new List<Database.Error>();
                List<Database.DeleteResult> dataList = new List<Database.DeleteResult>();
                List<String> referenceIds = new List<String>();
                String currReferenceId;
                try {
                    //perform DML with the sent DML Options
                    dataList = Database.delete(sObjectList, allOrNone);
                    
                    //loop through the DeleteResult to see if there were any failures
                     for (Integer i = 0; i < dataList.size(); i++) {
                        currReferenceId = sObjectList[i].Id;
                        referenceIds.add(sObjectList[i].Id);
                        if (!dataList[i].isSuccess()) {
                            dbErrorList.addAll(dataList[i].getErrors());
                        }     
                    }
                } 
                catch(Exception err) {
                    //Log Exception
                    ErrorLoggerFramework.insertApplicationErrorLog(sClassName, sMethodName, err, currReferenceId);
                }
    
                DMLUtilsWrapper  wrapper = new DMLUtilsWrapper (dataList, dbErrorList);
    
                //if there were failures, log those errors by creating CRM_CP_Error_Log__c record
                if(!dbErrorList.isEmpty()){
                    List<String> orderIds = new List<String>();
                        String objectName;
        			if (referenceIds[0] != null && referenceIds[0] != '' && referenceIds[0] InstanceOf Id){
            			Id referenceIdAsId = (Id) referenceIds[0];
            				objectName = referenceIdAsId.getSobjectType().getDescribe().getName();
                		}
                    for(String referenceId : referenceIds){                        
                        if(objectname == CRM_CP_GlobalConstants.OBJECT_ORDER_STRING){
                            orderIds.add(referenceId);
                        }  
                    }
                    ErrorLoggerFramework.insertDMLApplicationErrorLogs(wrapper, referenceIds, orderIds, sClassName, sMethodName);
                        }     
                return wrapper;
            }
            //return null if nothing is sent
            return null;     
        }
    
        public static DMLUtilsWrapper  doUndeleteRecord(sObject obj, String sMethodName, String sClassName) {        
            return doUndeleteRecordList(new List<sObject>{obj}, sMethodName, sClassName, false);
        }

        public static DMLUtilsWrapper  doUndeleteRecord(sObject obj, String sMethodName, String sClassName, Boolean allOrNone) {        
            return doUndeleteRecordList(new List<sObject>{obj}, sMethodName, sClassName, allOrNone);
        }
        
        public static DMLUtilsWrapper  doUndeleteRecordList(List<sObject> sObjectList, String sMethodName, String sClassName) {
            return doUndeleteRecordList(sObjectList, sMethodName, sClassName, false);
        }

        public static DMLUtilsWrapper  doUndeleteRecordList(List<sObject> sObjectList, String sMethodName, String sClassName, Boolean allOrNone) {
            if(!sObjectList.isEmpty()) {
                List<Database.Error> dbErrorList   = new List<Database.Error>();
                List<Database.UndeleteResult> dataList = new List<Database.UndeleteResult>();
                List<String> referenceIds = new List<String>();
                String currReferenceId;
                try {
                    //perform DML with the sent DML Options
                    dataList = Database.undelete(sObjectList, allOrNone);
                    
                    //loop through the UndeleteResult to see if there were any failures
                     for (Integer i = 0; i < dataList.size(); i++) {
                        currReferenceId = sObjectList[i].Id;
                        referenceIds.add(sObjectList[i].Id);
                        if (!dataList[i].isSuccess()) {
                            dbErrorList.addAll(dataList[i].getErrors());
                        }     
                    }
                } 
                catch(Exception err) {
                    //Log Exception
                    ErrorLoggerFramework.insertApplicationErrorLog(sClassName, sMethodName, err, currReferenceId);
                }

                DMLUtilsWrapper  wrapper = new DMLUtilsWrapper (dataList, dbErrorList);

                //if there were failures, log those errors by creating CRM_CP_Error_Log__c record
                if(!dbErrorList.isEmpty()){
                    List<String> orderIds = new List<String>();
                        String objectName;
                    if (referenceIds[0] != null && referenceIds[0] != '' && referenceIds[0] InstanceOf Id){
                        Id referenceIdAsId = (Id) referenceIds[0];
                            objectName = referenceIdAsId.getSobjectType().getDescribe().getName();
                        }
                    for(String referenceId : referenceIds){                        
                        if(objectname == CRM_CP_GlobalConstants.OBJECT_ORDER_STRING){
                            orderIds.add(referenceId);
                        }  
                    }
                    ErrorLoggerFramework.insertDMLApplicationErrorLogs(wrapper, referenceIds, orderIds, sClassName, sMethodName);
                }     
                return wrapper;
                }
            //return null if nothing is sent
            return null;     
        }
        
        public static DMLUtilsWrapper  doUpsertRecord(sObject obj, String sMethodName, String sClassName, String sObjectName) {        
            return doUpsertRecordList(new List<sObject>{obj}, new List<Id>{obj.Id}, null, sMethodName, sClassName, sObjectName);
         }
    
        public static DMLUtilsWrapper  doUpsertRecord(sObject obj, List<String> referenceIds, List<String> orderIds, String sMethodName, String sClassName, String sObjectName) {        
            return doUpsertRecordList(new List<sObject>{obj}, referenceIds, orderIds, sMethodName, sClassName, sObjectName);
         }
         
         public static DMLUtilsWrapper  doUpsertRecordList(List<sObject> sObjectList, String sMethodName, String sClassName, String sObjectName) {
            return doUpsertRecordList(sObjectList, null, null, sMethodName, sClassName, sObjectName);
        }

		public static DMLUtilsWrapper  doUpsertRecordList(List<sObject> sObjectList, List<String> referenceIds, List<String> orderIds, String sMethodName, String sClassName, String sObjectName) {
            Database.DMLOptions dmlOptions = new Database.DMLOptions();
            dmlOptions.optAllOrNone = false;
            return doUpsertRecordList(sObjectList, referenceIds, orderIds, sMethodName, sClassName, sObjectName, dmlOptions);
        }

    public static DMLUtilsWrapper  doUpsertRecordList(List<sObject> sObjectList, List<String> referenceIds, List<String> orderIds, String sMethodName, String sClassName, String sObjectName, Database.DMLOptions dmlOptions) {
        if(!sObjectList.isEmpty()) {
            List<Database.Error> dbErrorList = new List<Database.Error>();
            List<Database.UpsertResult> dataList = new List<Database.UpsertResult>();
            List<String> errorReferenceIds = new List<String>();
            String currReferenceId;
                           
            try {
                //Upsert cannot be done on Generic sObject
                //So need to cast the sent list into a concrete object
                String sObjListType = CRM_CP_GlobalConstants.DMLU_LIST_TYPE_START + sObjectName + CRM_CP_GlobalConstants.GREATER_THAN;
                List<SObject> castedObjectList = (List<SObject>)Type.forName(sObjListType).newInstance();
                castedObjectList.addAll(sObjectList);

                //perform DML with the sent DML Options
                dataList = Database.upsert(castedObjectList, false);
                
                //loop through the UpsertResult to see if there were any failures
                for (Integer i = 0; i < dataList.size(); i++) {
                    if (referenceIds != null){
                        currReferenceId = referenceIds[i];
                    }
                    if (dataList[i].isCreated()){
                        if (referenceIds != null){
                            errorReferenceIds.add(referenceIds[i]);
                        }
                        else {
                            errorReferenceIds.add(null);
                        }
                    }
                    else {
                        errorReferenceIds.add(sObjectList[i].Id);
                    }
                    if (!dataList[i].isSuccess()) {
                        dbErrorList.addAll(dataList[i].getErrors());
                    }     
                }
            } 
            catch(Exception err) {
                //Log Exception
                ErrorLoggerFramework.insertApplicationErrorLog(sClassName, sMethodName, err, currReferenceId);
            }
            
            DMLUtilsWrapper  wrapper = new DMLUtilsWrapper (dataList, dbErrorList);

            //if there were failures, log those errors by creating CRM_CP_Error_Log__c record
            if(!dbErrorList.isEmpty()){
                ErrorLoggerFramework.insertDMLApplicationErrorLogs(wrapper, errorReferenceIds, orderIds, sClassName, sMethodName);
            }
            return wrapper;
        }
        //return null if nothing is sent
        return null;
    }    
    
    public static void publishEvent(List<sObject> errorLogs, List<String> referenceIds, List<String> orderIds, String sMethodName, String sClassName) {
        List<Database.Error> dbErrorList   = new List<Database.Error>();
        List<Database.SaveResult> dataList = new List<Database.SaveResult>();
        List<String> errorReferenceIds = new List<String>();
        try {
            //perform DML 
            dataList = EventBus.publish(errorLogs);                
            
            //loop through the saveresult to see if there were any failures
            for (Integer i = 0; i < dataList.size(); i++) {
                if (referenceIds != null){
                    errorReferenceIds.add(referenceIds[i]);
                }
                else {
                    errorReferenceIds.add(null);
                }
                if (!dataList[i].isSuccess()) {
                    dbErrorList.addAll(dataList[i].getErrors());
                }     
            }
        } 
        catch(Exception err) {
            //Log Exception
            ErrorLoggerFramework.insertApplicationErrorLog(sClassName, sMethodName, err, null);
        }
        
        DMLUtilsWrapper  wrapper = new DMLUtilsWrapper (dataList, dbErrorList);
        //if there were failures, log those errors by creating CRM_CP_Error_Log__c record
        if(!dbErrorList.isEmpty()){
            ErrorLoggerFramework.insertDMLApplicationErrorLogs(wrapper, errorReferenceIds, orderIds, sClassName, sMethodName);
        }                 
        
    }
    
}
