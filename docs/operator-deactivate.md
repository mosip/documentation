## Deactivation of an operator

### How to deactivate an operator?
Operators can be deactivated by the admin using the IAM application user for user management.

### Why should an admin deactivate an operator?
1. The operator (Admin, Supervisor or Officer) has left the organization and should not have access to the MOSIP system
2. The operator (Admin, Supervisor or Officer) is now considered as a rouge individual in the system and should not have access to the MOSIP system

### What happens when an admin deactivates an officer or supervisor?
1. If the operator is not logged in to the Registration Client when the admin deactivates them,

 a. Operator tries to log in when their system is online, then, 
     i. The system performs an automatic login sync  
    ii. The system would have the latest status of the operator
   iii. The operator should not be able to log in
  
 b. Operator tries to login when their system is offline, then,
    i. The operator should be able to login into the system and perform most of the routine activities until the sync has happened as the application will not know if the operator was deactivated
   ii. When the operator does a sync,
       1. The system would have the latest status of the operator
       2. The operator would be informed that he/she is now deactivated
       3. The operator would be auto logged out from the system

2. If the operator is logged in when the admin deactivates the them,
  a. The operator should be able to perform most of the routine activities until sync has happened as the application will not know if the operator was deactivated
  b. When the sync is done,
      1. The system would have the latest status of the operator
      2. The operatorvwould be informed that he/she is now deactivated
      3. The operator would be auto logged out from the system

### What happens when a packet is created after the operator is deactivated?
Any packet created by the operator after the re-mapping in the server, should be sent for investigation in the registration processor. But, packets created by the operator before re-mapping should be processed unless the operator is in the blocklist.

### How can we upload packets created by the deactivated operator?
Another operator having access to the system should view the packets created by the deactivated operator and upload the packets to the server.

### What happens when an admin deactivates another admin?
1. If the user is not logged in to the admin application when another admin deactivates the user,
   a. If the user tries to login then, he/she should not be able to login to the admin portal
2. If the user is logged in to the admin application when another admin deactivates the user,
   b. Users should be able to access the admin portal until the session expires
