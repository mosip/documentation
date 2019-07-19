Design - Packet deletion


**Background**

The Background job runs based on the configuration which was taken from the global parameter configuration. The job should delete the packets which are older than the configured days.After deletion of the packets the same data should be deleted from the transaction.


The **target users** are

-  System.[Registration Client]


The key **requirements** are

-   The configuration should be taken from the global param configuration.
-   The packets and acknowledgment should be deleted older than the configured days.
-   The transaction data also should be deleted after the packet deletion.
	
**Solution**

1.	Frequency of execution – once in a day. [configurable]
-	Automatic

2.	Global PARAM table: Holds the execution interval for the packet deletion.
-	Threshold period - How many days before the key file to be pulled from server?

3.	Get the RIDs based on the logic [current time stamp - configured number of days] 
	less than the result value.
	   
5.	Delete those RIDs [packet and acknowledgment screen].
6.  Delete the transactions from the registration and transaction tables also.
7.  Delete the audit logs for those  packet related information.
 

**Sequence and Class Diagram**
![Packet Deletion class and sequence diagram](_images/packetDeletion_design.png)
    