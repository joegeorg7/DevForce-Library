
public without sharing  class ErrorLoggerFramework {
    
    private static Id recordTypeIdApplication;
    private static Id recordTypeIdIntegration;
    
    private static final Map<Integer, String> DEBUGLEVEL_FOR_SEVERITY_MAP = new Map<Integer, String>{1 => 'Info', 2=> 'Warning', 3=> 'Error', 4=> 'Error', 5=> 'Error'};


    public ErrorLoggerFramework() {}
 
    public static void insertApplicationErrorLog(String className, Integer severity, String errorLocation, String referenceId, String errorMessage, String methodName, String statusCode, String systemType) {
        String recTypeId = recordTypeIdApplication == null ? getRecordTypeByName(GlobalConstants.ELF_APPLICATION_STRING) : recordTypeIdApplication;
        Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId, errorMessage, methodName, recTypeId, statusCode, systemType, null, null, DEBUGLEVEL_FOR_SEVERITY_MAP.get(severity), null, null);
        DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, null, GlobalConstants.ELF_APPLICATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }

    public static void insertApplicationErrorLog(String className, Integer severity, String errorLocation, String referenceId, String errorMessage, String methodName, String statusCode, String systemType, Boolean isInsert){
        String recTypeId = recordTypeIdApplication == null ? getRecordTypeByName(GlobalConstants.ELF_APPLICATION_STRING) : recordTypeIdApplication;
        Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId, errorMessage, methodName, recTypeId, statusCode, systemType, null, null, DEBUGLEVEL_FOR_SEVERITY_MAP.get(severity), null, null);
        if(isInsert){
            DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, null, GlobalConstants.ELF_APPLICATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
            
        }              
    }

    public static void insertIntegrationErrorLog(String className, String errorMessage, String methodName, String errorLocation, String statusCode, Integer severity, String referenceId, String systemType, String responseJSON, String integrationPayload){
        String responseJsonText = '';
        if(!String.isEmpty(responseJSON)){
            responseJsonText = responseJSON.replace('\\"', '"');  
        }
        String recTypeId = recordTypeIdIntegration == null ? getRecordTypeByName(GlobalConstants.ELF_INTEGRATION_STRING) : recordTypeIdIntegration;
        Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId, errorMessage, methodName, recTypeId, statusCode, systemType, null, null, DEBUGLEVEL_FOR_SEVERITY_MAP.get(severity), responseJsonText, integrationPayload);
        DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, null, GlobalConstants.ELF_APPLICATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);              
    }

    public static void insertIntegrationErrorLog(String className, Exception ex, String methodName, Integer severity, String referenceId, String systemType, String responseJSON, String integrationPayload){
        String errorMessage = ex.getMessage();
        String errorLocation = ex.getStackTraceString();
        String statusCode = String.valueOf(ex.getTypeName());
        insertIntegrationErrorLog(
                className,
                errorMessage,
                methodName,
                errorLocation,
                statusCode,
                severity,
                referenceId,
                systemType,
                responseJSON,
                integrationPayload
        );
    }

    public static void insertIntegrationErrorLog(String className, String errorMessage, String methodName, String errorLocation, String statusCode, Integer severity, String referenceId, String systemType, String responseJSON, String integrationPayload, String objectName){
        String responseJsonText = '';
        if(!String.isEmpty(responseJSON)){
            responseJsonText = responseJSON.replace('\\"', '"');  
        }
        String recTypeId = recordTypeIdIntegration == null ? getRecordTypeByName(GlobalConstants.ELF_INTEGRATION_STRING) : recordTypeIdIntegration;
        Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId, errorMessage, methodName, recTypeId, statusCode, systemType, referenceId, objectName, DEBUGLEVEL_FOR_SEVERITY_MAP.get(severity), responseJsonText, integrationPayload);
        DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, null, GlobalConstants.ELF_INTEGRATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }

    public static void insertIntegrationErrorLog(String className, String errorMessage, String methodName, String errorLocation, String statusCode, Integer severity, String referenceId, String systemType, String responseJSON, String integrationPayload, String objectName, Boolean isInsert){
        String responseJsonText = '';
        if(!String.isEmpty(responseJSON)){
            responseJsonText = responseJSON.replace('\\"', '"');  
        }
        String recTypeId = recordTypeIdIntegration == null ? getRecordTypeByName(GlobalConstants.ELF_INTEGRATION_STRING) : recordTypeIdIntegration;
        Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId, errorMessage, methodName, recTypeId, statusCode, systemType, referenceId, objectName, DEBUGLEVEL_FOR_SEVERITY_MAP.get(severity), responseJsonText, integrationPayload);
        if(isInsert){
            DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, null, GlobalConstants.ELF_INTEGRATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);            
        }
    }

    public static void insertIntegrationErrorLogList(String className, List<String> errorMessage, String methodName, String errorLocation, List<String> statusCode, List<Integer> severity, List<String> referenceId, String systemType, String responseJSON, String integrationPayload, Id objectId, String objectName){
        String recTypeId = recordTypeIdIntegration == null ? getRecordTypeByName(GlobalConstants.ELF_INTEGRATION_STRING) : recordTypeIdIntegration;
        List<Save_Error_Logs__e> errorLogs = new List<Save_Error_Logs__e>();
        for (Integer i = 0; i < errorMessage.size(); i++){
            String responseJsonText = '';
            if(!String.isEmpty(responseJSON)){
                responseJsonText = responseJSON.replace('\\"', '"');  
            }
            Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId.get(i), errorMessage.get(i), methodName, recTypeId, statusCode.get(i), systemType, objectId, objectName, DEBUGLEVEL_FOR_SEVERITY_MAP.get(severity.get(i)), responseJsonText, integrationPayload);
            errorLogs.add(errorLog);
        }
        DMLUtils.publishEvent(errorLogs, referenceId, null, GlobalConstants.ELF_INTEGRATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }
    
    public static void insertApplicationErrorLog(String className, String debugLevel, String errorLocation, String referenceId, String errorMessage, String methodName, String statusCode, String systemType) {
        String recTypeId = recordTypeIdApplication == null ? getRecordTypeByName(GlobalConstants.ELF_APPLICATION_STRING) : recordTypeIdApplication;
        Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId, errorMessage, methodName, recTypeId, statusCode, systemType, null, null, debugLevel, null, null);
        DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, null, GlobalConstants.ELF_INTEGRATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }


    public static void insertApplicationErrorLog(String className, String debugLevel, String errorLocation, String referenceId, String errorMessage, String methodName, String statusCode, String systemType, Id orderId, String objectName) {
        String recTypeId = recordTypeIdApplication == null ? getRecordTypeByName(GlobalConstants.ELF_APPLICATION_STRING) : recordTypeIdApplication;
        Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId, errorMessage, methodName, recTypeId, statusCode, systemType, orderId, objectName, debugLevel, null, null);
        DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, new List<String>{orderId}, GlobalConstants.ELF_APPLICATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }

    public static void insertApplicationErrorLog(String className, String methodName, Exception e, String referenceId){
        String objectName;
        if (referenceId != null && referenceId != '' && referenceId InstanceOf Id){
            Id referenceIdAsId = (Id) referenceId;
            objectName = referenceIdAsId.getSobjectType().getDescribe().getName();
        }
        Save_Error_Logs__e errorLog = getErrorLog(className, e.getStackTraceString(), referenceId,  e.getMessage(), methodName, GlobalConstants.ERROR_LOG_RECORD_TYPE_ID_APPLICATION, null, GlobalConstants.ERROR_LOG_SYSTEM_TYPE_SALESFORCE, referenceId, objectName, GlobalConstants.ERROR_LOG_DEBUG_LEVEL_ERROR, null, null);
        DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, null, GlobalConstants.ELF_APPLICATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }

    public static void insertApplicationErrorLogList(String className, String methodName, List<Exception> eList, List<String> referenceIdList){
        List<Save_Error_Logs__e> errorLogs = new List<Save_Error_Logs__e>();
        for (Integer i = 0; i < eList.size(); i++) {
            String objectName;
            if (referenceIdList[i] != null && referenceIdList[i] != '' && referenceIdList[i] InstanceOf Id){
                Id referenceIdAsId = (Id) referenceIdList[i];
                objectName = referenceIdAsId.getSobjectType().getDescribe().getName();
            }
            Save_Error_Logs__e errorLog = getErrorLog(className, eList[i].getStackTraceString(), referenceIdList[i], eList[i].getMessage(), methodName, GlobalConstants.ERROR_LOG_RECORD_TYPE_ID_APPLICATION, null, GlobalConstants.ERROR_LOG_SYSTEM_TYPE_SALESFORCE, referenceIdList[i], objectName, GlobalConstants.ERROR_LOG_DEBUG_LEVEL_ERROR, null, null);
            errorLogs.add(errorLog);
        }
        DMLUtils.publishEvent(errorLogs, referenceIdList, null, GlobalConstants.ELF_APPLICATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }

    public static void insertIntegrationErrorLog(String className, String errorMessage, String methodName, String errorLocation, String statusCode, String debugLevel, String referenceId, String systemType, String responseJSON, String integrationPayload){
        String responseJsonText = '';
        if(!String.isEmpty(responseJSON)){
            responseJsonText = responseJSON.replace('\\"', '"');  
        }
        String recTypeId = recordTypeIdIntegration == null ? getRecordTypeByName(GlobalConstants.ELF_INTEGRATION_STRING) : recordTypeIdIntegration;
        Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId, errorMessage, methodName, recTypeId, statusCode, systemType, null, null, debugLevel, responseJsonText, integrationPayload);
        DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, null, GlobalConstants.ELF_INTEGRATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }

    public static void insertIntegrationErrorLog(String className, String errorMessage, String methodName, String errorLocation, String statusCode, String debugLevel, String referenceId, String systemType, String responseJSON, String integrationPayload, String objectName){
        String responseJsonText = '';
        if(!String.isEmpty(responseJSON)){
            responseJsonText = responseJSON.replace('\\"', '"');  
        }
        String recTypeId = recordTypeIdIntegration == null ? getRecordTypeByName(GlobalConstants.ELF_INTEGRATION_STRING) : recordTypeIdIntegration;
        Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId, errorMessage, methodName, recTypeId, statusCode, systemType, referenceId, objectName, debugLevel, responseJsonText, integrationPayload);
        DMLUtils.publishEvent(new List<Save_Error_Logs__e>{errorLog}, new List<String>{referenceId}, null, GlobalConstants.ELF_INTEGRATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }

    public static void insertIntegrationErrorLogList(String className, List<String> errorMessage, String methodName, String errorLocation, List<String> statusCode, String debugLevel, List<String> referenceId, String systemType, String responseJSON, String integrationPayload, Id objectId, String objectName){
        String recTypeId = recordTypeIdIntegration == null ? getRecordTypeByName(GlobalConstants.ELF_INTEGRATION_STRING) : recordTypeIdIntegration;
        List<Save_Error_Logs__e> errorLogs = new List<Save_Error_Logs__e>();
        for (Integer i = 0; i < errorMessage.size(); i++){
            String responseJsonText = '';
            if(!String.isEmpty(responseJSON)){
                responseJsonText = responseJSON.replace('\\"', '"');  
            }
            Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId.get(i), errorMessage.get(i), methodName, recTypeId, statusCode.get(i), systemType, objectId, objectName, debugLevel, responseJsonText, integrationPayload);
            errorLogs.add(errorLog);
        }
        DMLUtils.publishEvent(errorLogs, referenceId, null, GlobalConstants.ELF_INTEGRATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }
    
    public static void insertApplicationErrorLogList(String className, String debugLevel, String errorLocation, List<String> referenceId, List<String> errorMessage, String methodName, List<String> statusCode, String systemType, List<String> orders) {
        String recTypeId = recordTypeIdApplication == null ? getRecordTypeByName(GlobalConstants.ELF_APPLICATION_STRING) : recordTypeIdApplication;
        List<Save_Error_Logs__e> errorLogs = new List<Save_Error_Logs__e>();
        for (Integer i = 0; i < errorMessage.size(); i++){
            String orderId = null;
            String objectName = null;
            if(orders.size() > 0){
                orderId = orders[i];
                objectName = 'CRM_CP_Order__c';
            }
            Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId[i], errorMessage[i], methodName, recTypeId, statusCode[i], systemType, orderId, objectName, debugLevel, null, null);
            errorLogs.add(errorLog);
        }
        DMLUtils.publishEvent(errorLogs, referenceId, orders, GlobalConstants.ELF_INTEGRATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }

    public static void insertApplicationErrorLogList(String className, String debugLevel, String errorLocation, List<String> referenceId, List<String> errorMessage, String methodName, List<String> statusCode, String systemType) {
        List<Save_Error_Logs__e> errorLogs = new List<Save_Error_Logs__e>();
        String recTypeId = recordTypeIdApplication == null ? getRecordTypeByName(GlobalConstants.ELF_APPLICATION_STRING) : recordTypeIdApplication;
        for (Integer i = 0; i < errorMessage.size(); i++){
            Save_Error_Logs__e errorLog = getErrorLog(className, errorLocation, referenceId[i], errorMessage[i], methodName, recTypeId, statusCode[i], systemType, null, null, debugLevel, null, null);
            errorLogs.add(errorLog);
        }
        DMLUtils.publishEvent(errorLogs, referenceId, null, GlobalConstants.ELF_INTEGRATION_ERROR_FUNCTION, GlobalConstants.ELF_CLASS_NAME);
    }

    public static Id getRecordTypeByName(String recordTypeName){
        Id recordTypeId;
        if(recordTypeName == GlobalConstants.ELF_INTEGRATION_STRING){
            recordTypeId = GlobalConstants.ERROR_LOG_RECORD_TYPE_ID_INTEGRATION;
            recordTypeIdIntegration = recordTypeId;
        } else if(recordTypeName == GlobalConstants.ELF_APPLICATION_STRING){
            recordTypeId = GlobalConstants.ERROR_LOG_RECORD_TYPE_ID_APPLICATION;
            recordTypeIdApplication = recordTypeId;
        }
        return recordTypeId;
    }
    
    public static void insertDMLApplicationErrorLogs(DMLUtilsWrapper wrapper, List<String> referenceIdList, List<Id> orderIdList, String className, String methodName){
        List<String> referenceIds = new List<String>();
        List<String> messages = new List<String>();
        List<String> codes = new List<String>();
        List<String> orderIds = new List<String>();
        if(wrapper.saveResultList != null && !wrapper.saveResultList.isEmpty()){
        for (Integer i = 0; i < wrapper.saveResultList.size(); i++){
            if (!wrapper.saveResultList[i].isSuccess()){
                messages.add(String.valueOf(wrapper.saveResultList[i].getErrors()[0].getMessage()));
                codes.add(String.valueOf(wrapper.saveResultList[i].getErrors()[0].getStatusCode()));
                if(referenceIdList!= null && referenceIdList.size() > 0){
                    referenceIds.add(referenceIdList[i]);
                }
                if(orderIdList != null && orderIdList.size() > 0){
                   orderIds.add(orderIdList[i]);
                    }
                }
            }  
        }
        if(wrapper.deleteResultList != null && !wrapper.deleteResultList.isEmpty()){
            for (Integer i = 0; i < wrapper.deleteResultList.size(); i++){
                if (!wrapper.deleteResultList[i].isSuccess()){
                    messages.add(String.valueOf(wrapper.deleteResultList[i].getErrors()[0].getMessage()));
                    codes.add(String.valueOf(wrapper.deleteResultList[i].getErrors()[0].getStatusCode()));
                    if(referenceIdList!= null && referenceIdList.size() > 0){
                        referenceIds.add(referenceIdList[i]);
                    }
                    if(orderIdList != null && orderIdList.size() > 0){
                        orderIds.add(orderIdList[i]);
                    }
                }
            }
        }
        if(wrapper.upsertResultList != null && !wrapper.upsertResultList.isEmpty()){
            for (Integer i = 0; i < wrapper.upsertResultList.size(); i++){
                if (!wrapper.upsertResultList[i].isSuccess()){
                    messages.add(String.valueOf(wrapper.upsertResultList[i].getErrors()[0].getMessage()));
                    codes.add(String.valueOf(wrapper.upsertResultList[i].getErrors()[0].getStatusCode()));
                    if(referenceIdList!= null && referenceIdList.size() > 0){
                        referenceIds.add(referenceIdList[i]);
                    }
                    if(orderIdList != null && orderIdList.size() > 0){
                        orderIds.add(orderIdList[i]);
                    }
                }
            }
        }    
        
        String stackTraceString = null;
        try{
            throw new StringException('throw exception');
        } catch(Exception e){
            stackTraceString = e.getStackTraceString();
        }
        String location = stackTraceString == null ? className + GlobalConstants.DOT + methodName : stackTraceString;
        insertApplicationErrorLogList(className, 
                                      GlobalConstants.ERROR_STRING, 
                                      location, 
                                      referenceIds,
                                      messages, 
                                      methodName, 
                                      codes,
                                      GlobalConstants.SALESFORCE_STRING,
                                      orderIds);
    }

   public static Save_Error_Logs__e getErrorLog(String className, String errorLocation, String refId, String errorMsg, String methodName, String recTypeId, 
                                                       String statusCode, String systemType, String objectId, String objectName, String debugLevel, 
                                                       String responseJSON, String integrationPayload) 
   {
       Save_Error_Logs__e platformEventRec = new Save_Error_Logs__e();  
       platformEventRec.Class_Name__c = className;
       platformEventRec.Error_Location__c = errorLocation;
       platformEventRec.Reference_Id__c = refId;
       platformEventRec.Error_Message__c = errorMsg;
       platformEventRec.Method_Name__c = methodName;
       platformEventRec.Type_of_Error__c = recTypeId;
       platformEventRec.Code__c = statusCode;
       platformEventRec.System_Type__c = systemType;
       platformEventRec.Debug_Level__c = debugLevel;
       platformEventRec.Callout_Response__c = responseJSON;
       platformEventRec.Integration_Payload__c = integrationPayload;
       
       switch on objectName {

           when 'Order'{
               platformEventRec.CRM_CP_Order__c = objectId;
           }

       }
       
       return platformEventRec;
    }  
    
    public static Error_Log__c createCommonFields(String className, String errorMessage, String methodName, String errorLocation, String statusCode, String debugLevel, String referenceId, String systemType){
        Error_Log__c errorObject = new Error_Log__c();

        errorObject.Class_Name__c = className;
        errorObject.Method_Name__c = methodName;
        errorObject.Debug_Level__c = debugLevel;
        errorObject.Error_Location__c = errorLocation;
        errorObject.Code__c = statusCode;
        errorObject.Error_Message__c = errorMessage;
        errorObject.Reference_Id__c = referenceId;
        errorObject.System_Type__c = systemType;
        
        return errorObject;   
    }
}
