# Identity Repository Service

## 1. Background       


Identity Repository service can be used internally by products to create, read and update Identity information and to validate an input UIN. 



***1.1.Target Users -***  
- Registration Processor can use Identity Repo services to create and update Identity information associated with a UIN   
- ID Authentication can use Identity Repo services to validate an input UIN and read identity details associated with a UIN   
- Resident Services can use Update ID API when an Individual requests for updating ID details like address   

***1.2. Key Functional Requirements -***   
-	Store identity information for a given UIN
-	Update Identity information partially or status of UIN
-	Read Identity Information associated with a valid UIN
-	Check status of UIN for validating a UIN    

#### 1.2.1. Functional Flow Diagram - Create ID - 
![Functional Flow Diagram - Create ID](_images/kernel-idrepo-createid-fd.PNG)      


#### 1.2.2. Functional Flow Diagram - Retrieve ID - 
![Functional Flow Diagram - Retrieve ID](_images/kernel-idrepo-getidentity-fd.PNG) 

#### 1.2.3. Functional Flow Diagram - Update ID - 
![Functional Flow Diagram - Update ID](_images/kernel-idrepo-updateid-fd.PNG) 


***1.3. Key Non-Functional Requirements -***   

-	Logging :
	-	Log all the exceptions along with error code and short error message
	-	As a security measure, Individualâ€™s UIN should not be logged
-	Audit :
	-	Audit all transaction details in database
	-	Individualâ€™s UIN should not be audited     
-	Exception :
	-	Any error in storing or retrieval of Identity details should be handled with appropriate error code and message in the response  
-	Security :    
    

### 2.	Solution    


The key solution considerations are   
- Create a project which provides REST service to create, update and get Identity of Individual         
- REST service can be used by any MOSIP module to access these services through HTTP client         


**2.1.	Class Diagram**   
![Class Diagram](_images/kernel-idrepo-cd.PNG)   


**2.2.	REST Services**   


***2.2.1.	Create Identity***     

MOSIP Products can use ID Repo API spec available here - [ID Repository API Spec](https://github.com/mosip/mosip/wiki/ID-Repository-API) - to create Identity of an Individual    

1. 	Integrate with Kernel UIN Generator to create UIN   
2.	Below are the various UIN status, which are configurable and can be modified by the country as needed â€“    
a.	_REGISTERED_   
b.	_BLOCKED_   
c.	_DEACTIVATED_   
3. Once UIN is generated, assign â€œREGISTEREDâ€� as UIN status. UIN, status and Identity details are then stored in UIN and UIN_detail table   

Below sequence diagram for create Identity service shows sequence of operations to create UIN and store corresponding Identity details.   
![Create Identity Sequence Diagram](_images/kernel-idrepo-createid-sd.PNG)      



***2.2.2.	Update Identity***   

MOSIP Products can use ID Repo API spec available here - [ID Repository API Spec](https://github.com/mosip/mosip/wiki/ID-Repository-API) - to update Identity of an Individual    
1. 	Integrate with Kernel UIN validator to validate UIN     
2.	Once the request is successfully validated, update Identity details in UIN and UIN_detail tables    
 
Below sequence diagram for Update Identity service shows sequence of operations to update Identity details associated with a UIN.   
![Update Identity Sequence Diagram](_images/kernel-idrepo-updateid-sd.PNG)   

When UIN status is updated using Update ID API, the status is first validated against the configured status for the country. Once input UIN status matches the one among all the configured UIN status, it is updated in the database. 
Default configuration of UIN status has ACTIVATES, BLOCKED and DEACTIVATED. This can be changed based on country's requirements.       


***2.2.3.	Get Identity***   

MOSIP Products can use ID Repo API spec available here - [ID Repository API Spec](https://github.com/mosip/mosip/wiki/ID-Repository-API) - to retrieve Identity of an Individual by providing a UIN.    
1. 	Integrate with Kernel UIN validator to validate UIN     
2.	Once the request is successfully validated, retrieve Identity details in UIN and UIN_detail tables   


Below sequence diagram for create Identity service shows sequence of operations to retrieve Identity details associated with a UIN.   
![Get Identity Sequence Diagram](_images/kernel-idrepo-getidentity-sd.PNG)    


**2.3.	Database Sharding**    

UIN DB stores UIN and the corresponding identity details. In order to decrease load and increase search performance, UIN DB is horizontally partitioned into shards. Each shard is a separate database instance with same tables and rows in tables are distributed across shards.
ID Repo provides default shard implementation where shards are decided based on starting character of UIN. Below diagram shows the approach for sharding UIN DB.

![UIN Database Sharding](_images/kernel-idrepo-databasesharding.png)   


**2.4.	Encrypting/Decrypting Identity**    

Identity stored in UIN DB is encrypted/decrypted outside the DB. Details on the approach of encryption/decryption is available here - [Identity Encryption/Decryption](https://github.com/mosip/mosip/wiki/Security#database-encryption)
