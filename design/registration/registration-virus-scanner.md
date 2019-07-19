Design for the Registration -- Virus Scan

**Background**

Registration client application should provide the facility to scan 
the desired folder as a input. The application scans the particular 
folder and display the alert to the user if any infected file found. 
User has to take the necessary action on this. 
This virus scanner is running based on the configuration frequency as background.

The **target users** are

-   System
-   Registration officer/Supervisor

The key **requirements** are

-   Scan packet folder
-   Scan logs
-   Scan the application folder [where the application is installed]
-   Scan the database.

The key **non-functional requirements** are

-   Connectivity:

    -   The Kernel Virus scanner API should be able to communicate to the installed virus 
        scanner. 
    	 At present we are using the open source ClamAV.

-   Security:

    -   No one should have permission to alter the data stored in the
        local db.

-   Database:

    -   Store the data retrieved in the sync job to the database table.

    -   All connection should be closed once db process completed.

**Solution**

**The key solution considerations are --**

-   VirusScannerServiceImpl.java - This will scan the system application and pescribed folder.
-   VirusScannerJob which extends the BaseJob and override the methods.
-   The same logic should be for both invoked calls.
-   Use the Kernel Virus scanner JAVA API for this.

-   The Virus scanner should be invoked from main menu and as well as the automated job based on the frequency.
	The Paths for this should be provided as the external properties files 
	
	1. Packet location
	2. DB path
	3. Application Installed Path.

 **UI **

Implement the menu item in the HomeController to invoke manually for the Virus Scanner.
Create the proper alert success/error to intimate the user.

 Apply the below common criteria

-   Audit

-   Log

-   Java Documentation

-   Junit

  **JOB**
Add the new Job Entry in the SYNC_JOB_DEF table for the frequency of Virus Scanner.


Class and Sequence Diagram:

![VirusScanner ClassDiagram](_images/reg_virus_scanner_class.png)

![VirusScanner Sequence Diagram](_images/reg_virus_scanner_seq.png)
