# Local Deployment

This document details the steps for running eSignet locally on your system for local development and integration.

For the local deployment, eSignet is integrated with the [mock identity system](https://github.com/mosip/esignet-mock-services/tree/master/mock-identity-system) using eSignet plugins specifically developed to connect with the mock identity system.

We have a [docker-compose](https://github.com/mosip/esignet/tree/master/docker-compose) setup to start eSignet and its dependent services. Kindly refer to the [readme](https://github.com/mosip/esignet/blob/master/docker-compose/README.md) file to know the steps to run the docker-compose in detail.

### API Documentation <a href="#api-documentation" id="api-documentation"></a>

To know about the query parameters that are required to test the OIDC flow, refer to our stoplight [API documentation](https://mosip.stoplight.io/docs/identity-provider/branches/1.5.0/7oz4lmhu3pf6b-e-signet).

### Postman Collection <a href="#postman-collection" id="postman-collection"></a>

We also have Postman scripts available under the [postman-collections](https://github.com/mosip/esignet/tree/master/postman-collection) folder in the eSignet GitHub repository.
