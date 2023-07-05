## Management Server and Management Client

### Management Server Functionalities and Interactions
The management server has the following objectives.

1. Validate the devices to ensure they're genuine devices from the respective device provider. This can be achieved using the device information and the certificates for the Foundational Trust Module.
1. Register the genuine device with the MOSIP device server.
1. Manage or sync time between the end device and the server. The time to be synced should be the only trusted time accepted by the device.
1. The ability to issue commands to the end device for
    1. De-registration of the device (Device Keys)
    1. Collect device information to maintain, manage, support, and upgrade a device remotely.
1. A central repository of all the approved devices from the device provider.
1. Safe storage of keys using HSM FIPS 140-2 Level 3. These keys are used to issue the device certificate upon registration.
The Management Server is created and hosted by the device provider outside of MOSIP software. The communication protocols between the MDS and the Management Server can be decided by the respective device provider. Such communication should be restricted to the above-specified interactions only. No transactional information should be sent to this server.
1. The server should have the ability to push updates from the server to the client devices.

{% hint style="info" %}
*As there is no adopter-specific information being exchanged at the management server or at the FTM provisioning server, there are no mandates from MOSIP where these are located globally. However, the adopter is recommended to have audit and contractual mechanisms to validate the compliance of these components at any point in time.*
{% endhint %}

### Management Client
The management client is the interface that connects the device with the respective management server. It's important that the communication between the management server and its clients is designed with scalability, robustness, performance and security. The management server may add many more capabilities than what is described here, But the basic security objectives should be met at all times irrespective of the offerings.

1. For better and more efficient handling of devices at large volumes, we expect the devices to auto-register to the Management server.
1. All communication to the server and from the server should follow the below properties.
    1. All communication is digitally signed with the approved algorithms
    1. All communication to the server is encrypted using one of the approved public key cryptography (HTTPS – TLS1.2/1.3 is required with one of the [approved algorithms](#cryptography).
    1. All request has timestamps attached in ISO format to the milliseconds inside the signature.
    1. All communication back and forth should have the signed digital id as one of the attributes.
1. It's expected that auto registration has an absolute way to identify and validate the devices.
1. The management client should be able to detect the devices in a plug-and-play model.
1. All key rotations should be triggered from the server.
1. Should have the ability to detect if it's speaking to the right management server.
1. All upgrades should be verifiable and the client should have the ability to verify software upgrades.
1. Should not allow any downgrade of software.
1. Should not expose any API to capture biometrics. The management server should have no ability to trigger a capture request.
1. No logging of biometric data is allowed. (Both in the encrypted and unencrypted format)

---
### Certificates
The MOSIP server would provide the following retrieve encryption certificate API which is white-listed to the management servers of the device provider or their partners.

#### Retrieve Encryption Certificate Request URL
`POST https://{base_url}/v1/masterdata/device/encryptioncertficates`

**Version:** v1

#### Retrieve Encryption Certificate Request
```
{
  "id": "io.mosip.auth.country.certificate",
  "version": "certificate server API version as defined above",
  "request": {
    "data": {
      "env":  "target environment",
      "domainUri": "uri of the auth server"
    }
  },
  "requesttime": "current timestamp in ISO format"
}
```

The request is sent in a JWT format. So the final request will look like this:
```
"request": {
  "data": "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)"
}
```

#### Accepted Values for Retrieve Certificate Request
```
env - Allowed values are Staging| Developer| Pre-Production | Production
domainUri - unique uri per auth providers. This can be used to federate across multiple providers or countries or unions.
```

#### Encryption Certificate Response
```
{
  "id": "io.mosip.auth.country.certificate",
  "version": "certificate server API version as defined above",
  "responsetime": "Current time in ISO format",
  "response": [
    {
      "certificate": "base64encoded certificate as x509 V3 format"
    }
  ]
}
```

The entire response is sent in a JWT format. So the final response will look like this:
```
"response" : "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)"
```

### Compliance Level
API     | Compatible
----|-----------
Device Discovery | L0/L1
Device Info | L0/L1
Capture | L1
Registration Capture | L0/L1

