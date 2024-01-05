# Managing Duplicate Thumbprint entries in Keymanager

This document addresses how an error in Database upgrade script can be managed effectively.

## Issue

If the below error has been encountered while attempting to execute the upgrade script, this can be resolved by following the steps mentioned in this document.

**Error message**

```
psql:sql/1.1.5.5_to_1.2.0.1-B1_upgrade.sql:13: ERROR: could not create unique index "cert_thumbprint_unique" DETAIL: Key (cert_thumbprint, partner_domain)=(231bd472ab24ef60ec6*******2cace89c34, AUTH) is duplicated. psql:sql/1.1.5.5_to_1.2.0.1-B1_upgrade.sql:13: STATEMENT: ALTER TABLE keymgr.ca_cert_store ADD CONSTRAINT cert_thumbprint_unique UNIQUE (cert_thumbprint,partner_domain);
```

The error message states that a unique index, named `cert_thumbprint_unique`, cannot be created due to a duplicate entry. Specifically, the values for the `cert_thumbprint` and `partner_domain` columns, which are (231bd472ab24ef60ec6*******2cace89c34, AUTH), already exist in the database. This duplicate entry violates the unique constraint defined for the `ca_cert_store` table in the `mosip_keymanager` database.

To address and successfully execute the DB upgrade script, the following steps can be taken:

1. Identify the duplicate entries in the mosip_keymanager table.
2. To accomplish this, use the provided SQL query:
   
   ```
   SELECT * 
   FROM keymgr.ca_cert_store 
   WHERE (cert_thumbprint, partner_domain) IN 
         (SELECT cert_thumbprint, partner_domain 
          FROM your_table_name 
          GROUP BY cert_thumbprint, partner_domain 
          HAVING COUNT(*) > 1);
   ```

   This query will retrieve the rows of data that contain duplicate entries.

3. As a precautionary measure, it is advisable to create a backup of all the duplicate values.

4. Remove the duplicate entries so that only one composite key remains. The aforementioned SQL script can be reused to verify that the duplicates have been successfully deleted. If the result is empty, then all duplicates have been removed.

5. By following these steps, the problem should be resolved, and the DB upgrade script can be executed without any further issues.
