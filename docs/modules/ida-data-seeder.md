---
description: Draft
---

# IDA Data Seeder

## Overview

MOSIP's [IDA](../id-authentication.md) module is capable of running standalone providing verification services. In a full fledged MOSIP installation the [UIN's](../identifiers.md#uin) are issued as part of the [Registration process](../id-lifecycle-management.md) and the demographic and biometric data (credentials) is handed over to IDA for authentication via [Websub](../websub.md). (see [credential issuance](https://docs.mosip.io/1.2.0/modules/id-authentication-services#credential-issuance-callback)). However, for testing purposes it is highly desirable that one should be able to seed test data into IDA and perform successful verification without having to install the entire MOSIP lifecycle management process. This would be especially very useful for integration partners to test their integrations using MOSIP authentication. The partners can just upload their synthetic data - like UINs, demographics and even biometrics and call MOSIP Auth APIs to perform verification and obtain a [Token ID.](../identifiers.md#token-id) IDA Data Seeder is a Python utility to import such data into IDA.

In its current form, the utility is intended for testing purposes. _DO NOT USE IN PRODUCTION!._

Future versions of the utility will provide capability to import non-MOSIP ID data of a country and use MOSIP's IDA.

## Dependent services

* All [IDA services](https://docs.mosip.io/1.2.0/modules/id-authentication-services) (Internal Service, Auth Service, OTP Service)
* [Datashare](https://docs.mosip.io/1.2.0/modules/datashare)
* [Key Manager](https://docs.mosip.io/1.2.0/modules/keymanager)&#x20;
* [Partner Management Service](https://docs.mosip.io/1.2.0/modules/partner-management-services#partner-management-service)&#x20;
* [Websub](https://docs.mosip.io/1.2.0/modules/websub) &#x20;

## Design

* Datashare service calls Key Manager APIs to perform data encryption
* PMS service is required to onboard partner for performing Authentication for the imported data.
* Websub is required to publish the onboarded partner details to IDA.

## Source code

Available in Github [here](https://github.com/mosip/ida-data-seeder.git).

## Run

### Prerequisites

* Clone the `develop` branch of repo: [https://github.com/mosip/ida-data-seeder.git](https://github.com/mosip/ida-data-seeder.git)
*   Initialize virtualenv:

    ```
    python3 -m venv ~/.venv/ida-seeder
    ```
*   Install the python requirements:

    ```
    source ~/.venv/ida-seeder/bin/activate
    pip install -r requirements.txt
    ```
* Create a new folder `secrets-store` under `data_seeder` folder. The folder is used to store the secrets required for the seeder.&#x20;
*   Export `uin_hash_salt` table data from `ID_REPO` database from the environment and create a CSV file with only id & salt values. Example:

    ```
    1,PwNa9oV+GtusHPxAumIssA== 
    ```
* Edit the environment related details in `config/config.toml` file. Refer comments in config file to update the necessary values.
* Data to be import should in a text file with a separator `|`.  The column header names in the text file should match  the  [ID Schema](https://docs.mosip.io/1.2.0/id-lifecycle-management/id-schema) field names of the particular IDA installation.  Column headers `language`, `id` and `vid` are mandatory`.`

### Run

Make sure you are have Wireguard running on your  machine to connect to MOSIP.

```
python data_seeder/seeder_main.py
```

