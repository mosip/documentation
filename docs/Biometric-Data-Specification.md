# Introduction

Biometrics images for various modalities are represented and exchanged as per the below specifications.

# Image formats
## Fingerprint 
Factor | Registration | Authentication
-------|--------------|---------------- 
Image Specification	| ISO 19794-4 | ISO 19794-4 and ISO 19794-2
Image Format | JPEG2000 lossless | JPEG2000 lossless
Image Quality |	NFIQ 2 | NFIQ 2

## Iris
Factor | Registration | Authentication
-------|--------------|---------------- 
Image Specification | ISO 19794-6 | ISO 19794-6
Image Format | JPEG 2000 lossless | JPEG 2000 lossless
Image Quality | 76-100 IREXII - IQCE | 76-100 IREXII - IQCE

## Face 
Factor | Registration | Authentication
-------|--------------|---------------- 
Image Specification | ISO/IEC 19794 - 5 | ISO/IEC 19794 - 5
Image Format | JPEG 2000 lossless | JPEG 2000 lossless
Image Quality | ICAO - Full frontal image, +/- 5 degrees rotation, 24 bit RGB, white background

# XML Container

The biometric data is wrapped in [CBEFF XML](CBEFF-XML.md).
