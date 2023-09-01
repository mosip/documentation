# Collab Environment Setup Guides

Hello Partner! Looking to collaborate with us? Look no further than here!

### Introduction

The Collab environment in [MOSIP ](https://docs.mosip.io/1.2.0/)offers a collaborative platform for partners and stakeholders to thoroughly test and validate their integrations, modules and services. This environment is exclusively designed for partners and contributors involved in developing solutions on the MOSIP platform, enabling them to perform comprehensive testing and seamless integration of their solutions with the latest platform code. To gain access to this environment, kindly click [here](https://collab.mosip.net/).

### Purpose

This guide has been created to offer a step-by-step overview of the fundamental procedures that as a partner, you must adhere to, in order to begin working with the Collab environment. By carefully following the setup and configuration process, which is outlined module by module within this guide, you will be able to effortlessly access the Collab environment, establish the necessary modules or services, and undertake testing and validation tasks.

### Pre-requisites

Before starting with the Collab environment, please ensure you have the following prerequisites in place:

* **UIN credential (Unique Identification Number)** - Issuance of [UIN](https://docs.mosip.io/1.2.0/id-lifecycle-management/identifiers#uin) as a demo credential will allow you to explore MOSIP's capabilities and experience seamless identity management firsthand. Provide your details in this UIN generation [form](https://docs.google.com/forms/d/e/1FAIpQLSc2I0CQqlYRIrEmcJ3J3tKlYOVNcYNj88YZe4MMwU2RZTrjOA/viewform), and we'll generate demo credentials that will enable you to navigate through different modules.
* **Wireguard installation** - Wireguard is a modern, efficient, and secure VPN (Virtual Private Network) technology that facilitates secure communication and data transfer over the internet. It offers enhanced privacy, encryption, and ease of use, making it an ideal solution for secure access to various modules within MOSIP’s Collab environment. Accessing a few modules in MOSIP will require wireguard access. To obtain access, please raise a request by completing the form available [here](https://docs.google.com/forms/d/e/1FAIpQLSeI3VcvEYMvOgtobV92r7293AVqq7bEQgNE6WHn-JTiuLOGqg/viewform), and subsequently, follow the installation instructions outlined in the provided [guide](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-external-dependencies#msg-gateway).
* **MOCK SMPT** - A mock SMTP server is a simulated email server used for testing and development purposes. In MOSIP, it is installed as part of the default installation and is utilized to mimic the behavior of a real SMTP server, allowing developers to test email functionality and interactions without sending actual emails. To setup a mock SMTP server for the message gateway during V3 installation, click [here](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-external-dependencies#msg-gateway).

**Let’s Get Started!**

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
* Accessing this module and running it on your local system will require [wireguard access](wireguard-client-installation-guide.md). Raise a request by filling out the [form](https://docs.google.com/forms/d/e/1FAIpQLSeI3VcvEYMvOgtobV92r7293AVqq7bEQgNE6WHn-JTiuLOGqg/viewform) here and get started.

#### e-Signet Setup Guide

* e-Signet aims to offer a simple yet powerful mechanism for end users to identify themselves to avail the online services and also share their profile information. To learn more about e-Signet, click [here](https://docs.esignet.io/).
* For the end-to-end process of how to run e-Signet in our Collab environment, click [here](https://mosip.atlassian.net/wiki/spaces/MSD/pages/1141112984).
* For details on how to use the application, refer to our [end user guide](https://docs.esignet.io/esignet-end-user-guide).
* Wireguard access is not required to set this up.

#### Inji Setup Guide

* Inji is a mobile wallet and authenticator that enables storage of all forms of IDs and credentials in a single digital wallet, enabling offline identity verification through just a selfie! To learn more about Inji, click [here](https://docs.mosip.io/inji/).
* For the end-to-end process of how to run Inji in our Collab environment, click [here](https://docs.mosip.io/1.2.0/collab-getting-started-guide/collab-inji-setup-guide).
* For details on how to use the application, refer to our [end user guide](https://docs.mosip.io/inji/enduser-guide).
* Wireguard access is not required to set this up.

#### ActiveMQ Setup Guide

* ActiveMQ is an open-source message broker that facilitates the communication between different components and services within a distributed system. In MOSIP, ActiveMQ is utilized as a messaging broker to enable asynchronous communication between various modules and services. To learn more, click [here](https://activemq.collab.mosip.net/user-manual/index.html).
* For the end-to-end process of how to run ActiveMQ in our Collab environment, click here (Upcoming).
* For details on how to use the service, refer to our [end user guide](https://activemq.collab.mosip.net/api/index.html) and go through the APIs of ActiveMQ.
* Wireguard access is not required to set this up.

#### Keycloak User Guide

* KeyCloak is used to manage user authentication and authorization, ensuring that only authorized users have access to the various modules and functionalities within the platform. It plays a crucial role in maintaining the security and integrity of the platform by managing user identities, access controls, and user sessions. To learn more, click [here](https://docs.mosip.io/1.2.0/modules/keymanager).
* For the end-to-end process of how to use KeyCloak in our Collab environment, click here (Upcoming).
* Running this component in your local system will require wireguard access. To get started, raise a request by filling out the [form](https://docs.google.com/forms/d/e/1FAIpQLSeI3VcvEYMvOgtobV92r7293AVqq7bEQgNE6WHn-JTiuLOGqg/viewform) here.
* Kibana is a powerful data visualization and exploration tool that works with elastic search. It allows users to create interactive dashboards and visualizations to analyze and interpret large volumes of data, helping to uncover insights, trends, and patterns for informed decision-making.
* In MOSIP, Kibana dashboards are utilized to monitor and analyze system metrics, logs, and performance data. To learn more, click [here](https://kibana.collab.mosip.net/app/home#/).
* The dashboards give a visual display of metrics and important data to track the status of various pre and post-enrollment processes. To get all the necessary information and to effectively navigate and set up Kibana, click [here](https://docs.mosip.io/1.2.0/modules/reporting#dashboards).
* For step-by-step instructions on how to access and configure the Kibana dashboard in your V3 installation, please click the following link: [Accessing and Configuring Kibana Dashboard - V3 Installation Guide](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines).
* Wireguard access is not required to set this up.

#### MinIO Client Utility

* MinIO is an open-source, high-performance object storage server that is designed for cloud-native and containerized environments. It allows organizations to build their own private cloud storage infrastructure that is scalable, highly available, and easily deployable. In MOSIP, MinIO is used to store various types of data, such as documents, images, and files, providing a reliable and efficient storage solution. To learn more, click [here](collab-getting-started-guide.md).
* For MinIO installation for the object store, click [here](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-external-dependencies).
* Running this utility in your local system will require [wireguard access](wireguard-client-installation-guide.md). Raise a request by filling out the [form](https://docs.google.com/forms/d/e/1FAIpQLSeI3VcvEYMvOgtobV92r7293AVqq7bEQgNE6WHn-JTiuLOGqg/viewform) here and get started.

#### Admin Portal Setup Guide

* Admin application is a web-based application used by a privileged group of administrative personnel to manage various master data and carry out operational activities. To learn more about the Admin Portal, click [here](https://docs.mosip.io/1.2.0/modules/administration).
* For the end-to-end process of how to run the Admin Portal in our collab environment, click here(Upcoming).
* For details on how to use the application, refer to our [end user guide](https://docs.mosip.io/1.2.0/modules/administration/admin-portal-user-guide).
* Running this application in your local system will require [wireguard access](wireguard-client-installation-guide.md). Raise a request by filling out the [form](https://docs.google.com/forms/d/e/1FAIpQLSeI3VcvEYMvOgtobV92r7293AVqq7bEQgNE6WHn-JTiuLOGqg/viewform) here and get started.

#### Resident Services Setup Guide

* The Resident Services application is a self-service-based portal, that can be used by the residents themselves. It is a web-based UI application that provides residents of a country the services related to managing their Unique Identification Number (UIN).To learn more about Resident Services, click [here](https://docs.mosip.io/1.2.0/modules/resident-services).
* For the end-to-end process of how to run Resident Services in our Collab env, click here. (Upcoming)
* Wireguard access is not required to set this up.

#### Kafka Services

* In MOSIP, Kafka serves as a distributed messaging system that facilitates the exchange of data between different components and modules of the platform. It's purpose is to provide a scalable, reliable, and fault-tolerant way to transmit data and events in a decoupled manner, ensuring efficient communication and data synchronization across various parts of the system. To know more, click [here](https://kafka.apache.org/downloads).
* For the end-to-end process of how to run the Kafka Services in our Collab env, click here. (Upcoming)
* To check the details on how to set up Kafka for V3 installation, click [here](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-external-dependencies#kafka-setup).
* Wireguard access is not required to set this up.

#### Mock MDS/SBI Services

* Mock MDS (Mock Master Data Store) is a simulated version of the Master Data Store used for testing and development purposes. It replicates the behavior of the actual Master Data Store, but doesn't store data persistently. Mock MDS is used to mimic the interactions with the Master Data Store during testing and development, allowing developers to verify the functionality of different modules without affecting the real data. To learn more, click [here](https://drive.google.com/drive/folders/1wMW5h1fBxAdBwTzOmPL7Sd\_UON7yuIvU).
* SBI (Secure Biometric Interface) in MOSIP ensures secure and reliable integration of biometric data for identity verification and authentication. SBI ensures secure storage and retrieval of biometric data, enhancing the accuracy and reliability of identity-related operations. To learn more, click [here](https://drive.google.com/drive/folders/1wMW5h1fBxAdBwTzOmPL7Sd\_UON7yuIvU).
* To run [Mock MDS](https://github.com/mosip/mosip-mock-services/blob/master/MockMDS/README.md)/ SBI in registration mode in the Collab environment, click [here](https://drive.google.com/file/d/1inXH7t1x2toVLGPNMoefYIU5kY1dG7C8/view?usp=sharing).
* Wireguard access is not required to set this up.

**Step 3: Testing and Validation**

Once the setup and configuration is completed, you should proceed with testing and validation activities to ensure the smooth functioning of the modules or services. The testing process may include:

* Performing end-to-end tests for the integrated modules or services.
* Validating data exchange and interoperability between different components.
* Verifying the compliance of the modules or services with the specified requirements and standards.

**Step 4: Get-in-touch : Report issues and seek support**

If you need any help or come across any problems during the testing and integration process, please feel free to contact us using the support system provided below.

* Navigate to [Community](community.mosip.io).
* Provide a detailed description about the support you require or provide detailed information about the issue you have encountered, including steps to reproduce, error messages, logs, and any other relevant details.

Continuous communication and collaboration between the MOSIP team and the community will aid successful integrations and also help resolve issues if any, within the Collab environment.

_We thank you for your ongoing support and look forward to building MOSIP together!_
