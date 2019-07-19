# Approach for Generate QR Code Service

**Background**
- Exposing the REST API to generate QR code based on pre-registration data.

The target users are -
   - Pre-Registration UI

The key requirements -

-   Create the REST API to generate QR code to the pre-registration data. which internally call the kernel qr code generate API.

The key non-functional requirements are

-   Log the each state while generate QR code to the pre-registration data:

-   Exception :
    -   Any exception occurred during generating QR code, the same will be reported to the user with the user understandable exception.

**Solution**

** Generate QR Code:**

- Create a REST API as '/generateQRCode' with POST method, which accept the pre-registration data in string format.

- Internally call an KERNEL API to generate QR code which return bytearray. If it generate sucessfully send the response otherwise throw an respetive exception.

**Class Diagram**
![pre-registration generateQRCode](_images/_class_diagram/pre-registration-generateQRCode.png)
**Sequence Diagram**
![pre-registration generateQRCode](_images/_sequence_diagram/QRcodeGenerate-generate.png)

**Error Code** 
  Code   |       Type  | Message|
-----|----------|-------------|
PRG_ACK-006 |  Error   |  QRCODE_FAILED_TO_GENERATE.

  

**Dependency Modules**

Component Name | Module Name | Description | 
-----|----------|-------------|
QRGenerator | Kernel | To generate an QR code.
Exception Manager  |  Kernel     |       To prepare the user defined exception and render to the user.
Log        |          Kernel         |   To log the process.

**User Story References**

**User Story No.** |  **Reference Link** |
-----|----------|
**MOS-13142**      |     <https://mosipid.atlassian.net/browse/MOS-13142>
**MOS-14510**      |      <https://mosipid.atlassian.net/browse/MOS-14510>
