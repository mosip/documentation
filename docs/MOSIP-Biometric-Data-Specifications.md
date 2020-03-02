Multi modal biometrics (Fingerprint, Iris, Face...) is key component in MOSIP to identify and provide a unique identity to an individual. The page details out the specifications for Biometrics data during data acquisition and verification.

MOSIP uses ISO specified formats to represent the biometric data, while CBEFF XML is used as a container to store and exchange multiple biometric data. All the biometrics data captured for an individual is stored in a single XML file. The ISO binary data withing XML is base64 encoded.
	
## CBEFF
* Standards:
  * ISO 19785-3
  * [OASIS patron format ISO/IEC JTC 1 SC 37 - biometrics](//ibia.org/cbeff/iso/bir-header-identifiers), patron identifier 257, patron format identifier 11
  * [OASIS Binary Data Block Format Identifiers](//ibia.org/cbeff/iso/bdb-format-identifiers) for Format Type ISO/IEC JTC 1 SC 37-biometrics, patron identifier 257, BDB patron format identifier 7 for finger image, 8 for face image and 9 for iris image.
* [Schema](//docs.oasis-open.org/bioserv/BIAS/v2.0/csprd01/schemas/cbeff_ed2.xsd) 
* [[CBEFF XML Sample|CBEFF XML Sample]] 
* MOSIP's [CBEFF Utility](//github.com/mosip/commons/tree/master/kernel/kernel-cbeffutil-api) to create, update, search and validate CBEFF XML data.

## Data standards for Registration

### Fingerprint
Fingerprint Image Record (FIR):
 * Image specification: ISO/IEC 19794-4 
 * Number of Fingers: maximum 10, minimum 1
 * Format: JPEG2000 (lossless)
 * Quality: NIST Fingerprint Quality (NFIQ) value of 1, 2 and 3 is acceptable
 * Transmission format: JPEG2000
 * Storage: JPEG2000 or PNG

### IRIS
MOSIP will use Iris images only for registration

IRIS Image Record (IIR):
 * Image specification: ISO/IEC 19794-6
 * Number of eyes: 2
 * Format: JPEG2000 (lossless) 
 * Transmission format: JPEG2000
 * Storage: JPEG2000 or PNG

### Face
MOSIP will use face image for registration

Face Image Data (FID):
 * Image specification: ISO/IEC 19794-5
 * Image details: Full frontal image, +/- 5 degrees rotation, 24 bit RGB, white background, 35 mm width, 45 mm height
 * Format: JPEG2000 or PNG (lossless) 
 * Transmission format: JPEG2000
 * Storage: JPEG2000 or PNG

## Data standards for Authentication
### Fingerprint
Minutiae based authentication  
   
Fingerprint Minutiae Record (FMR):
 * Minutiae specification: ISO/IEC 19794-2
 * Number of fingers: 1 or 2
 * Quality: NIST Fingerprint Quality (NFIQ) value of 1, 2 and 3 is acceptable
 * Transmission format: minutiae
 * Storage: minutiae

### IRIS
Iris image based authentication

IRIS Image Record (IIR):
 * Image specification: ISO/IEC 19794-6
 * Number of eyes: 1 or 2
 * Transmission format: JPEG2000 (lossless)
 * Storage: JPEG2000 or PNG

### Face
Face authentication - future release of MOSIP.

