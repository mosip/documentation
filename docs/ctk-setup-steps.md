# Setting up Compliance Tool Kit (CTK)

**Prerequisite**: CTK is deployed with the required modules. 

_**Note**_: 
* Ensure  that in `kernel-default.properties`, value of `mosip-toolkit-client` is `auth.server.admin.allowed.audience`. 
* After that restart `authmanager` service and `compliance-toolkit-service`.

## Steps to setup mosip-compliance-toolkit

1\.	Clone mosip-compliance-toolkit
    git clone https://github.com/mosip-compliance-toolkit.git
    
2\. Project structure will be as shown below.

![](_images/)
  
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
   
1\. Using Keycloak, create a new user for compliance toolkit.

     <image>
2\. Make sure to add the email ID. Also give the user `GLOBAL_ADMIN`.

3\. Login to compliance toolkit in your env with above the Keycloak user.
         
    Open the developer tools and copy the Authorization token from the headers section under `Networks` tab.
         
    <image>
4\. Add the Authorization token in postman, copy the token and place it in headers section of request (Cookie=Authentication:eyAjksa...) and send request.
    <image>
        
 ## Steps to upload testcases to Database
        
1\.	Open postman and create a POST request.
        
2\.	URL endpoint https://api-internal.dev.mosip.net/v1/toolkit/saveTestCases
        
3\.	Copy the Authorization token in request header as mentioned in `Using Postman` section.
        
4\.	Open resources folder in project.
        
5\.	`compliance_test_definitions_sbi.json` file has all the test cases in it.
        
6\.	Copy testcases array from this file and prepare a request as shown below.
        
7\.	Request body for `saveTestCases` request 
        
```jsonc  
{
    "version": "1.0",
    "requesttime": "2022-10-29T06:06:51.174Z",
    "metadata": null,
    "request": {
        "testCases": [
<Paste the testcases here>
                     ]
               }
}
```
8\. Change the `requesttime` to current day and send the request.
9\. Same should be done for `compliance_test_definitions_sdk.json`.

    
   

