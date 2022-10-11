# MTS Connector

## Overview

MTS Connector (MTS-C) is a OpenG2P module which will be an addon to [Odoo](https://www.odoo.com/). MOI will help in fetching the tokenized data from the ODK Central by calling the [MOSIP Token Seeder](mosip-token-seeder.md) (MTS) and store the same in beneficiary registry. This will be an important module in deduplication process when OpenG2P system is using MOSIP as its id platform.

## Features of MTS-C

* Generates MOSIP token while fetching from the ODK
* Uses callback delivery type of MTS
* Completely asynchronous execution
* OpenG2P can schedule a daily job to fetch the delta for the day
* A manual import feature will also be provided

<figure><img src=".gitbook/assets/mosip-token-seeder-connector.png" alt=""><figcaption></figcaption></figure>

## Input

In OpenG2P, the user can configure for following fields to setup an interface with MTS.

* MTS Endpoint: URL for MTS Auth API
* MTS Input type: ODK, Custom.&#x20;
* Mapping: MTS Field mapping as required by the API
* Output Type: Currently supports only JSON
* Output Format: In case you want your output in a specific format other than what MTS is supplying
* Delivery Type: Currently supporting only "Callback"&#x20;
* Job Type: whether it is recurring on onetime setup
* Language: Mosip language setup. Default is eng.
* Odata url (svc): OData service URL for the ODK form
* Base url (domain name): Base domain for the ODK central
* Version: Version of ODK central forms
* Project Id: Project id for the ODK submissions
* Form Id: ODK Form id
* Email: Email for ODK login
* Password: Password for ODK login
* Callback URL: A URL end point which would be called upon successful processing at MTS
* Callback auth URL: A auth URL to access the callback.
* Callback auth username
* Callback auth password
