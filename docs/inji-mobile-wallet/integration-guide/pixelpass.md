# PixelPass

## PixelPass

PixelPass is a node library which helps in generating QR Code for VCs with smaller data size. It can also be used for decoding the VC generated.

### Features

* Create QR Code for given data
* Uses zlib compression and base45 encoding
* Decode QR data encoded by PixelPass

### Installation

npm i @mosip/pixelpass

[npm](https://www.npmjs.com/package/@mosip/pixelpass)

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

1. Cannot read properties of null (reading 'length') This error denotes that the string passed to encode is null.&#x20;
2. Cannot read properties of undefined (reading 'length') - This error denotes that the string passed to encode is undefined.&#x20;
3. byteArrayArg is null or undefined. - This error denotes that the string passed to encode is null or undefined.&#x20;
4. utf8StringArg is null or undefined. - This error denotes that the string passed to decode is null or undefined.&#x20;
5. utf8StringArg has incorrect length. - This error denotes that the string passed to decode is of invalid length.&#x20;
6. Invalid character at position X. - This error denotes that the string passed to decode is invalid with an unknown character then base45 character set. Also denotes the invalid character position.&#x20;
7. incorrect data check - This error denotes that the string passed to decode is invalid.

## PixelPass & Inji Mobile Integration:

The below diagram shows how Inji Mobile utilises PixelPass library.

\
\
\


