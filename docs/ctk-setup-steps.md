# Setting up Compliance Tool Kit(CTK)

**Prerequisite**: CTK is deployed with the required modules. 

_**Note**_: 
* Ensure  that in `kernel-default.properties`, value of `mosip-toolkit-client` is `auth.server.admin.allowed.audience`. 
* After that restart `authmanager` service and `compliance-toolkit-service`.

## Steps to setup mosip-compliance-toolkit

1\.	Clone mosip-compliance-toolkit
    git clone https://github.com/mosip-compliance-toolkit.git
    
2\. Project structure will be as shown below.

<image>
  
3\. Resources folder contains schemas, testdata and testcases that needs to be added to MinIO and DB.
  
 <image>
   
## Steps to upload resources to MinIO
   
1\. Login to MinIO from browser.
2\. Create `compliance-toolkit` bucket.
3\. Create a new folder named `testdata` in the above bucket. Upload all testdata zip files from resources to it.
4\. Create a new folder named `schemas` in the above bucket.  Upload all **sbi** and **sdk** schemas, **testcase** schema from resources folder to it.
5\. There is no need to upload `compliance_test_definitions_sbi.json` and `compliance_test_definitions_sdk.json`.
6\. Please restart the pods after adding new files in MinIO.
   
## Using Postman
   

   

