# DML Utilities and Error Logging Framework

This repository contains utility classes for performing DML operations and an error logging framework for handling and logging errors in Salesforce.

## Files

- **DMLUtils.java**: Contains methods for performing various DML operations such as insert, update, delete, undelete, and upsert. It also includes methods for logging errors that occur during these operations.
- **DMLUtilsWrapper.java**: A wrapper class used to encapsulate the results of DML operations, including any errors that occur.
- **ErrorLoggerFramework.java**: Provides methods for logging application and integration errors. It supports logging errors to Salesforce custom objects and publishing error events.

## Classes and Methods

### DMLUtils.java
- **doInsertRecord**: Inserts a single record.
- **doInsertRecordList**: Inserts a list of records.
- **doUpdateRecord**: Updates a single record.
- **doUpdateRecordList**: Updates a list of records.
- **doDeleteRecord**: Deletes a single record.
- **doDeleteRecordList**: Deletes a list of records.
- **doUndeleteRecord**: Undeletes a single record.
- **doUndeleteRecordList**: Undeletes a list of records.
- **doUpsertRecord**: Upserts a single record.
- **doUpsertRecordList**: Upserts a list of records.
- **publishEvent**: Publishes error logs as platform events.

### DMLUtilsWrapper.java

- **DMLUtilsWrapper**: Constructor to initialize the wrapper with results of DML operations and errors.

### ErrorLoggerFramework.java

- **insertApplicationErrorLog**: Logs application errors.
- **insertIntegrationErrorLog**: Logs integration errors.
- **insertApplicationErrorLogList**: Logs a list of application errors.
- **insertIntegrationErrorLogList**: Logs a list of integration errors.
- **getRecordTypeByName**: Retrieves the record type ID by name.
- **insertDMLApplicationErrorLogs**: Logs DML application errors.
- **getErrorLog**: Creates an error log record.
- **createCommonFields**: Creates common fields for error logs.

## Usage

1. **DML Operations**: Use the methods in `DMLUtils` to perform DML operations on Salesforce records. The methods return a `DMLUtilsWrapper` object containing the results and any errors.
2. **Error Logging**: Use the `ErrorLoggerFramework` to log errors that occur during DML operations or other processes. The framework supports logging to custom objects and publishing error events.

## Example

```java
// Example of inserting a record and logging any errors
sObject record = new Account(Name = 'Example Account');
DMLUtilsWrapper result = DMLUtils.doInsertRecord(record, 'refId', 'orderId', 'methodName', 'className');

if (!result.databaseErrorList.isEmpty()) {
    ErrorLoggerFramework.insertApplicationErrorLog('className', 'methodName', result.databaseErrorList[0].getMessage(), 'refId');
}
