# 169 - QR Code Specifications

### CBOR Identity Data in QR Code

**Tag**: 169 (identity-data)

**Data Item**: JSON Object

**Semantics**: Identity Data of a Person in QR-Code

**Point of Contact**: Resham Chugani ([resham@mosip.io](mailto:resham@mosip.io))

1. ## Introduction

This document specifies a generic data structure and encoding mechanism for storing the Identity Data of a registered person using any ID platform. It also provides a transport encoding mechanism in a machine-readable optical format (QR).

2. ## Rationale

Once a person is registered in an identity system, their data serves as the foundation for identification, granting them access to social benefits and government services. The level of assurance in this identification process varies depending on the authentication methods employed. Low assurance is achieved through basic identifiers like ID numbers, demographic data, passwords, or PINs. Conversely, higher assurance levels are attained through one-time passwords (OTP) and biometrics.

Among these methods, biometric-based authentication, such as facial authentication, offers the highest level of assurance as it assures the presence of the individual. While this is effective for online systems & personal phones where verification is conducted on a server or a personal device; offline authentication presents challenges in maintaining a similarly high level of assurance. The offline authentication mechanism should work for people with no phone.

For instance, in a cross-border scenario remote areas often face significant internet connectivity issues. Even when internet access is available, server reliability may be inconsistent. In such circumstances, scanning a QR code containing the person's facial photograph and identity information, alongside assurance that the data is country-signed, provides an additional layer of security and affirmation for the countries involved.

**Please note:** The trust layers required to sync the country's key are beyond the scope of this document. We assume the app scanning the QR code already has the country's key to verify.

To tackle the challenge above, we propose a standard CBOR-based QR Code that involves embedding a low-resolution image of the person with a minimal demographic dataset within the QR code. This QR code would be digitally signed by the ID authorities (Issuer) and then printed on a physical card. Subsequently, the signed data within the QR code can be utilized for facial authentication. However, it's essential to recognize that QR codes have limitations regarding size. We suggest leveraging CBOR Web Token (CWT) with ED25519/ECC keys to generate a smaller signature and more condensed data.

3. ## Semantics

Claim 169 represents a JSON Object that includes the below table as ID attributes. You can find an illustration of the ID structure contained within Claim 169, as stated below:



<table><thead><tr><th width="136">Attribute #</th><th width="105">Type</th><th width="193">Attribute Name</th><th>Description</th></tr></thead><tbody><tr><td>1</td><td>tstr</td><td>ID</td><td>Unique ID to indicate the PII data</td></tr><tr><td>2</td><td>tstr</td><td>Version</td><td>Version of the ID data</td></tr><tr><td>3</td><td>tstr</td><td>Language</td><td>Language used in other attributes</td></tr><tr><td>4</td><td>tstr</td><td>Full Name</td><td>Full name of the person</td></tr><tr><td>5</td><td>tstr</td><td>First Name</td><td>First name of the person</td></tr><tr><td>6</td><td>tstr</td><td>Middle Name</td><td>Middle name of the person</td></tr><tr><td>7</td><td>tstr</td><td>Last Name</td><td>Last name of the person</td></tr><tr><td>8</td><td>tstr</td><td>Date of Birth</td><td>Date of birth in YYYYMMDD format</td></tr><tr><td>9</td><td>tstr</td><td>Gender</td><td>Gender with the following values: 1 - Male, 2 - Female, 3 - Others</td></tr><tr><td>10</td><td>tstr</td><td>Address</td><td>Address of the person - Separator character \n</td></tr><tr><td>11</td><td>tstr</td><td>Email ID</td><td>Email id of the person</td></tr><tr><td>12</td><td>tstr</td><td>Phone Number</td><td>Contact number of the person</td></tr><tr><td>13</td><td>tstr</td><td>Nationality</td><td>Nationality of the person</td></tr><tr><td>14</td><td>int</td><td>Marital Status</td><td>Marital status - Can contain the following values: 1 - Unmarried, 2 - Married, 3 - Divorced</td></tr><tr><td>15</td><td>tstr</td><td>Guardian</td><td>Name/id of the entity playing the role of a guardian, such as a mother, father, spouse, sister, legal guardian etc.</td></tr><tr><td>16</td><td>tstr</td><td>Binary Image</td><td>Binary image of the person's photograph</td></tr><tr><td>17</td><td>int</td><td>Binary Image Format</td><td>Binary image format. Can contain the following values 1 - JPEG, 2 - JPEG2, 3 - AVIF, 4- WEBP</td></tr><tr><td>18</td><td>[int]</td><td>Best Quality Fingers</td><td>An unsigned 8-bit number encoding the hand position of the finger. It must be in the range 0-10, where 0 represents "Unknown", 1-5 represents right thumb to little finger, and 6-10 represents left thumb to little finger in sequence</td></tr><tr><td>19.. 99</td><td>tstr</td><td>Reserved</td><td>Reserved for future attributes</td></tr></tbody></table>

### 3.1 CBOR Map Structure Overview

Note: All the fields here are optional.

### 3.2 CBOR Map Structure Example

4. CBOR Identity Data in QR-Code Claims Registration

### 4.1 Registry Contents

Claim Name: identity-data

Claim Description: Registering the claim for storing identity data of a person, which could be personally identifiable data (PII) mostly used in Foundational/National ID for cross-border interoperability.

Claim Key: 169

Claim Value Type(s): map

Change Controller: MOSIP

Specification Document(s): [Section 1](https://github.com/mosip/open-spec/tree/main/claim-169#1introduction)

## References

\[1] C. Bormann, and P. Hoffman. "Concise Binary Object Representation (CBOR)". [RFC 7049](https://tools.ietf.org/html/rfc7049), October 2013.

\[2] Mike Jones, Hannes Tschofenig, Ludwig Seitz "CBOR Web Token (CWT)". [RFC 8392](https://www.iana.org/go/rfc8392), March 2018.

## Author(s)

Mahammed Taheer ([mohd.taheer@gmail.com](mailto:mohd.taheer@gmail.com))

Resham Chugani ([resham@mosip.io](mailto:resham@mosip.io))

Rounak Nayak ([rounak@ooru.io](mailto:rounak@ooru.io))

Sasikumar G ([sasi@duck.com](mailto:sasi@duck.com))

Sreenadh S ([sreeavtar@gmail.com](mailto:sreeavtar@gmail.com))
