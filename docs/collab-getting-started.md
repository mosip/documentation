# Getting Started Guide: Collab Environment

Hello Partner! Looking to collaborate with us? Look no further than here!

### Introduction

The Collab environment in MOSIP offers a collaborative platform for partners and stakeholders to thoroughly test their and validate their integrations, modules, and services. This environment is exclusively designed for partners and contributors involved in developing solutions on the MOSIP platform, enabling them to perform comprehensive testing and seamless integration of their solutions with the latest platform code. To gain access to this environment, kindly click [here](https://collab.mosip.net/).

### Purpose

This guide has been created to offer a comprehensive, step-by-step overview of the fundamental procedures that as a partner, you must adhere to in order to begin working with the Collab environment. By carefully following the setup and configuration process, which is outlined module by module within this guide, you will be able to effortlessly access the Collab environment, establish the necessary modules or services, and undertake testing and validation tasks.

### Pre-requisites

Before starting with the Collab environment, please ensure you have the following prerequisites in place:

* **UIN credential (Unique Identification Number)** - Issuance of [UIN](https://docs.mosip.io/1.2.0/id-lifecycle-management/identifiers#uin) as a demo credential will allow you to explore MOSIP's capabilities and experience seamless identity management firsthand. Provide your details in this UIN generation [form](https://docs.google.com/forms/d/e/1FAIpQLSc2I0CQqlYRIrEmcJ3J3tKlYOVNcYNj88YZe4MMwU2RZTrjOA/viewform), and we'll generate demo credentials that enable you to navigate through different modules. 

* **Wireguard installation** - Wireguard is a modern, efficient, and secure VPN (Virtual Private Network) technology that facilitates secure communication and data transfer over the internet. It offers enhanced privacy, encryption, and ease of use, making it an ideal solution for secure access to various modules within the MOSIP’s Collab environment. Accessing a few modules in MOSIP will require wireguard access. To obtain access, please raise a request by completing the form available [here](https://docs.google.com/forms/d/e/1FAIpQLSeI3VcvEYMvOgtobV92r7293AVqq7bEQgNE6WHn-JTiuLOGqg/viewform), and subsequently, follow the installation instructions outlined in the provided [guide](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-external-dependencies#msg-gateway).

* **MOCK SMPT** - A mock SMTP server is a simulated email server used for testing and development purposes. In MOSIP, it is installed as part of the default installation and is utilized to mimic the behavior of a real SMTP server, allowing developers to test email functionality and interactions without sending actual emails. To set up a mock SMTP server for the message gateway during V3 installation click [here](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-external-dependencies#msg-gateway).

Let’s Get Started!

**Step 1**: Access the Collab Environment

* Open your web browser and navigate to the Collab environment URL: [MOSIP Collab](https://collab.mosip.net/).
* In the Collab environment, click on the specific module/ service that you want to access as a contributor.


**Step 2**: Follow the module-specific guide to integrate with/ test the preferred application

* In MOSIP's Collab environment, the following components and services are available. 
* Navigate to the specific module you are looking to test and follow the corresponding guide for a step-by-step overview of the setup process involved.


#### Pre-registration Setup Guide 

* Pre-registration is a MOSIP module that allows residents to pre-register themselves by providing demographic data, upload documents, and book appointments, before official registration at the registration center, thereby optimizing the enrollment process. To learn more about pre-registration click [here](https://docs.mosip.io/1.2.0/modules/pre-registration).

* For the end-to-end process on how to set up the Pre-registration Client in the Collab environment, click here (Coming Soon).

* For details on how to use the application, refer to our [end user guide](https://docs.mosip.io/1.2.0/modules/pre-registration/pre-registration-user-guide).

* Wireguard access is not required to set this up.

#### Registration Client Setup Guide

* The Registration Client application in MOSIP enables agents to efficiently register residents by capturing their demographic and biometric data, in addition to managing tasks like onboarding, data synchronization, software upgrades, and packet management. To know more, click [here](https://docs.mosip.io/1.2.0/modules/registration-client/registration-client-home-page).

* For the end-to-end process on how to set up the Registration client in the Collab environment, click [here](https://mosip.atlassian.net/wiki/spaces/MSD/pages/1140293719).

* For details on how to use the application, refer to our [user guide](https://docs.mosip.io/1.2.0/modules/registration-client/registration-client-user-guide).

* Wireguard access is not required to set this up.

#### Partner Management Setup Guide 

 * MOSIP's Partner management services (PMS) module streamlines partner onboarding, policy management, and data sharing. It comprises of Partner Management and Policy Management Services, providing essential support for effective collaboration within MOSIP. To learn more, click [here](https://docs.mosip.io/1.2.0/modules/partner-management-services).

* For the end-to-end process of how to run Partner Management in our collab environment, click here (Upcoming).

* For details on how to use the application, refer to our [end user guide](https://docs.mosip.io/1.2.0/modules/partner-management-services/partner-management-portal).

* Accessing this module and running it on your local system will require [wireguard access](https://github.com/mosip/documentation/blob/1.2.0/docs/wireguard-client-installation-guide.md). Raise a request by filling out the [form](https://docs.google.com/forms/d/e/1FAIpQLSeI3VcvEYMvOgtobV92r7293AVqq7bEQgNE6WHn-JTiuLOGqg/viewform) here and get started.


#### e-Signet Setup Guide

* e-Signet aims to offer a simple yet powerful mechanism for end users to identify themselves to avail the online services and also share their profile information. To learn more about e-Signet, click [here](https://docs.esignet.io/).

* For the end-to-end process of how to run e-Signet in our Collab environment, click [here](https://mosip.atlassian.net/wiki/spaces/MSD/pages/1141112984).

* For details on how to use the application, refer to our [end user guide](https://docs.esignet.io/esignet-end-user-guide).

* Wireguard access is not required to set this up.
  
#### Inji Setup Guide

* Inji is a mobile wallet and authenticator that enables storage of all forms of IDs and credentials in a single digital wallet, enabling offline identity verification through just a selfie! To learn more about Inji, click [here](https://docs.mosip.io/inji/).

* For the end-to-end process of how to run Inji in our Collab environment, click [here](https://mosip.atlassian.net/wiki/spaces/MSD/pages/1141178503).

* For details on how to use the application, refer to our [end user guide](https://docs.mosip.io/inji/enduser-guide).

* No wireguard access is required to set up.

### ActiveMQ Setup Guide

* ActiveMQ is an open-source message broker that facilitates the communication between different components and services within a distributed system. In MOSIP, ActiveMQ is utilized as a messaging broker to enable asynchronous communication between various modules and services. To learn more, click [here](https://activemq.collab.mosip.net/user-manual/index.html).

* For the end-to-end process of how to run ActiveMQ in our Collab environment, click here (Upcoming).

* For details on how to use the service, refer to our [end user guide](https://activemq.collab.mosip.net/api/index.html) and go through the APIs of ActiveMQ.

* Wireguard access is not required to set this up.

### Keycloak User Guide

* KeyCloak is used to manage user authentication and authorization, ensuring that only authorized users have access to the various modules and functionalities within the platform. It plays a crucial role in maintaining the security and integrity of the platform by managing user identities, access controls, and user sessions. To learn more, click [here](https://docs.mosip.io/1.2.0/modules/keymanager).

* For the end-to-end process of how to use KeyCloak in our Collab environment, click here. (Upcoming)

* Refer here for details on how to use the key manager services with key stores like [Hardware Security Module (HSM)](https://docs.mosip.io/1.2.0/modules/keymanager/hsm) and [mosip_keymgr](https://github.com/mosip/keymanager/tree/release-1.2.0/db_scripts/mosip_keymgr) DB.

* Running this component in your local system will require wireguard access. Raise a request by filling out the form here and get started.
