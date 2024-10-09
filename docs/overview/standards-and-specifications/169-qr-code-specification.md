# 169 - QR Code Specifications

## CBOR Identity Data in QR Code

**Tag**: 169 (identity-data)

**Data Item**: JSON Object

**Semantics**: Identity Data of a Person in QR-Code

**Point of Contact**: Resham Chugani ([resham@mosip.io](mailto:resham@mosip.io))

**IANA Registration**: [IANA CWT Registry](https://www.iana.org/assignments/cwt/cwt.xhtml) (Search Key: 169)

**Version:** 1.1.0

## 1. Introduction

This document specifies an updated version of the generic data structure and encoding mechanism for storing the Identity Data of a registered person using any ID platform. It also provides a transport encoding mechanism in a machine-readable optical format (QR).

## 2. Rationale

Once a person is registered in an identity system, their data serves as the foundation for identification, granting them access to social benefits and government services. The level of assurance in this identification process varies depending on the authentication methods employed. Low assurance is achieved through basic identifiers like ID numbers, demographic data, passwords, or PINs. Conversely, higher assurance levels are attained through one-time passwords (OTP) and biometrics.

Among these methods, biometric-based authentication, such as facial authentication, offers the highest level of assurance as it assures the presence of the individual. While this is effective for online systems & personal phones where verification is conducted on a server or a personal device; offline authentication presents challenges in maintaining a similarly high level of assurance. The offline authentication mechanism should work for people with no phone.

For instance, in a cross-border scenario remote areas often face significant internet connectivity issues. Even when internet access is available, server reliability may be inconsistent. In such circumstances, scanning a QR code containing the person's facial photograph and identity information, alongside assurance that the data is country-signed, provides an additional layer of security and affirmation for the countries involved.

**Please note:** The trust layers required to sync the country's key are beyond the scope of this document. We assume the app scanning the QR code already has the country's key to verify.

To tackle the challenge above, we propose a standard CBOR-based QR Code that involves embedding a low-resolution image of the person with a minimal demographic dataset within the QR code. This QR code would be digitally signed by the ID authorities (Issuer) and then printed on a physical card. Subsequently, the signed data within the QR code can be utilized for facial authentication. However, it's essential to recognize that QR codes have limitations regarding size. We suggest leveraging CBOR Web Token (CWT) with ED25519/ECC keys to generate a smaller signature and more condensed data.

Claim 169 represents a JSON Object that includes the below table as ID attributes. You can find an illustration of the ID structure contained within Claim 169, where:

## 3. Semantics

### 3.1 CBOR Map Structure Overview

All the fields here are OPTIONAL.

<table><thead><tr><th width="155">Attribute</th><th width="169">Type</th><th width="193">Attribute Name</th><th>Description</th></tr></thead><tbody><tr><td><code>1</code></td><td><code>tstr</code></td><td>ID</td><td>Unique ID to indicate the PII data</td></tr><tr><td><code>2</code></td><td><code>tstr</code></td><td>Version</td><td>Version of the ID data</td></tr><tr><td><code>3</code></td><td><code>tstr</code></td><td>Language</td><td>Language used in other attributes</td></tr><tr><td><code>4</code></td><td><code>tstr</code></td><td>Full Name</td><td>Full name of the person</td></tr><tr><td><code>5</code></td><td><code>tstr</code></td><td>First Name</td><td>First name of the person</td></tr><tr><td><code>6</code></td><td><code>tstr</code></td><td>Middle Name</td><td>Middle name of the person</td></tr><tr><td><code>7</code></td><td><code>tstr</code></td><td>Last Name</td><td>Last name of the person</td></tr><tr><td><code>8</code></td><td><code>tstr</code></td><td>Date of Birth</td><td>Date of birth in YYYYMMDD format</td></tr><tr><td><code>9</code></td><td><code>int</code></td><td>Gender</td><td>Gender with the following values <code>1</code> - Male, <code>2</code> - Female, <code>3</code> - Others</td></tr><tr><td><code>10</code></td><td><code>tstr</code></td><td>Address</td><td>Address of the person, separator character <code>\n</code></td></tr><tr><td><code>11</code></td><td><code>tstr</code></td><td>Email ID</td><td>Email id of the person</td></tr><tr><td><code>12</code></td><td><code>tstr</code></td><td>Phone Number</td><td>Contact number of the person</td></tr><tr><td><code>13</code></td><td><code>tstr</code></td><td>Nationality</td><td>Nationality of the person</td></tr><tr><td><code>14</code></td><td><code>int</code></td><td>Marital Status</td><td>Marital status - Can contain the following values <code>1</code> - Unmarried, <code>2</code> - Married, <code>3</code> - Divorced</td></tr><tr><td><code>15</code></td><td><code>tstr</code></td><td>Guardian</td><td>Name/id of the entity playing the role of a guardian, such as a mother, father, spouse, sister, legal guardian etc.</td></tr><tr><td><code>16</code></td><td><code>tstr</code></td><td>Binary Image</td><td>Binary image of the person's photograph</td></tr><tr><td><code>17</code></td><td><code>int</code></td><td>Binary Image Format</td><td>Binary image format. Can contain the following values <code>1</code> - JPEG, <code>2</code> - JPEG2, <code>3</code> - AVIF, <code>4</code> - WEBP</td></tr><tr><td><code>18</code></td><td><code>[int]</code></td><td>Best Quality Fingers</td><td>An unsigned 8-bit number encoding the hand position of the finger. It must be in the range 0-10, where 0 represents "Unknown", 1-5 represents right thumb to little finger, and 6-10 represents left thumb to little finger in sequence</td></tr><tr><td><code>19.. 49</code></td><td></td><td>Reserved</td><td>Reserved for future attributes</td></tr><tr><td><code>50.. 74</code></td><td></td><td>Reserved</td><td>Reserved for Person's Biometrics Data attributes</td></tr><tr><td><code>50</code></td><td><code>[Biometrics]</code></td><td>Right Thumb</td><td>Person's Right Thumb biometrics</td></tr><tr><td><code>51</code></td><td><code>[Biometrics]</code></td><td>Right Pointer Finger</td><td>Person's Right Pointer Finger biometrics</td></tr><tr><td><code>52</code></td><td><code>[Biometrics]</code></td><td>Right Middle Finger</td><td>Person's Right Middle Finger biometrics</td></tr><tr><td><code>53</code></td><td><code>[Biometrics]</code></td><td>Right Ring Finger</td><td>Person's Right Ring Finger biometrics</td></tr><tr><td><code>54</code></td><td><code>[Biometrics]</code></td><td>Right Little Finger</td><td>Person's Right Little Finger biometrics</td></tr><tr><td><code>55</code></td><td><code>[Biometrics]</code></td><td>Left Thumb</td><td>Person's Left Thumb biometrics</td></tr><tr><td><code>56</code></td><td><code>[Biometrics]</code></td><td>Left Pointer Finger</td><td>Person's Left Pointer Finger biometrics</td></tr><tr><td><code>57</code></td><td><code>[Biometrics]</code></td><td>Left Middle Finger</td><td>Person's Left Middle Finger biometrics</td></tr><tr><td><code>58</code></td><td><code>[Biometrics]</code></td><td>Left Ring Finger</td><td>Person's Left Ring Finger biometrics</td></tr><tr><td><code>59</code></td><td><code>[Biometrics]</code></td><td>Left Little Finger</td><td>Person's Left Little Finger biometrics</td></tr><tr><td><code>60</code></td><td><code>[Biometrics]</code></td><td>Right Iris</td><td>Person's Right Iris biometrics</td></tr><tr><td><code>61</code></td><td><code>[Biometrics]</code></td><td>Left Iris</td><td>Person's Left Iris biometrics</td></tr><tr><td><code>62</code></td><td><code>[Biometrics]</code></td><td>Face</td><td>Person's Face biometrics</td></tr><tr><td><code>63</code></td><td><code>[Biometrics]</code></td><td>Right Palm Print</td><td>Person's Right Palm Print biometrics</td></tr><tr><td><code>64</code></td><td><code>[Biometrics]</code></td><td>Left Palm Print</td><td>Person's Left Palm Print biometrics</td></tr><tr><td><code>65</code></td><td><code>[Biometrics]</code></td><td>Voice</td><td>Person's Voice biometrics</td></tr><tr><td><code>66.. 74</code></td><td></td><td>Reserved</td><td>Reserved for future for Person's Biometrics Data attributes</td></tr><tr><td><code>75.. 99</code></td><td></td><td>Reserved</td><td>Reserved for future attributes</td></tr></tbody></table>

#### Biometrics

<table><thead><tr><th width="161">Attribute</th><th width="183">Type</th><th>Attribute Name</th><th>Description</th></tr></thead><tbody><tr><td><code>0</code></td><td><code>bstr</code></td><td>Data</td><td>Biometrics binary data</td></tr><tr><td><code>1</code></td><td><code>int</code></td><td><a href="169-qr-code-specification.md#data-formats">Data format</a></td><td>Optional biometrics data format</td></tr><tr><td><code>2</code></td><td><code>int</code></td><td><a href="169-qr-code-specification.md#data-sub-formats">Data sub format</a></td><td>Optional biometrics data sub format</td></tr><tr><td><code>3</code></td><td><code>tstr</code></td><td>Data issuer</td><td>Optional biometric data issuer</td></tr></tbody></table>

#### **Data formats**

| Data format | Description |
| ----------- | ----------- |
| `0`         | Image       |
| `1`         | Template    |
| `2`         | Sound       |
| `3`         | Bio hash    |

#### **Data sub formats**

**Image**

| Subformat  | Description     |
| ---------- | --------------- |
| `0`        | PNG             |
| `1`        | JPEG            |
| `2`        | JPEG2000        |
| `3`        | AVIF            |
| `4`        | WEBP            |
| `5`        | TIFF            |
| `6`        | WSQ             |
| `100..200` | Vendor specific |

**Template**

| Subformat  | Description                      |
| ---------- | -------------------------------- |
| `0`        | Fingerprint Template ANSI 378    |
| `1`        | Fingerprint Template ISO 19794-2 |
| `2`        | Fingerprint Template NIST        |
| `100..200` | Vendor specific                  |

**Sound**

| Subformat | Description |
| --------- | ----------- |
| `0`       | WAV         |
| `1`       | MP3         |

### 3.2 CBOR Map Structure Example

```json
1: COUN # iss
6: 1665980929 # iat
8: # cnf
  3: dfd1aa976d8d4575a0fe34b96de2bfad # kid
169: # identity-data
  1: "11110000324013" # ID
  2: "1.0" # Version
  3: EN # Language
  4: Peter M Jhon # Full name
  5: Peter # First name
  6: M # Middle name
  7: Jhon # Last name
  8: "19880102" # Date of birth
  9: 1 # Gender: Male
  10: New City, METRO LINE, PA # Address
  11: peter@example.com # Email ID
  12: "+1 234-567" # Phone number
  13: US # Nationality
  14: 2 # Marital status: Married
  15: Jhon Honai # Guardian
  16: 03CBABDF83D068ACB5DE65B3CDF25E0036F2C54(...)E54D23D8EC7DC9BB9F69FD7B7B23383B64F22E25F # Binary image
  17: 2 # Binary image format: JPEG
  18: [1, 2] # Best quality fingers
  50: # Right Thumb Biometrics
    # Right Thumb image
    - 0: 03CBA(...)0378C58 # Data
      1: 0 # Image
      2: 1 # JPEG
    # Right Thumb template
    - 0: 03CBA(...)0378C58 # Data
      1: 1 # Template
      2: 100 # Vendor specific
      3: VendorA # Biometric data issuer
  51: # Right Pointer Finger Biometrics
    # Right Pointer Finger image
    - 0: 36F2C546(...)CB90378C58 # Data
      1: 1 # Image
      2: 6 # WSQ
      3: VendorA # Biometric data issuer
    # Right Pointer Finger template
    - 0: 36F2C546(...)CB90378C58 # Data
      1: 1 # Template
      2: 1 # Fingerprint Template ISO 19794-2
      3: VendorA # Biometric data issuer
  58: # Left Ring Finger Biometrics
    # Left Ring Finger image
    - 0: 36F2C546(...)CB90378C58 # Data
      1: 1 # Image
      2: 6 # WSQ
      3: VendorA # Biometric data issuer   
    # Left Ring Finger template
    - 0: 36F2C546(...)CB90378C58 # Data
      1: 1 # Template
      2: 1 # Fingerprint Template ISO 19794-2
      3: VendorA # Biometric data issuer
   60: # Right Iris Biometrics
    # Right Iris image
    - 0: 36F2C546(...)CB90378C58 # Data
      1: 1 # Image
      2: 6 # WSQ
      3: VendorX # Biometric data issuer
    # Right Iris image 
    - 0: 36F2C546(...)CB90378C58 # Data
      1: 1 # Image
      2: 6 # WSQ
      3: VendorY # Biometric data issuer
   61: # Left Iris Biometrics
    # Left Iris template
    - 0: 36F2C546(...)CB90378C58 # Data
      1: 1 # Template
      2: 100 # Vendor specific
      3: VendorX # Biometric data issuer
    # Left Iris image
    - 0: 36F2C546(...)CB90378C58 # Data
      1: 1 # Template
      2: 100 # Vendor specific
      3: VendorY # Biometric data issuer
   65: # Voice Biometrics   
    # Voice sound
    - 0: 03CBA(...)0378C58 # Data
      1: 2 # Sound
      2: 1 # MP3
    # Voice template
    - 0: 03CBA(...)0378C58 # Data
      1: 1 # Template
      2: 100 # Vendor specific
      3: VendorZ # Biometric data issuer
```



## 4. Security Considerations

TODO:

1. Current map structure is in plain text and its not the recommended way to handle privacy. Adoption of SD-JWT or equivalent can be considered.
2. CWT MUST be signed, create a COSE\_Sign/COSE\_Sign1 object using the Message as the COSE\_Sign/COSE\_Sign1 Payload; all steps specified in [RFC8152](https://www.rfc-editor.org/rfc/rfc8152) for creating a COSE\_Sign/COSE\_Sign1 object MUST be followed.
3. If the CWT is a COSE\_Encrypt/COSE\_Encrypt0 object,create a COSE\_Encrypt/COSE\_Encrypt0 using the Message as the plaintext for the COSE\_Encrypt/COSE\_Encrypt0 object; all steps specified in [RFC8152](https://www.rfc-editor.org/rfc/rfc8152) for creating a COSE\_Encrypt/COSE\_Encrypt0 object MUST be followed.
4. To verify the claims the CWT is a COSE\_Sign/COSE\_Sign1, follow the steps specified in Section 4 of [RFC8152](https://www.rfc-editor.org/rfc/rfc8152) ("Signing Objects") for validating a COSE\_Sign/COSE\_Sign1 object. Let the Message be the COSE\_Sign/COSE\_Sign1 payload. Once signature is valid we SHOULD validate the public key against a preconfigured key. In case encrypted Else, if the CWT is a COSE\_Encrypt/COSE\_Encrypt0 object, follow the steps specified in Section 5 of \[RFC8152] ("Encryption Objects") for validating a COSE\_Encrypt/COSE\_Encrypt0 object. Let the Message be the resulting plaintext.&#x20;

The security of the CWT relies upon on the protections offered by COSE. Unless the claims in a CWT are protected, an adversary can modify, add, or remove claims.

Since the claims conveyed in a CWT is used to make identity claim decisions, it is not only important to protect the CWT but also to ensure that the recipient can authenticate the party that assembled the claims and created the CWT. Without trust of the recipient in the party that created the CWT, no sensible identity verification can be made. Furthermore, the creator of the CWT needs to carefully evaluate each claim value prior to including it in the CWT so that the recipient can be assured of the validity of the information provided.

Syntactically, the signing and encryption operations for Nested CWTs may be applied in any order; however, if encryption is necessary, producers normally should sign the message and then encrypt the result (thus encrypting the signature). This prevents attacks in which the signature is stripped, leaving just an encrypted message, as well as providing privacy for the signer. Furthermore, signatures over encrypted text are not considered valid in many jurisdictions.

## 5. IANA Considerations:

IANA is requested to register the revised specifications of claim 169 in "CBOR Web Token (CWT) Claims" registry [IANA CWT Claims](https://www.iana.org/assignments/cwt/cwt.xhtml).

### 5.1 Registry Content

Claim Name: identity-data\
Claim Description: Registering the claim for storing identity data of a person, which could be Personally Identifiable Data (PII) mostly used in Foundational/National ID for cross-border interoperability.\
Claim Key: 169\
Claim Value Type(s): map\
Change Controller: MOSIP\
Specification Document(s): [Section 3](169-qr-code-specification.md#semantics), [Section 4](169-qr-code-specification.md#iana-considerations)

## 6. Acknowledgments

This work is the result of the dedicated efforts of contributors who recognize the critical importance of interoperability and a consistent QR code specification. The revised version has been shaped significantly by the input of our working group committee, comprising members from the following organizations: GetGroup, PWC and Tech 5.&#x20;

We extend our gratitude to the committee members for their invaluable time and insights throughout the evaluation phase.

### 6.1 Working Group Committee Members:

GetGroup: Aiman Tarek

PWC: Chaitanya Giri&#x20;

Tech 5: Bejoy Ak, Nelson Branco, Rahul Parthe

MOSIP: Harini Sampathkumar, Janardhan BS, Mahammed Taheer, Ramesh Narayanan, Resham Chugani, Reeba Thomas, Sanchi Singh, Sasikumar Ganesan, Sreenadh S, Swati Goel, Vishwanath V

## 7. Authors

Mahammed Taheer ([mohd.taheer@gmail.com](mailto:mohd.taheer@gmail.com))

Resham Chugani ([resham@mosip.io](mailto:resham@mosip.io))

Rounak Nayak ([rounak@ooru.io](mailto:rounak@ooru.io))

Sasikumar G ([sasi@duck.com](mailto:sasi@duck.com))

Sreenadh S ([sreeavtar@gmail.com](mailto:sreeavtar@gmail.com))

