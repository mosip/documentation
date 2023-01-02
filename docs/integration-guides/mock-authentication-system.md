  # Mock Authentication System
  
This guide helps with the steps to mock the authentication server integration in IdP-service. It is for development purpose only.
 
    
This is the implementation class:    https://github.com/mosip/idp/blob/develop/authentication-wrapper/src/main/java/io/mosip/idp/authwrapper/service/MockAuthenticationService.java
    
##  Deployment & integration

1. Update the below property in `idp-default.properties`
    
   `mosip.idp.authn.wrapper.impl=MockAuthenticationService`
      
2. `persona files` - This is the json file used to store data of mock individual. The file should be named after the `individualId`
   example: filename - 34578673456.json where 34578673456 is the individualId
   
   Sample persona json file can be found here: https://github.com/mosip/idp/blob/develop/idp-service/src/test/resources/mockida/8267411571.json
   
3. Mapping file of persona fields to OIDC claims
   `mosip.idp.authn.mock.impl.claims-mapping-file=/home/mosip/mockida/claims_attributes_mapping.jso` 
   
    Sample claims mapping file can be found here: https://github.com/mosip/idp/blob/develop/idp-service/src/test/resources/claims_attributes_mapping.json
    
4. Mock authentication service, follows the concept like every relying-party will have a policy assigned.
    * Policy defines the list of allowed `userinfo` (kyc-attributes).
    * Before building the userinfo based on consented claims, mock-authentication-service
      validates if the consented claims are part of the policy.
    * Also this json has the public-key of the relying party to create userinfo JWE.
      Below path sets the path to look for the relying party policy json.
     `mosip.idp.authn.mock.impl.policy-repo=/home/mosip/mockida` files are named after the relying party ID
      example: filename - partner1_policy.json.
     
      Here, `partner1` is the relying party ID
      
      Sample file: https://github.com/mosip/idp/blob/develop/idp-service/src/test/resources/mockida/mock-relying-party-id_policy.json   
        
