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

|Sl.No|	Name  |	Type| Description	| Length	|Valid values	Is this attribute mandatory?	Image verification
1.	Format Identifier	General Header	“FIR” – Finger Image Record	4 bytes	464952Hex (‘F’ ‘I’ ‘R’ 00Hex)	YES	
2.	Version number	General Header	“020” in ASCII	4 bytes	30323000Hex (‘0’ ’2’ ’0’ 00Hex)	YES	
3.	Length of record	General Header	Includes all finger/palm representations, 
quality blocks and certification blocks1	4 bytes	57 to (232-1)	YES	
4.	Number of Finger/Palm representations	General Header	[ (14 finger positions) + 
(11 multiple finger positions) +
 (17 palm codes) ]* 16 = 672 possible representations	2 bytes	1 to 672	YES	
5.	Certification flag	General Header	Indicates the presence of any device certification blocks within the representation headers	1 byte	0, 1	YES	
6.	No of Distinct finger/Palm Position	General Header	Number of fingers or palms represented	1 byte	>=1	YES	
7.	Representation Length	Representation
Header	The representation-length field denotes the length in bytes of the representation including the representation header field.	4 bytes		YES	
8.	Capture date and time	Representation
Header	The capture date and time field shall indicate 
when the capture of this representation 
started in Coordinated Universal Time 
(UTC). The capture date and time field shall 
consist of 9 bytes. Its value shall be encoded 
in the form given in ISO/IEC 19794-1.	9 bytes		YES	
9.	No of Quality block	Representation
Header		1 byte			
10.	Quality block	Representation
Header		5x	Quality Score 1 byte 
Quality 
algorithm 
vendor 
Identifier 
2 bytes
Quality 
algorithm 
Identifier 
2 bytes	NO	
11.	No of Certification Blocks	Representation
Header		1 byte		YES	
12.	Finger/Palm Position	Representation
Header	Unknown 0 
Right thumb 1 
Right index finger 2 
Right middle finger 3 
Right ring finger 4 
Right little finger 5 
Left thumb 6 
Left index finger 7 
Left middle finger 8 
Left ring finger 9 
Left little finger 10	1 byte		YES	
13.	Representation No	Representation
Header		1 byte		YES	
14.	Image Data Length	Representation
Header	Number of bytes for the compressed/uncompressed image data	4 bytes	0 to (232-58)	YES	
15.	Image Data	Representation
Header				YES	YES

