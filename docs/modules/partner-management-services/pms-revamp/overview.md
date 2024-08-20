# Overview

Partner Management System (PMS) is undergoing a major revamp and as our first step, we have introduced a brand new web application - Partner Management Portal. This brings:

* Improved usability and user experience.
* Enhancement of existing features.
* Introduce new features.
* Introduce new partner types.
* Technology stack upgrade

This release marks the developer's preview release (1.3.0-dp.1) of Partner Management System which focuses on implementation of **Authentication Partner** workflow **in the new UI.** This version of PMS is designed to run on 1.2.0.1 version of MOSIP platform.

The **key features** of Authentication Partner incorporated in this release are:

* **Partner Certificate:**
  * **Upload and Re-upload:** Easily upload or re-upload Certificate Authority (CA) signed Partner Certificate.
  * **Download:** Download CA signed Partner Certificate and corresponding MOSIP Signed Certificate.
* **Policies:**
  * **Request Policies:** Request policies within selected policy group.
  * **Policy List:** View a tabular list of requested policies along with Partner Admin approval status.
  * **View Policy Details:** Access detailed views of individual policies, including status of Partner Admin approval/rejection.
* **Authentication Services:**
  * **OIDC Client:**
    * **Create OIDC Client:** Create OIDC Clients for approved policies.
    * **View OIDC Details:** Access a tabular list and individual views of submitted OIDC Client details, including OIDC Client IDs.
    * **Edit:** Edit existing OIDC Client details.
    * **Deactivate:** Deactivate OIDC Client whenever needed.
  * **API Key:**
    * **Generate API Key:** Create API Keys for approved policies.
    * **View API Key Details:** View a tabular list and individual details of submitted API Keys.
    * **Deactivate:** Deactivate API Keys when necessary.



We are reconstructing the entire PMS ground up and our upcoming releases is going to keep the best of current system and rebuild everything else from scratch.&#x20;

The exiting PMS will be available during the overhaul and new system is to gradually take over in phase wise releases of the system, ensuring thereby a smooth and seamless transition. This means existing system will continue to work and be available during the course undergoing rebuilding process.

Moving further from the current release with which we bring for you a renewed 'Auth Partner', our upcoming releases will focus on working afreash on other Partner Type(s)  which will include... <mark style="color:red;">**PT1, PT2**</mark>.
