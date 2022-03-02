# Partner Management Portal 

_THIS DOCUMENT IS BEING UPDATED_.

## Overview
Partner management portal allows the partners to register themselves in MOSIP. With LTS release, the following types of partners can register themselves:
1.	Authentication Partners
2.	Credential Partners(with limited features)
3.	Device Providers
4.	FTM Provider

## Partner roles

|Partner Type|Associated Role|
|------|-----|
|Partner Admin|PARTNER_ADMIN|
|Policy Manager|POLICYMANAGER|
|Authentication Partner|AUTH_PARTNER|
|Credential Partner|CREDENTIAL_PARTNER|
|Device Provider|DEVICE_PROVIDER|
|FTM Provider|FTM_PROVIDER|

A Partner Admin can create Policies that are required for Authentication and Credential partners. The section below describes the types of policies that are supported by MOSIP.

## Home page

![](_images/pms-home-page.png)

## Policies

Learn more about Policy types, refer [here](partner-policies.md).

To create policies, policy groups should be defined. Policy groups can be considered as the regulatory bodies in a country, examples could be Telecom, Insurance, Banking, etc.

### Creation of Policy group
* Login as `Partner Admin` into the PMS portal.
* After successful login, on the left navigation pane, click on **Policy -> Policy Group**.
* The existing policy groups are listed on the screen and the new ones can be created. 

![](_images/pms-policy-groups.png)

**To create Policy groups**
* Click Policy -> Policy Group -> +Create Policy Group
* Enter the Policy group Name and Description and click **Save**.

![](_images/pms-create-policy-groups.png)

To search or filter any data pertaining to policy groups, filter menu can be used. 

![](_images/pms-filter-policy-groups.png)

You can also change the status of policy group(Deactivate/Re-activate) or edit it using the Action menu as shown below.

![](_images/pms-actionmenu-policy-groups.png)

On successful creation of Policy groups, polices can be created under that group. MOSIP supports two types of policies, i.e., **Auth** policy and **Datashare** policy.

## Auth Policy

By default, on clicking Auth  the screen will display all existing auth policies as shown below.
To create an Auth policy, click **Auth Policy -> Create Auth Policy** menu. 





