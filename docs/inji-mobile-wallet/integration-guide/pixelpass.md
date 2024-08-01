# PixelPass

## PixelPass

PixelPass is a node library which helps in generating QR Code for VCs with smaller data size. It can also be used for decoding the VC generated. PixelPass also has Kotlin, Swift and Java artifacts available.

### Features

* Create QR Code for given data
* Uses zlib compression and base45 encoding
* Decode QR data encoded by PixelPass

### Snapshots

Below snapshots provide the mobile platform native artifacts along with the java library:

**Kotlin**: Index of /repositories/snapshots/io/mosip/pixelpass-aar 

**Swift**: GitHub - mosip/pixelpass-ios-swift: Swift library to generate QR code from VC and decode the data 

**Java:** Index of /repositories/snapshots/io/mosip/pixelpass-jar 

**Maven repo:** [pixelpass](https://repo1.maven.org/maven2/io/mosip/pixelpass/)


### Installation

1. As a node project:
   
npm i @mosip/pixelpass

[npm](https://www.npmjs.com/package/@mosip/pixelpass)

2. To include PixelPass in your Swift project, follow the below steps:

    1.    Clone the PixelPass library locally.

    2.    Create a new Swift project.

    3.    Add package dependency: PixelPass


### APIs

Below are the APIs provided by the PixelPass library:

#### To Generate QR Data:

```

generateQRData( data, header )

    data - Data needs to be compressed and encoded

    header - Data header needs to be prepended to identify the encoded data. defaults to ""
```

The API returns a zlib compressed and base45 encoded string with header prepended if provided.

#### To Generate QR Code:



```
generateQRCode( data, ecc , header )

    data - Data needs to be compressed and encoded

    ecc - Error Correction Level for the QR generated. defaults to "L"

    header - Data header needs to be prepended to identify the encoded data. defaults to ""
```

The API returns a base64 encoded PNG image with header prepended if provided.

#### To Decode the QR Code:

```
decode(data)

    data - Data needs to be decoded and decompressed without header
```

The API returns a base45 decoded and zlib decompressed string.

### Errors / Exceptions

Shall you encounter any errors while using the APIs, please refer to the below:

1. **Cannot read properties of null (reading 'length')** - This error denotes that the string passed to encode is null.&#x20;
2. **Cannot read properties of undefined (reading 'length')** - This error denotes that the string passed to encode is undefined.&#x20;
3. **byteArrayArg is null or undefined.** - This error denotes that the string passed to encode is null or undefined.&#x20;
4. **utf8StringArg is null or undefined**. - This error denotes that the string passed to decode is null or undefined.&#x20;
5. **utf8StringArg has incorrect length**. - This error denotes that the string passed to decode is of invalid length.&#x20;
6. **Invalid character at position X**. - This error denotes that the string passed to decode is invalid with an unknown character then base45 character set. Also denotes the invalid character position.&#x20;
7. **incorrect data check** - This error denotes that the string passed to decode is invalid.

## PixelPass & Inji Mobile Integration:

The below diagram shows how Inji Mobile utilises PixelPass library.

<figure><img src="../../.gitbook/assets/inji_mobile_wallet_integration_guides_pixel_pass_1.png" alt=""><figcaption></figcaption></figure>



\
\
\


