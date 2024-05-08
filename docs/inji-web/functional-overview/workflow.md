# Workflow

This document outlines the workflow for key functionalities of Inji Web.

**Download Verifiable Credentials as PDF**:

The image below illustrates the workflow for the VC download process and explains the various components involved in this flow.

<figure><img src="../../.gitbook/assets/line dia.png" alt=""><figcaption><p>VC Download as PDF</p></figcaption></figure>

_**Reference Implementation**: Download of Insurance VC using **Sunbird Credentials** service with_ [_eSignet KBI (Knowledge Based Identification)_](https://docs.esignet.io/end-user-guide/knowledge-based-authentication) _as identification partner_

**Components**:

* **Inji Web**: A web application featuring an intuitive, user-friendly interface for easy VC downloads by the user
* **Mimoto**: The BFF (Backend for Frontend) for Inji Web, which retrieves default configurations and provides all necessary APIs to facilitate downloads. Mimoto receives requests from Inji, performs validations, and forwards them to respective services.
* **eSignet**: Inji Web showcases the VC download process using the **OpenID4VCI** method with **eSignet**. In this workflow, eSignet provides the authentication, authorization and credential issuance end points to connect to the credential provider

### Understanding the workflow

1.  **User accesses Inji Web portal in browser**:

    i. Users navigate to the Inji Web portal from their web browser

    ii. The portal features a user-friendly interface accessible to all
2.  **Selection of Issuer and credential type**:

    i. Users can select an Issuer from the list of trusted issuers

    ii. Users can choose a credential type from the available options provided by the issuers
3.  **Verification**:

    i. In this reference implementation, the Insurance use case is demonstrated using Sunbird Credentials

    ii. Users are required to provide their Policy Number, Date of Birth, and Name for verification

    iii. The provided information is then verified against the issuer's records
4. **Credentials Download**: Upon successful verification, the verifiable credential is downloaded in PDF format and stored in the “Downloads” folder of the user's system
