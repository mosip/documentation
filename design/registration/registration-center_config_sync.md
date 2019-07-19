Design - Registration Center Configuration Sync Service


**Background**

As part of the launch of the application, the center configuration details will be downloaded from the server to client. 
Always the server will push the delta information to clients to update the configuration. These information will be required to start the application.


The **target users** are

-   Supervisor
-   Officer


The key **requirements** are

- The server will provide the information based on the each center id. Client will call this service, online and pull the delta details and persisted.
	Always the configuration will be overridden by the latest.
- All application configuration values should be taken by this desired info which we captured.

The key **non-functional requirements** are

-   The server call should be https mode.
-   The received information should be JSON file.

	
**Solution**

1.	Registration center configuration from server to be pulled if the system is in online,always before start of the application.
-	Frequency of execution – will be configurable for batch JOB automatic and manually also the user can click on the **Sync Data** to sync.

2.	Global PARAM table: Holds the key/value pair for each configuration elements.

2.	Get the latest configuration by passing the center id as input parameter. 
-	If the configuration not available, the application should not start initially. This sync has to be initialed before launch of the application.
-   Based on the certain configured days if the application is not download latest configuration, 
	then the application will be restricted the user to download the latest information form server.
   
4.	Parse the response :-
-	This would provide us as a JSON response
-	We need to create the GlobalParam Entity, to transfer the key value pair from JSON.
6.	Persist the all latest configuration into the **Global Param** table. If existed update the with the latest values
 

**Sequence and Class Diagram**
![Registration center configuration  sync Sequence diagram](_images/Reg_center_config_sync_job.png)
    