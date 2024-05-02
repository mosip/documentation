# Local Setup

Inji Certify enables an issuer to connect with an existing database to issue verifiable credentials. It assumes the source database has a primary key for each data record and information required to authenticate a user (e.g. phone, email, or other personal information). Issuer can configure their respective credential schema for various types of certificates they wish to issue. Certificates are generated in JSON-LD as per W3C VC v1.1.

1. Visit the Inji Certify repository on GitHub: [**Inji Certify Repository**](https://github.com/mosip/inji-certify/tree/v0.8.0)
2. Refer to the README file provided in the repository for comprehensive instructions on setting up and using Inji Certify.
3. Follow the installation and setup steps outlined in the [**README**](https://github.com/mosip/inji-certify/blob/master/README.md) to deploy eSignet and Sunbird C using Docker Compose.
   1. [**eSignet Docker Compose**](https://github.com/mosip/inji-certify/tree/master/docker-compose-esignet)
   2. [**Sunbird Docker Compose**](https://github.com/mosip/inji-certify/tree/master/docker-compose-sunbird)
4. Once eSignet and Sunbird C are deployed, explore the functionality of Inji Certify by interacting with the system and configuring credential schemas for various types of certificates.
5. Refer to additional documentation and resources provided in the [**README**](https://github.com/mosip/inji-certify/blob/master/README.md) for further insights and guidance on using Inji Certify effectively.
