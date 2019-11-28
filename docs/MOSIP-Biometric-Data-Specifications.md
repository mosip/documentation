Multi modal biometrics (Fingerprint, Iris, Face...) will be a key component in MOSIP to identify and provide a unique identity to an Individual. The page details out the specifications for Biometrics data during data acquisition and verification.

- MOSIP will use CBEFF ISO 19795 - 1 format to store and transfer biometrics data
- MOSIP will use XML data format of CBEFF to store the biometrics data
- MOSIP will use OASIS patron format ISO/IEC JTC 1 SC 37 – biometrics , 
  Patron identified – 257, patron format identifier 11 (Please refer to the [**link**](//ibia.org/cbeff/iso/bir-header-identifiers) for details)

- MOSIP will use OASIS Binary Data Block Format Identifiers for Format Type ISO/IEC JTC 1 SC 37-biometrics, Patron identified -257 , BDB patron format identifier such as 7-finger image, 8-face image and 9-iris image (Please refer to the [**link**](//ibia.org/cbeff/iso/bdb-format-identifiers) for details)
- All the biometrics data captured for an Individual is stored in a single XML file
- The biometrics data itself inside the CBEFF file will be in the respective ISO format encoded as base64 binary
- MOSIP has an util to create, update, search and validate cbeff xml data.
	Please refer the [**link**](//github.com/mosip/mosip-platform-mt/tree/master/kernel/kernel-cbeffutil-api) for details

# CBEFF XML
Please refer to the [**link**](//docs.oasis-open.org/bioserv/BIAS/v2.0/csprd01/schemas/cbeff_ed2.xsd) for the XML schema of CBEFF XML format.
Below is a sample of CBEFF XML for all fingers, iris and face.

```
<?xml version="1.0" encoding="UTF-8"?>
<BIR xmlns="http://standards.iso.org/iso-iec/19785/-3/ed-2/">
   <BIRInfo>
      <Integrity>false</Integrity>
   </BIRInfo>
   <!-- right index finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.209Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right IndexFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right middle finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right MiddleFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right ring finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right RingFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right little finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right LittleFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left index finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left IndexFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left middle finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left MiddleFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left ring finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left RingFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left little finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left LittleFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right thumb finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right Thumb</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left thumb finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left Thumb</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- face -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Face</Type>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right iris -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Iris</Type>
         <Subtype>Right</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left iris -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>257</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Iris</Type>
         <Subtype>Left</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
</BIR>
```
# Data standards for Registration

## Finger Print

### Finger Print Image Record (FIR)
 * Image specification - ISO/IEC 19794 - 4 
 * File format - ???
 * Number of Fingers - maximum 10; minimum - 1
 * Format - JPEG2000 (lossless)
 * Quality - NIST Fingerprint Quality (NFIQ) value of 1, 2 and 3 is acceptable
 * Transmission format - JPEG2000
 * Storage - JPEG2000 or PNG

### Finger Print Minutiae Record (FMR)
Only FIR is captured during registration

## IRIS
MOSIP will use Iris images only for registration

### IRIS Image Record (IIR)
 * Image specification - ISO/IEC 19794 - 6
 * File format - ???
 * Number of eyes - 2
 * Format - JPEG2000 (lossless) 
 * Transmission format - JPEG2000
 * Storage - JPEG2000 or PNG

## Face
MOSIP will use face image for registration

### Face Image Data (FID)
 * Image specification - ISO/IEC 19794 - 5
 * Image details - Full frontal image, +/- 5 degrees rotation, 24 bit RGB, white background, 35 mm width, 45 mm height
 * Format - JPEG2000 or PNG (lossless) 
 * Transmission format - JPEG2000
 * Storage - JPEG2000 or PNG

# Data standards for Authentication
## Finger Print
Only minutiae based authentication is available in version 1

### Finger Print Minutiae Record (FMR)
 * Minutiae specification - ISO/IEC 19794 - 2
 * Record format - ???
 * Number of fingers - 1 or 2
 * Quality - NIST Fingerprint Quality (NFIQ) value of 1, 2 and 3 is acceptable
 * Transmission format - minutiae
 * Storage - minutiae

## IRIS
MOSIP will use Iris images only authentication

### IRIS Image Record (IIR)
 * Image specification - ISO/IEC 19794 - 6
 * Record format - ???
 * Number of eyes - 1 or 2
 * Transmission format - JPEG2000 (lossless)
 * Storage - JPEG2000 or PNG

## Face
Face authentication will come in a future release of MOSIP