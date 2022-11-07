---
description: Draft
---

# IDA Data Seeder

## Overview

A Python utility to import data into [IDA](https://docs.mosip.io/1.2.0/id-authentication) component.

## Dependent services

* All [IDA services](https://docs.mosip.io/1.2.0/modules/id-authentication-services) (Internal Service, Auth Service, OTP Service)
* [Datashare](https://docs.mosip.io/1.2.0/modules/datashare)
* [Key Manager](https://docs.mosip.io/1.2.0/modules/keymanager)&#x20;
* [Partner Management Service](https://docs.mosip.io/1.2.0/modules/partner-management-services#partner-management-service) (_Only for MOSIP versions < 1.2.0_)
* [Websub](https://docs.mosip.io/1.2.0/modules/websub) &#x20;

## Design

* Datashare service calls Key Manager APIs to perform data encryption
* PMS service is required to onboard partner for performing Authentication for the imported data.
* Websub is required to publish the onboarded partner details to IDA.

## Run

### Prerequisites

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
*   Export `uin_hash_salt` table data from `ID_REPO` database from the environment and create a CSV file with only id & slat values. Example:

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

