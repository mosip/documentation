# Audit Service

#### Background

This service can be used to audit events and operations. Service has REST API exposed to save event details as audit in database. 


#### Solution


**The key solution considerations are**


- Create a project which provides REST service to send event/action details.


- REST service can be used by any MOSIP module for auditing through HTTP client.


- Request body model for POST **/auditmanager/audits**


```
{
  "eventId": "EventId12333",
  "eventName": "Event Name1",
  "eventType": "EventType3",
  "actionTimeStamp": "2018-11-04T10:52:48.838Z",
  "hostName": "Host Name6",
  "hostIp": "10.89.213.89",
  "applicationId": "ApplicationId89",
  "applicationName": "Application Name22",
  "sessionUserId": "SessionUserId22",
  "sessionUserName": "Session UserName22",
  "id": "id3333",
  "idType": "idType333",
  "createdBy": "user1",
  "moduleName": "Module Name22",
  "moduleId": "ModuleId22",
  "description": "Description for event"
}
```



- Response body model for POST **/auditmanager/audits**

```
{
  "status": true
}
```
 





**Class Diagram**





![Class Diagram](_images/kernel-auditmanager-cd.png)



**ERD**





![ERD](_images/kernel-auditmanager-erd.png)



## Implementation


**kernel-auditmanager-service** [README](../../../kernel/kernel-auditmanager-service/README.md)
