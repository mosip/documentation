# OpenG2P-registry MTS Connector

## Overview

OpenG2P-registry MTS Connector (OMC) is a OpenG2P module which will be an addon to [Odoo](https://www.odoo.com/). OMC can generate a MOSIP Auth Token against the any record in OpenG2P registry by calling [MOSIP Token Seeder](../../mosip-token-seeder.md) (MTS) and store the same in beneficiary registry. This will be an important module in deduplication process when OpenG2P system uses MOSIP as its ID platform.

## Features of OMC

* Generates MOSIP token against the OpenG2P registry by calling [MTS](../../mosip-token-seeder.md).
* Uses `callback` delivery type of MTS
* Completely asynchronous execution
* OpenG2P can schedule a daily job to fetch the delta for the day
* A manual import feature will also be provided
* Removes VID if MOSIP Auth Token is generated&#x20;

<figure><img src="../../.gitbook/assets/openg2p-registry-mts-connector.png" alt=""><figcaption></figcaption></figure>

## Input

In OpenG2P, the user can configure for following fields to setup an interface with MTS through MTS-C.

* MTS Endpoint: URL for MTS Auth API
* MTS Input type: ODK, Custom.&#x20;
* Mapping: MTS Field mapping as required by the API
* Output Type: Currently supports only JSON
* Output Format: In case you want your output in a specific format other than what MTS is supplying
* Delivery Type: Currently supporting only "Callback"&#x20;
* Job Type: whether it is recurring on onetime setup
* Language: Mosip language setup. Default is "eng".
* Callback URL: A URL end point which would be called upon successful processing at MTS
* Callback auth URL: A auth URL to access the callback.
* Callback auth username
* Callback auth password



