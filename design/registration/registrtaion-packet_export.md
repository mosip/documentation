**Design - Packet Upload**

**Functional Background**

As part of the registration packet created successfully the Supervisor has to authenticate the packets using the EOD process. 
Once done the authenticated packets will be uploaded to the registration processor by manually or automatically. If the registration application is not in online and RO/RS wants to export to the specific folder based on the user section path. Later the RO/RS will be uploaded same by using the portal services.

**Packet Export**
- The UI will provide the option to export label as **'Export'** the packets which status as 'Created'. 
- The exported packets path should be chosen by the user.
- The status should be updated in the transaction table as 'Exported'.
- While fetching the packet status this status 'Exported' also should be included.
- While deleting the packets for the configured no.of days, should include this status.

**Non Functional Scope**

-   Security :

-   The registration packet shouldn't be decryptable other than
        registration Server.

-   Log the each state of the packet export:

 	- As a security measures the UIN or customer information should
        not be logged.

-   Cache :

 	- Registration packet data shouldn't be cached and clear off all the
        data from the JVM local memory once the packet is created in
        local hard disk.

-   Audit :

    -   Each state of the packet export should be stored into the DB for
        audit purpose.

-   Exception :

    -   Any exception occurred during the packet export the same will be
        reported to the user with the user understandable exception.

-   Data History :

    -   Maintain the registration id, status and other high level info in
        the database table.

-   Configuration:

    -   SSH Private Key -- the respective byte values will be present in
        the database table along with the expiry detail.

    -   Before initiating the registration process, the key expiry to be
        validated.

**Solution**

Design Detail


 The detailed technical process for exporting the Packet to the server
  is provided below:
  
**Packet Exporting:**
  
-   Registration Application having the label as 'Export' to export the created and authenticated packets to the desired location which was selected by the user. 

-   Update the respective status in the table.

-   Registration -- client status with 'EXPORTED'

-   Transaction -- update status with 'EXPORTED'

-   Timestamp update.

-   The packets will be exported to the specific location.

-   Create the **PacketExportController** with below methods
        **packetExport**  --  to export packets to the specific folder.

-   **PacketExportService** having the method ***exportPackets*** and
    by calling the method, it will provide all the packets which are having
    the status as **Created**.

-   Create the Java component like "***PacketExportService"*** as
    method as "exportPackets".

-   update the respective status in the table.

    -   Registration -- client status with 'EXPORTED'

    -   Transaction -- update status with 'EXPORTED'

    -   Timestamp update.

-   The system should display the alert messages for success and failure
    messages.
    
-   The User role has the permissions to save the packets to the selected folder.


**Class and Sequence Diagram**

![Packet Export Class and Sequence Diagram ](_images/reg_packet_export.png)