# Overview
The Packet Manager is a library in MOSIP that is used to read the packet sent by registration client from the object store (HDFS / CEPH / S3, etc). The existing interface is being replaced with a new set of methods to facilitate abstraction of file format and packet format changes.

## Facade Layer
The packet manager follows a facade design pattern hence we have a facade layer. This serves as a front-facing interface which calls the correct implementation of packet reader or writer based on the source and process.

The facade also performs role validation when field is read from or written into a packet. In MOSIP's rest APIs, we perform role validation using a JWT token provided by the authentication manager after successful authentication. In Facade, we provide an extra layer of validation even if a library call is made to the packet manager we perform authentication based on role. 

We have various types of roles in Packet Manager for various operations, like:
* DATA_READ - to read id attributes from a packet
* BIOMETRIC_READ - to read biometrics data from a packet
* METADATA_READ - to read metadata from a packet
* DOCUMENT_READ - to read documents from a packet

The facade also performs caching in packet manager. When a request is made in packet manager to fetch the data using cache, the facade tries fetching the data from cache (if data is not available in cache it fetches using the packet reader and stores the data in cache for future reads).

## Packet Reader
The packet reader interface is used to read various types of data from packet's that are created using the packet writer interface. In order to read data from packets, the reader interface needs basic details such as, 
* Packet ID -  Name of the Packet (ex. RID)
* Process of the Packet - Registration process (ex. NEW, LOST, UPDATE or RES_UPDATE)
* Source of Packet Creation - Source which created the packet (ex. REGISTRATION_CLIENT or RESIDENT_SERVICE)

The packet reader interface providers APIs to retrieve the below information from a packet,
* Audit Trails
* Biometrics
* Documents
* Meta Information
* ID attributes

The packet manager also provides an interface to validate the packet.

## Packet Writer


## Packet Keeper