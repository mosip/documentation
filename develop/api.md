# API

This page is the entry point for eSignet's full API surface — every endpoint eSignet exposes, with exact request and response schemas, parameters, and status codes. If you're looking for a conceptual walkthrough of connecting a relying party instead, start with Development and Integration with eSignet; come back here once you need the precise contract for a specific call.

### OpenAPI Specification

The authoritative, machine-readable definition of every endpoint eSignet exposes — request and response schemas, required parameters, authentication requirements, and error responses — maintained directly in the eSignet repository alongside the code it describes. Refer to it whenever you need the exact contract for a specific endpoint.

[eSignet OpenAPI Specification](https://github.com/mosip/esignet/blob/master/docs/esignet-openapi.yaml)

### Postman Collection

A ready-to-import Postman collection covering eSignet's API surface, useful for exploring endpoints interactively or trying calls against a running instance without writing any client code first.

[eSignet Postman Collection](https://github.com/mosip/esignet/tree/master/postman-collection)

{% hint style="info" %}
**Note:** Both resources are versioned alongside the eSignet codebase. Use the version of each that matches the eSignet release you're integrating against.
{% endhint %}





