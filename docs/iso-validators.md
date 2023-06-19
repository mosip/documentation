# ISO validations performed by Compliance Toolkit (CTK)

*	SBI captures biometrics by receiving raw data from biometric devices, processing and converting it into standardized templates, and securely storing them for identification and verification purposes. 
*	In CTK, validations are performed on these biometrics to check if they follow the  defined ISO standards. 
*	**ISO – International Organization for Standardization** refers to an international standard development organization that develops standards to ensure the safety, quality and effectiveness of products and services.
* In CTK, ISO validations are performed in three modalities- Finger, Face and Iris.
*	There are two types of ISO validations.
    *	General Header
    *	Representation Header
      
*	There are many validations for each type. The tables below contain a list of these validations.
*	`ISOStandardsValidator` is a validator that has been developed for CTK. All the validations mentioned above have been done in this validator.
*	A total of 8 test cases (SBI1062 to SBI1069) have been added to CTK for ISO validation.
  
The figure below represents the testcase result of ISO validation.

<img>

The list of validations performed for each of the modalities is given below.


### Finger

Refer ISO 19794-4:2011 Specifications.

| Sl.No |	Name  |	Type | Description	| Length	| Valid values | Is this attribute mandatory? |	Image verification |
|-------|---------|------|--------------|-----------|--------------|------------------------------|--------------------|
| 1. | Format Identifier |	General Header | `FIR` – Finger Image Record | 4 bytes | 464952Hex (`F` `I` `R` 00Hex) | yes | |	
| 2. | Version number | General Header | `020` in ASCII | 4 bytes |	30323000Hex (`0` `2` `0` 00Hex) | yes |	|
| 3. | Length of record | General Header | Includes all finger/palm representations, quality blocks and certification blocks1 | 4 bytes | 57 to (232-1) | yes | |	
| 4.| Number of Finger/Palm representations | General Header | [ (14 finger positions) + (11 multiple finger positions) +  (17 palm codes) ]* 16 = 672 possible representations |	2 bytes | 1 to 672 | yes | |	
| 5. | Certification flag | General Header | Indicates the presence of any device certification blocks within the representation headers | 1 byte |	0, 1 | yes | |
| 6.| No of Distinct finger/Palm Position | General Header | Number of fingers or palms represented | 1 byte | >=1 |	yes	| |
| 7. | Representation Length | Representation Header | The representation-length field denotes the length in bytes of the representation including the representation header field. | 4 bytes| | yes | |	
| 8. | Capture date and time | Representation Header | The capture date and time field shall indicate when the capture of this representation started in Coordinated Universal Time (UTC). The capture date and time field shall consist of 9 bytes. Its value shall be encoded in the form given in ISO/IEC 19794-1. | 9 bytes | | yes | |	
| 9. | No of Quality block | Representation Header | | 1 byte | | |			
| 10. | Quality block | Representation Header | | 5x | Quality Score 1 byte Quality algorithm vendorIdentifier 2 bytes Quality algorithm Identifier 2 bytes | no | |	
| 11. |	No of Certification Blocks | Representation Header | | 1 byte | | yes | |	
| 12. | Finger/Palm Position |  Representation Header |	Unknown 0<br> Right thumb 1<br> Right index finger 2<br> Right middle finger 3<br> Right ring finger 4<br> Right little finger 5<br> Left thumb 6<br> Left index finger 7<br> Left middle finger 8<br> Left ring finger 9<br> Left little finger 10 | 1 byte | | yes | |	
| 13. | Representation No | Representation Header | | 1 byte | | yes | |	
| 14. | Image Data Length |	Representation Header | Number of bytes for the compressed/uncompressed image data | 4 bytes | 0 to (232-58) | yes |	
| 15. |	Image Data | Representation Header | | | | yes | yes |


### Face

Refer ISO 19794-6:2011 Specifications.

| Sl.No |	Name  |	Type | Description	| Length	| Valid values | Is this attribute mandatory? |	Image verification |
|-------|---------|------|--------------|-----------|--------------|------------------------------|--------------------|
| 1. | Format Identifier | General Header | Indicates Face representation data | 4 bytes | 46414300HEX (`F` `A` `C` 0HEX) | yes | |	
| 2. | Version number | General Header | `030` in ASCII | 4 bytes | 30333000HEX (`0` `3` `0` 00HEX) | yes | |	
| 3. | Length of record | General Header | Includes Face Record Header and Facial Record Data. The minimum of 68 bytes includes the smallest JPEG image | 4 bytes | 68 ≤ Length of Record ≤ 232 - 1 | yes | |
| 4. | Number of iris representations | General Header | The total number of iris representations in this record.  This shall be recorded in two bytes. A minimum of one representation is required. | 2 bytes | 1 ... 65,535 | yes | |
| 5. | Certification flag | General Header | No certification schemes are available for this part of ISO/IEC 19794 | 1 byte | 00HEX | yes | |
| 6. | Temperol Sematics | General Header | One representation is present | 2 bytes | 0000HEX | yes | |
| 7. | Representation Length | Representation Header | The representation-length field denotes the length in bytes of the representation including the representation header field. | 4 bytes | | yes | |	
| 8. | Capture date and time | Representation Header | The capture date and time field shall indicate when the capture of this representation started in Coordinated Universal Time (UTC). The capture date and time field shall consist of 9 bytes. Its value shall be encoded in the form given in ISO/IEC 19794-1. | 9 bytes | | yes | |
| 9. | No of Quality block | Representation Header | | 1 byte | | | | 			
| 10. | Quality block | Representation Header | | 5x | Quality Score 1 byte Quality algorithm vendor Identifier 2 bytes Quality algorithm Identifier 2 bytes | no | |	
| 11. | Face Image Type | Image Information |	01HEX Full Frontal | 1 byte | | no | |	
| 12. |	Image Data Type	|Image Information | 01HEX JPEG 2000 (lossy)[AUTH] 02HEX JPEG 2000  (lossless) [REG] | 1 byte | | yes | yes |
| 13. | Width | Image Information | | 2 bytes |	| yes |	yes |
| 14. | Height | Image Information | | 2 bytes | | yes | yes |
| 15. | Image Colour Space | Image Information | | 1 byte | | yes |	yes |
| 16. | Image Data Length | Image Information | | 4 bytes | 1 to 4 294 967 226 | yes | |
| 17. | Image Data | Image Information | | | | yes | yes |


### Iris

Refer ISO 19794-6:2011 Specifications.

| Sl.No |	Name  |	Type | Description	| Length	| Valid values | Is this attribute mandatory? |	Image verification |
|-------|---------|------|--------------|-----------|--------------|------------------------------|--------------------|
| 1. |  Format Identifier | General Header | The format identifier shall be recorded in four bytes. The format identifier shall consist of three characters `IIR`, standing for iris image record, followed by a zero byte as a NULL string terminator. | 4 bytes | 49495200Hex (`I` `I` `R` 00Hex) | yes | |	
| 2. |  Version number | General Header | This number indicates the second version of this part of ISO/IEC 19794 used for constructing the iris image data record and shall be placed in four bytes. This version number shall consist of three ASCII numerals followed by a zero byte as a NULL string terminator | 4 bytes | 30323000Hex (`0` `2` `0` 00Hex) | yes | |	
| 3. |  Length of record | General Header | The length (in bytes) of the entire iris image data record shall be recorded in four bytes. This count shall be the total length of the data block including the iris general header and one or more representation records. |  4 bytes | 69 to (232-1) | yes | |	
| 4. | Number of iris representations | General Header | The total number of iris representations in this record. This shall be recorded in two bytes. A minimum of one representation is required. | 2 bytes | 1 ... 65,535 | yes | |
| 5. | Certification flag | General Header | No certification schemes are available for this part of ISO/IEC 19794 | 1 byte | 00Hex | yes | |	
| 6. | Representation Length |  Representation Header |	The representation-length field denotes the length in bytes of the representation including the representation header field. |  4 bytes | | yes | |	
| 7. |  Capture date and time | Representation Header |	The capture date and time field shall indicate when the capture of this representation started in Coordinated Universal Time (UTC). The capture date and time field shall consist of 9 bytes. Its value shall be encoded in the form given in ISO/IEC 19794-1. | 9 bytes | | yes | |	
| 8. | Quality block | Representation Header | A quality record shall consist of a length field followed by zero or more quality blocks. The length field shall consist of one byte. It shall represent the number of quality blocks as an unsigned integer. Each quality block shall consist of – a quality score, – a quality algorithm vendor identifier, and – a quality algorithm identifier. A quality score should express the predicted comparison performance of a representation. A quality score shall be encoded in one byte as an unsigned integer. Allowed values are – 0 to 100 with higher values indicating better quality, – IMAGE_QUAL_FAILED = 255 (FFHex), indicating that an attempt to calculate a quality score failed. The quality algorithm vendor identifier shall identify the provider of the quality algorithm. The quality algorithm vendor identifier shall be encoded in two bytes carrying a CBEFF biometric organization identifier (registered by IBIA or other approved registration authority). A value of all zeros shall indicate that the quality algorithm vendor is unreported. The quality algorithm identifier shall identify the vendor’s quality algorithm that created the quality score. It shall be assigned by the provider of the quality algorithm or an approved registration authority. The quality algorithm identifier shall be encoded in two bytes. A value of all zeros shall indicate that the quality algorithm is unreported. | 1 to n bytes | |	yes | |	
| 9. | Representation number | RepresentationHeader | Representation sequence number | 2 Bytes | | yes | |	
| 10. | Eye label | Representation Header | These refer to the subject's own eyes. | 1 byte | |	yes | |	
| 11. |	Image type |	Representation Header |	An uncropped rectilinear iris image. A rectilinear iris image in VGA (640x480) format. A cropped, centred, iris image with (0,6R 0,2R) margins. A cropped and region-of-interest masked,  centred, iris image with (0,6R 0,2R) margins | 1 byte | IMAGE_TYPE_UNCROPPED = 1 (01Hex) IMAGE_TYPE_VGA = 2 (02Hex) IMAGE_TYPE_CROPPED = 3 (03Hex) MAGE_TYPE_CROPPED_AND_MASKED = 7 (07Hex) | yes | |	
| 12. | Image format | Representation Header | Format of image data | 1 byte | IMAGEFORMAT_MONO_RAW = 2 (02Hex)  IMAGEFORMAT_MONO_JPEG2000 = 10 (0AHex) IMAGEFORMAT_MONO_PNG = 14 (0EHex) | yes | yes |
| 13. |	Image width | Representation Header | Width in pixels | 2 bytes | > 0 | yes | yes |
| 14. | Image height | Representation Header | Height in pixels | 2 bytes | > 0 | yes | yes |
| 15. | Bit depth | Representation Header | Bit depth in bits per pixel. (Images having > 8 bpp shall be encoded using PNG or JPEG2000.) | 1 byte |	At least 8 | yes | yes |
| 16. | Image Data Length | Representation Header | Size of the image data (Representation body), in bytes | 4 bytes | 1 to 4 294 967 226 | yes | |	
| 17. |	Image Data | Representation Header | | | | yes | yes |