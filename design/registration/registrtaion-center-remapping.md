**Design - Registration Center machine mapping changed** 


**Background**
***  
The registered machine to the desired center will be changed or mapped to new center. At that time the current captured data should be moved to server without any failure. This design provides the details about the process of re-mapping the machine from one center to another center.


The **target users** are
***  
-  System.[Registration Client]
-  Registration Operator/Supervisor

The key **requirements** are
***  
  1. Once the client machine receives details of re-mapping to a new registration center, new registration, 
     UIN update and lost UIN cannot be initiated. In-progress registrations can be completed.
     
  2. A one-time background process to push packet IDs, packets and user on-boarding data to the server will
  	 happen when the system is online AND there are no pending approval packets. It will then delete all the
  	 data except audit data. The user from the old registration center cannot login thereafter.
  	 
  3. If the one-time process has not yet run, the user will still be able to login and perform sync, EoD, export
     and upload. The user cannot perform pre-registration download and user on-boarding.

	
**Solution**
***  
1.As part of the Master sync using the machine ID/ Mac id + Center Id, if the response contains the string which relevant to the center re-mapping or changed : 
   - Then update the property[**'mosip.registrtaion.centermappedchanged'**] value as true in the GLOBAL_PARAM table.  
   - Display the alert message as 'You machine has been re-mapped to another center, kindly complete the pending activities' .  
   - Stop the auto sync process by updating the de-activation flag. Henceforth only manual sync process can only be performed until the machine mapping completed.  
   - Maintain this status flag in the session context to identify the 'Center Mapping' state.  
   
2.When user clicks on the [New Registration/UIN Update/Lost UIN], if the property [**'mosip.registrtaion.centermappedchanged'**] value as 'true' then don't allow them to proceed.  

3.**Triggering Point:** When user clicks on the 'Machine Re-mapping' option in the menu or initiate [New Registration/UIN Update/Lost UIN] the process, if remapping flag is 'true' then invoke the CenterRemappingService - with processCenterMapped() method and display the message as 'Machine cleanup process has been started due to remapping'.  

4.Create the CenterRemappingService - with processCenterMapped() method, which does the following functionalities.  
 
4a.If the system is online and the operator is not in middle between any of the operations [New Registration/UIN Update/Lost UIN] then do the below process as  sequence steps.     
   **a.**Check for any pending packets to be uploaded to the server and waiting for 'PROCESSING' status.   
   **b.**Check for any packets to be approved/ rejected/ upload / sync to the server based on 'Server Status' flag.    
   **c.**Delete the packets and records in the table as below :  
      - Pre-registration : all packets can be deleted from hard disk and the respective data can be cleaned from tables.  
      - Registration {New / Update/ Lost}: packets in the state of [Server Status] 'PROCESSING', 'PROCESSED', 'RE-REGISTER' can be deleted.  
      - Center specific master tables can be deleted.   
      - Don't delete the data from 'GLOBAL_PARAM' table as this is not specific to any center.   
      - Don't delete record in AUDIT table.  
   **d.**Once all deletion completed :    
      - Then remove all Users and their respective detail with respect to the current center.  
      - Update the 'mosip.registrtaion.centermappedchanged' flag as false.  
      - Enable the sync process.  
      - Display valid alert [information type] message to inform the user as process completed.  
 
5.If the system is offline we should wait until the system is online and then only this process should initiate.  

6.While doing this process we should display the alert stating  **'Upload is going on. Please don't close the application'**.   
	
7.Progress bar or uploading image should be displayed in the screen and the background should be fade out. 
 
8.Please create the **reg_machine_center_changed.sql** and added to the module
	**registration-services** --> 	**src/main/resources**.
	
9.All events should be logged in the AUDIT table.    

List of **Packet Status** from server:  

		**RECEIVED**   	:	Successfully uploaded the packet to server. Virus Scan and Decryption not yet started.
		**RE-SEND**    	:	Virus Scan or Decryption failed.
		**PROCESSING**	:	After Virus Scanner and Decryption successfully completed and until the UIN Generation.
       **PROCESSED**	:	UIN Generated successfully.
		**RE-REGISTER**	:	If any structural validation fails.


**Sequence and Class Diagram**  
***  
![Registered machine center changed  class and sequence diagram](_images/reg_center_machine_changed.png)
    