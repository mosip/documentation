**Design - Registration user role sync.**

**Background**

As part of the application launch, the user credentials will be loaded before launch of the application.The user credentials like userid and password will be downloaded from the server to client using this sync job.


The **target users** are

-   User credentials[Login] sync Server
-   Officer/Supervisor
-   Application


The key **requirements** are

- Server sends only the User data of users mapped to the specific Registration Center that the USB device belongs to.

- Data of existing users in the client is updated and data of new users is added.

The key **non-functional requirements** are

-   The server call should be https mode.
	
**Solution**

1.	Registration user credentials  information should be downloaded from server from client.
-	Frequency of execution – configurable based on the job frequency [Automatic], "Sync Data" menu will be listed in the Menu section provided to the user.

2.	The configuration information should be get from the SyncJOBDef table.

3.	While downloading the information based on the center ID, the user credentials details should be pulled. 

4. The user credentials will be store into the user detail table.
 

**Sequence and Class Diagram**
![Registration user role sync Sequence diagram](_images/reg_center_user_credentials_sync.png)
    