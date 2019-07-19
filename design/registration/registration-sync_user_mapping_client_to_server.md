**Design - Registration user mapping sync from Client to Server**

**Background**

As part of the User on-boarding, the self on-boarded user information against the machine will be captured in local DB.  
The same information should be pushed from client to server by using the service provided by the Server.


The **target users** are

-   Server
-   Officer/Supervisor
-   Application


The key **requirements** are

- The user mapping to the will be captured as part of the user on-boarding. The same information we need to push to server in regular intervals based on the              
  configuration.
  
- The JOB should be either automatic /Sync Data option which was provided in the menu list.

The key **non-functional requirements** are

-   The server call should be https mode.
	
**Solution**

1.	Registration user mapping information should be sent to server from client.
-	Frequency of execution – configurable based on the job frequency [Automatic], "Sync Data" menu will be listed in the Menu section provided to the user.

2.	The configuration information should be get from the SyncJOBDef table.

3.	While pushing the information based on the center ID and machined ID , the user information details should be pushed 

4. The user information should pick from the Registration user detail tables.
 

**Sequence and Class Diagram**
![Registration user mapping sync Sequence diagram](_images/reg_user_mapping_client_to_server.png)
    