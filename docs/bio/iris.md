## Iris
RRefer to ISO 19794-6:2011 Specifications.

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Image Specification | ISO 19794-6:2011 Annex B | ISO 19794-6:2011 Annex B	
Minimum Iris Diameter | >=210 pixels | >=150 pixels
Grey Scale Density | 8 bits (256 grey levels) | 8 bits (256 grey levels)	
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
FTM\*\* | SBI 1.0  - Use host-based security (and above) | SBI 2.0 - FTM supported security	

{% hint style="info" %}

*Capture Time across modalities should be less than 4 Seconds (time taken for providing a final capture response to the calling application, when the biometrics are well placed on the sensors)*

{% endhint %}