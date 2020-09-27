# Introduction
Biometrics images for various modalities are represented and exchanged as per the below specifications.

# Image formats

#### Fingerprint Capture
Refer ISO 19794-4:2011

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Minimum Resolution | > 500 native DPI. Bare minimum recommended. Higher densities are preferred | > 500 native DPI. Bare minimum recommended. Higher densities are preferred
FRR\*\* | < 2% FRR in respective country | < 2% FRR in respective country
FAR\*\* | 0.01% | 0.01%
DPI     | 500\* | 500
Image Specification | ISO 19794-4 B.1 AFIS Normative | ISO 19794-4 B.2 Personal Verification
ESD | >= 8kv | >= 8kv
EMC compliance | FCC class A or equivalent | FCC class A or equivalent
Operating Temperature\*\* |     0 - 50 C | -30 -to 50 C
Liveness detection\*\*\* | As per IEEE 2790 | As per IEEE 2790
Preview | > 3 FPS JPEG lossless frames with NFIQ 2 score superimposed | None
Image Format | JPEG 2000 lossless | JPEG 2000 lossless, WSQ (Compression upto 10:1)\*\*
Quality Score | NFIQ 2 | NFIQ 1
FTM | SBI 1.0 - Use host based security, SBI 2.0 - FTM supported security | SBI 2.0 - FTM supported security

{% hint style="info" %}
* \*  Sufficiency to be validated for registration.
* \*\*  MOSIP adopters can change this if needed.
* \*\*\*  MOSIP adopters to decide on the availability of this feature
{% endhint %}

#### IRIS Capture
Refer ISO 19796-6:2011 Part 6 Specifications.

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Rotation angle | Before compression, the Iris image will have to be preprocessed to calculate rotation angle. Refer section 6.3.1 of ISO 19794-6 for rotation angle calculation for rectilinear images.|
Rotation Uncertainty | Refer ISO 19794-6 |
Minimum Diameter | As per ISO 19794-6:2011 medium and higher quality images are only acceptable,. Hence for this Standard, minimum acceptable Iris diameter will be 150 pixels | Same
Margin | Same as ISO |
Color | The iris images shall be captured and stored in gray scale with pixel depth of 8 bits/pixel |
Illumination | The eye should be illuminated using infrared or any other source that could produce high quality gray scale image |
Image Format | JPEG 2000 lossless | JPEG 2000 lossless
Aspect Ratio | 1:1 |
Image Quality | ISO/IEC 29794-6 | ISO/IEC 29794-6
Operation Temperature\* | -30 C to +50 C | -30 C to +50 C
EMC compliance | FCC Class A or equivalent | FCC Class A or equivalent
Preview | > 3 FPS Jpeg lossless frames with quality score superimposed | Not Applicable
Image Specification | ISO 19794-6 | ISO 19794-6
ISO Format | K3 | K7
FTM | SBI 1.0 - Use host based security, SBI 2.0 - FTM supported security | SBI 2.0 - FTM supported security

{% hint style="info" %}
\*  MOSIP adopters to decide and finalize.
{% endhint %}

#### Face Capture
Refer ISO 19794-5:2011

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Minimum Resolution | 1080 Pixels at 2.8 mm with 110 degree view | 1080 Pixels at 2.8 mm
Skin Tone | All | All
Operation Temperature\* | -30 C to +50 C | -30 C to +50 C
EMC compliance | FCC Class A or equivalent | FCC Class A or equivalent
Image Specification | ISO/IEC 19794-5 | ISO/IEC 19794-5
Exception Image Specification | Full Frontal with FACE features, two palms next to the face, waist up photo. 6X4 mm     | NA
Image quality | ICAO - Full frontal image, +/- 5 degrees rotation, 24 bit RGB, white background, 35 mm width, 45 mm height |
Image format | JPEG 2000 lossless | JPEG 2000 lossless
FTM | SBI 1.0 - Use host based security, SBI 2.0 - FTM supported security | SBI 2.0 - FTM supported security

{% hint style="info" %}
\* MOSIP adopters to decide and finalize
{% endhint %}

We recommend that countries look at ergonomics, accessibility, ease of usage, and common availability of devices while choosing devices for use in registration and authentication scenarios.

# XML Container

The biometric data is wrapped in [CBEFF XML](CBEFF-XML.md).
