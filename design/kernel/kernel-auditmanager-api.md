# Audit API

#### Background

This library can be used to audit events and operations. It has method exposed to save event details as audit in database. 


#### Solution


**The key solution considerations are**

- Create an interface for AuditManager having required method declaration, which will be exposed to the other applications.


- Create a project which implements AuditManager to save event details as audit in database.


**Class Diagram**


![Class Diagram](_images/kernel-auditmanager-api-cd.png)



**ERD**



![ERD](_images/kernel-auditmanager-erd.png)



## Implementation


**kernel-auditmanager-api** [README](../../../kernel/kernel-auditmanager-api/ReadMe.md)
