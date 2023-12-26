# Test Report

## Testing Scope

The scope of testing revolved around verifying the compliance of the product as per the specifications published by MOSIP using the below devices: Registration devices for iris, face and fingerprint Authentication devices for the iris, face and fingerprint The compliance tool kit was tested with the below biometric specifications:

1. SBI \
   a. Registration \
   b. Authentication
2. SDK \
   a. Quality Check \
   b. 1: N Match \
   c. Extraction \
   d. Conversion

## Test Execution Statistics

### SBI Testing

The Secure Biometric Interface (SBI) is used to interface with biometric devices. The compliance tool kit was tested to ensure that the interface built by the device provider follows the specs and security rules defined in the SBI spec.

#### For Authentication Devices using MOSIP's mock SBI devices

The MOSIP’s Mock SBI has been tested for compliance with the specifications across 48 test cases. Test cases specific to quality and user interactions have been tested with real devices rather than mock.

<table data-header-hidden><thead><tr><th></th><th width="121"></th><th width="105"></th><th></th></tr></thead><tbody><tr><td><strong>Scenarios</strong></td><td><strong>Finger</strong></td><td><strong>Iris</strong></td><td><strong>Face</strong></td></tr><tr><td>Total</td><td>17</td><td>18</td><td>13</td></tr><tr><td>Passed</td><td>17</td><td>18</td><td>13</td></tr><tr><td>Pending</td><td>0</td><td>0</td><td>0</td></tr><tr><td>Failed</td><td>0</td><td>0</td><td>0</td></tr><tr><td><strong>Test Rate (%)</strong></td><td>100%</td><td>100%</td><td>100%</td></tr><tr><td><strong>Pass Rate (%)</strong></td><td>100%</td><td>100%</td><td>100%</td></tr></tbody></table>

#### For Registration Devices using MOSIP's mock SBI devices

The MOSIP’s Mock SBI has been tested for compliance with the specifications across 65 test cases. Test cases specific to quality and user interactions have been tested with real devices rather than mock.

<table data-header-hidden><thead><tr><th width="259"></th><th width="122"></th><th width="103"></th><th></th></tr></thead><tbody><tr><td><strong>Scenarios</strong></td><td><strong>Finger</strong></td><td><strong>Iris</strong></td><td><strong>Face</strong></td></tr><tr><td>Total</td><td>30</td><td>18</td><td>17</td></tr><tr><td>Passed</td><td>30</td><td>18</td><td>17</td></tr><tr><td>Pending</td><td>0</td><td>0</td><td>0</td></tr><tr><td>Failed</td><td>0</td><td>0</td><td>0</td></tr><tr><td><strong>Test Rate (%)</strong></td><td>100%</td><td>100%</td><td>100%</td></tr><tr><td><strong>Pass Rate (%)</strong></td><td>100%</td><td>100%</td><td>100%</td></tr></tbody></table>

#### For Authentication Devices using MOSIP's real devices (only finger)

The MOSIP’s real devices have been tested for compliance with the specification only for fingerprint and iris devices.

<table data-header-hidden><thead><tr><th width="259"></th><th width="128"></th><th width="102"></th><th></th></tr></thead><tbody><tr><td><strong>Scenarios</strong></td><td><strong>Finger</strong></td><td><strong>Iris</strong></td><td><strong>Face</strong></td></tr><tr><td>Total</td><td>17</td><td>18</td><td>13</td></tr><tr><td>Passed</td><td>14</td><td>1</td><td>0</td></tr><tr><td>Pending</td><td>0</td><td>0</td><td>13</td></tr><tr><td>Failed</td><td>3</td><td>17</td><td>0</td></tr><tr><td><strong>Test Rate (%)</strong></td><td>100%</td><td>100%</td><td>0%</td></tr><tr><td><strong>Pass Rate (%)</strong></td><td>82%</td><td>6%</td><td>0%</td></tr></tbody></table>

#### For Registration Devices using MOSIP's real devices

The MOSIP’s real SBI has been tested for compliance with the specifications for iris, face and fingerprint devices.

<table data-header-hidden><thead><tr><th width="261"></th><th width="125"></th><th width="110"></th><th></th></tr></thead><tbody><tr><td><strong>Scenarios</strong></td><td><strong>Finger</strong></td><td><strong>Iris</strong></td><td><strong>Face</strong></td></tr><tr><td>Total</td><td>30</td><td>18</td><td>17</td></tr><tr><td>Passed</td><td>30</td><td>18</td><td>17</td></tr><tr><td>Pending</td><td>0</td><td>0</td><td>0</td></tr><tr><td>Failed</td><td>0</td><td>0</td><td>0</td></tr><tr><td><strong>Test Rate (%)</strong></td><td>100%</td><td>100%</td><td>100%</td></tr><tr><td><strong>Pass Rate (%)</strong></td><td>100%</td><td>100%</td><td>100%</td></tr></tbody></table>

### SDK Testing

The SDK implementation has been tested to support quality checks, 1:N matches, extraction, and conversion of biometrics.

**Out of scope**: Segmentation testing

<table data-header-hidden><thead><tr><th width="176"></th><th width="156"></th><th width="158"></th><th></th></tr></thead><tbody><tr><td><strong>Scenarios</strong>.</td><td><strong>With Mock SDK</strong></td><td><strong>With Real SDK 1</strong></td><td><strong>With Real SDK 2</strong></td></tr><tr><td>Total</td><td>76</td><td>76</td><td>76</td></tr><tr><td>Passed</td><td>66</td><td>27</td><td>51</td></tr><tr><td>Pending</td><td>0</td><td>0</td><td>0</td></tr><tr><td>Failed</td><td>1</td><td>11</td><td>16</td></tr><tr><td>Not Applicable</td><td>9</td><td>28</td><td>9</td></tr><tr><td><strong>Test Rate (%)</strong></td><td>88%</td><td>50%</td><td>88%</td></tr><tr><td><strong>Pass Rate (%)</strong></td><td>87%</td><td>36%</td><td>67%</td></tr></tbody></table>

## Sonar Report

<figure><img src=".gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>
