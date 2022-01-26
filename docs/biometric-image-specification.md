# Biometric Image Specification

## Introduction
Biometrics images for various modalities are represented and exchanged as per the below specifications.

## Fingerprint
Refer ISO 19794-4:2011 Specifications.

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Image Specification | ISO 19794-4:2011 Annex B1 | ISO 19794-4:2011 Annex B2
Minimum Resolution | >= 500 native DPI. Higher densities are preferred. | >= 500 native DPI.
Minimum Active Platen Area or Capture area\* | >=1.6 x 1.5 inches for 1 to 2 fingers<br>>=3.2 x 2.0 inches for 4 fingers | >=0.5 x 0.65 inches\*
Greyscale Density | 8 bits (256 grey levels) | 8 bits (256 grey levels) 
Image Format | JPEG 2000 Lossless | JPEG 2000 Lossy or WSQ
Compression Ratio | Lossless | Up to 15:1
Quality Score | NFIQ v2.0 | NFIQ v1.0 or NFIQ v2.0
Capture Mode | Auto Capture | Auto Capture
Preview | > 3 FPS M-JPEG frames with NFIQ 2.0 score superimposed | Not Applicable 
ESD | >= 8kv | >= 8kv
EMC Compliance | FCC class A or equivalent | FCC class A or equivalent
Operating Temperature |0 to 50 &deg;C | 0 to 50 &deg;C
FTM | SBI 1.0 - Use host based security (and above) | SBI 2.0 - FTM supported security

\* MOSIP adopters may change this if needed.

## Iris
RRefer to ISO 19794-6:2011 Specifications.

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Image Specification | ISO 19794-6:2011 Annex B | ISO 19794-6:2011 Annex B	
Minimum Iris Diameter | >=210 pixels | >=150 pixels
Greyscale Density | 8 bits (256 grey levels) | 8 bits (256 grey levels)	
Spatial Resolution | >=60% @ 2Lp/mm | >= 50% @ 1Lp/mm	
Pixel Resolution | >10 pixels/mm | >10 pixels/mm	
Capture Distance | >=10CM | >=10CM	
Imaging Wavelength | Approximately 700-900 nm | Approximately 700-900 nm	
Illumination | The eye should be illuminated using infrared or any other source that could produce high-quality gray scale image | The eye should be illuminated using infrared or any other source that could produce high-quality gray scale image
Image Format | IMAGE_TYPE_VGA (K2) OR IMAGE_TYPE_CROPPED (K3) | IMAGE_TYPE_CROPPED_AND_MASKED (K7)
Compression | JPEG 2000 Lossless | JPEG 2000 Lossy
Compression Ratio | Lossless | Up to 15:1 (>= 3.5 KB)
Aspect Ratio | 1:1 | 1:1
Capture Mode | Auto Capture | Auto Capture
Scan Type | Progressive | Progressive
Preview	| >= 3 FPS M-JPEG frames with quality score superimposed | Not Applicable
EMC compliance | FCC Class A or equivalent | FCC Class A or equivalent
Operating Temperature\* | 0 to 50 &deg;C | 0 to &deg;50 C
FTM | SBI 1.0  - Use host-based security (and above) | SBI 2.0 - FTM supported security	

\* MOSIP adopters may change this if needed.

## Face
Refer ISO 19794-5:2011 Specifications.

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Image Specification	| ISO/IEC 19794-5:2011 | ISO/IEC 19794-5:2011
Camera Specification | 1080p with 90 degree FoV or above | 720p or above
Skin Tone | All | All	
Exception Image Specification | Full Frontal with FACE features, two palms next to the face, waist up photo.<br>60mm(width) X 40mm(height) | Not Applicable	
Image quality | ICAO - Full frontal image, +/- 5 degrees rotation, 24 bit RGB, white background<br>35 mm(width) X 45mm(height) | ICAO is not mandated	
Image format | JPEG 2000 Lossless | JPEG 2000 Lossy	
Compression Ratio | Lossless | Up to 15:1
EMC compliance | FCC Class A or equivalent | FCC Class A or equivalent	
Operation Temperature\*	| 0 to 50 &deg;C | 0 to 50 &deg;C
FTM | SBI 1.0 - Use host based security (and above) | SBI 2.0 - FTM supported security


Capture Time across modalities should be less than 4 seconds (time taken for providing a final capture response to the calling application, when the biometrics are well placed on the sensors)

