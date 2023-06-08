# Secure Biometric Interface (SBI)

## Overview

**Secure Biometric Interface (SBI)**, previously called **MOSIP Device Service (MDS)** specification establishes standards/protocols that are necessary for a biometric device to be used in MOSIP. The SBI specification is primarily intended for biometric device manufactures, developers and designers to build MOSIP compliant devices. All devices that collect biometric data should operate within the specification of this document.

## SBI Service

SBI service is a software module running on a host that exposes the SBI interface to the host application like a registration client or authentication app. The service must run on any of the ports in the range 4501-4600. The host system could be any operating system - Windows, Android or IOS.

## SBI request/response specification

The following communication interfaces are defined:

1. Device Discovery
2. Device Info
3. Auth Capture
4. Registration Capture
5. Stream

