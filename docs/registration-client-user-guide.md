# Overview
This guide highlights the various options provided in the reference UI implementation of the registration client.

## Pre-requisites
1. Create and activate the machine using Admin portal.
2. Create a user/operator account in keycloak
3. Using the Admin portal, assign the operator a role of either the Supervisor or Officer.
4. Finally, perform User Zone mapping and User Center mapping in the Admin portal.
 
## Know your machine TPM keys
 


  Registration client setup
  <Initial sync with screenshot>
   <second launch of reg client with pre-loader- explain about the build setup validation, to which servers it is connected to, ports>
     <if there are any upgrades available>
       
If the operator does not have "default" role, they can refer to <> for operator onboarding.

### Mode of operation
* **Offline**- Operator can use the reg client in offline mode to only do the registrations and EOD process. During offline, operator authentication will be based on locally saved password hash. An operator can work in offline mode only if they have logged into to the reg client being online atleast once.
* **Online**- Machine must be online for the registration client first launch. For any server-client sync or vice-versa, the reg client must be online. In the online mode, the client reaches out to the server for passowd authentication.
       
**Note**: On successful onboard of the operator, biometric templates of the operator are stored locally.
       Biometric authentication does not reach out to the server everytime instead it is validated based on the locally stored templates on the reg clint machine. 

### Operational Tasks

* **Synchronize Data**: Synchronize data is the data required to make the reg client functional. Full sync is performed initially during the launch of the reg client for the first time. Post this, reg client syncs only the changes from sever and this is called as the delta sync. Synchronize data is automated and can be triggered manually. 
The happens automatically while launching the of the reg client and also manually initiated by the operator.
 
       1. Configuration sync: Sync of properties which drives in deciding the reg client UI functionality. For example: Invalid login attempts, idle timeout, thresholds,etc
       1. Masterdata sync : As a part of this sync, supporting information like Dynamic fields data, templates, locations, screen authorization, block listed wordsetc is pulled in.
       1. UserDetails sync: userID, user roles along witrh their status is synced. Only the user details belonging to machine mapped center will be synced. 
       1. Certificate sync: Certificates used to validate the server signatures, device CA certificates, public key used to encrypt the registartion packet will be synced.
       1. Packet sync: All the approved/rejected Registration IDs(RIDs) will be synced to the server. All the synced RID packets will be uploaded to the server. All the uploaded packet status will be synced from server.
          
* **Download Pre-Registration Data**: An operator can download the pre-registration data of a machine mapped center while being online and store it locally in the registration machine for offline use. Now when the system is offline and the pre-registration data is already downloaded, the operator can enter the pre-registration ID to auto-populate the registration form. Provided the machine is online, any pre-registration application can be downloaded irrespective of the center booked by the resident.
     
**Note**- Date Range of pre-registration data to be downloaded and storage location of pre-registration data in the registration machine is configurable. this is synced as a part of configuration sync.       
       
* Update Operator Biometrics:  Using this option, the operator can onboard themselves anytime which in turn updates their biometric templates locally. The only pre-requisite being that the machine is online. 
       
* Application Upload: 
      
* Center Remap Sync:
      
* Check Updates:

## Settings

### Registration Tasks

* New Registration:
* Update UIN:
* Lost UIN:
* Correction:

For <refer to ID lifecycle management page>

### End of day processes

* Pending Approval:
* Re-registration:
  
  
### Dashboard:
