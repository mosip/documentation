# Mock Identity Provider

This guide helps with the steps to mock the authentication server integration in IdP-service. It is for development purposes only.

## Deployment & integration

1.  Update the below property in `idp-default.properties`

    `mosip.idp.authn.wrapper.impl=MockAuthenticationService`
2.  `persona files` - This is the JSON file used to store data of the mock individuals. The file should be named after the `individualId` example: filename - 34578673456.json where 34578673456 is the individualId

    Sample persona JSON file can be found here: https://github.com/mosip/idp/blob/develop/idp-service/src/test/resources/mockida/8267411571.json
3.  Mapping file of persona fields to OIDC claims `mosip.idp.authn.mock.impl.claims-mapping-file=/home/mosip/mockida/claims_attributes_mapping.jso`

    Sample claims mapping file can be found here: https://github.com/mosip/idp/blob/develop/idp-service/src/test/resources/claims\_attributes\_mapping.json
4. Mock authentication service follows the concept like every relying party will have a policy assigned.
   * The policy defines the list of allowed `userinfo` (KYC-attributes).
   * Before building the user info based on consented claims, the mock-authentication-service validates if the consented claims are part of the policy.
   *   Also, this JSON has the public key of the relying party to create user info JWE. The below path sets the path to look for the relying party policy JSON. `mosip.idp.authn.mock.impl.policy-repo=/home/mosip/mockida` files are named after the relying party ID example: filename - partner1\_policy.json.

       Here, `partner1` is the relying party ID

       Sample file: https://github.com/mosip/idp/blob/develop/idp-service/src/test/resources/mockida/mock-relying-party-id\_policy.json
