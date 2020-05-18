# Introduction

Biometrics images for various modalities are represented and exchanged as per the below specifications.

# Image formats

## Fingerprint 
Factor | Registration | Authentication
-------|--------------|---------------- 
Image Specification | ISO 19794-4 B.1 AFIS Normative | ISO 19794-4 B.2 Personal Verification
Image Format | JPEG 2000 lossless | JPEG 2000 lossless, WSQ (Compression upto 10:1)
Image Quality | NFIQ 2 | NFIQ 1

{% hint style="info" %}
Refer ISO 19794-4:2011 for details.
{% endhint %}

## Iris
Factor | Registration | Authentication
-------|--------------|---------------- 
Image Specification | ISO 19794-6 | ISO 19794-6
Image Format | JPEG 2000 lossless | JPEG 2000 lossless
Image Quality | ISO/IEC 29794-6 | ISO/IEC 29794-6

{% hint style="info" %}
Refer ISO 19796-6:2011 Part 6 Specifications for details.
{% endhint %}

## Face 
Factor | Registration | Authentication
-------|--------------|---------------- 
Image Specification | ISO/IEC 19794-5 | ISO/IEC 19794-5
Image Format | JPEG 2000 lossless | JPEG 2000 lossless
Image Quality | ICAO - Full frontal image, +/- 5 degrees rotation, 24 bit RGB, white background | 

{% hint style="info" %}
Refer ISO 19794-5:2011 for details.
{% endhint %}

{% hint style="info" %}
For full specifications refer to [MOSIP Device Service Specification](MOSIP-Device-Service-Specification.md).
{% endhint %}

# XML Container

The biometric data is wrapped in [CBEFF XML](CBEFF-XML.md).
