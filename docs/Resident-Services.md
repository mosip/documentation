# Overview
Resident services are the self services which is used by the resident themselves via a portal.  Functionalities  such as lock/unlock authentication types, reprint UIN, view authentication history etc. are available. The services use OTP method of authentication. 

The backend is a set of services with REST API interface (provided by MOSIP) and front end is a portal to be developed by an SI/country according to the requirements. 

# Detailed functionality
[Resident Services Functionality](Resident-Services-Functionality.md)

# Process flow
* [Lock UIN](_images/resident_services/resident_services_lock_uin_flow.jpg)
* [Unlock UIN](_images/resident_services/resident_services_unlock_uin_flow.jpg)
* [Update UIN](_images/resident_services/resident_services_initiate_uin_update_flow.jpg)
* [Track UIN update](_images/resident_services/resident_services_track_uin_update_flow.jpg)
* [Track UIN with RID](_images/resident_services/resident_services_track_uin_with_rid_flow.jpg)
* [Retrieve lost UIN](_images/resident_services/resident_services_retrieve_lost_uin_flow.jpg)
* [Generate VID](_images/resident_services/resident_services_generate_vid_flow.jpg)
* [Revoke VID](_images/resident_services/resident_services_revoke_vid_flow.jpg)
* [Downlad e-UIN](_images/resident_services/resident_services_download_euin_flow.jpg)
* [Reprint e-UIN](_images/resident_services/resident_services_reprint_euin_flow.jpg)
* [Retreive lost RID](_images/resident_services/resident_services_retrieve_lost_rid_flow.jpg)

# Logical view

![Logical diagram](_images/resident_services/resident_services_logical_diagram.jpg)

# Services
For detailed description of Resident Services, code and design refer to [resident services repo](https://github.com/mosip/resident-services). 

# Build and deploy
Refer to build and deploy instructions in [resident services repo](https://github.com/mosip/resident-services). 

# APIs
[Resident Services APIs](Resident-Services-APIs.md)
