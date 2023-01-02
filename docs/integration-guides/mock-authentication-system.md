# Mock Identity Provider

This guide helps with the steps to mock the authentication server integration in the IdP service. It is for development purposes only.

## Deployment & Integration

1.  Update the below configuration in `idp-default.properties`

    `mosip.idp.authn.wrapper.impl=MockAuthenticationService`
2. Persona Files: This is the JSON file used to store the mock data of individuals. The file should be named after the individual's ID. \
   For example, filename - 34578673456.json where 34578673456 is the individual's ID. You can find a sample persona JSON file can be found [here](https://github.com/mosip/idp/blob/develop/idp-service/src/test/resources/mockida/8267411571.json).
3.  Create a mapping file for mapping persona fields to OIDC claims and add it to the configuration: `mosip.idp.authn.mock.impl.claims-mapping-file=/home/mosip/mockida/claims_attributes_mapping.json`

    You can find a sample claims mapping file can be found [here](https://github.com/mosip/idp/blob/develop/idp-service/src/test/resources/claims\_attributes\_mapping.json).
4. Mock authentication service assumes that every relying party will be mapped to a policy, where the policy defines the list of allowed `userinfo` attributes (KYC attributes).
   * Before building the user info based on consented claims, the mock-authentication-service validates if the consented claims are part of the policy.
   * Also, this JSON has the public key of the relying party to create user info JWE. The below path sets the path to look for the relying party policy JSON. `mosip.idp.authn.mock.impl.policy-repo=/home/mosip/mockida` files are named after the relying party ID example: filename - partner1\_policy.json.\
     Here, `partner1` is the relying party ID and the sample file is available [here](https://github.com/mosip/idp/blob/develop/idp-service/src/test/resources/mockida/mock-relying-party-id\_policy.json).&#x20;
