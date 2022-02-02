# Packet Manager

## Overview
Packet Manager performs the following functions:

1. Reads/writes registration packets from/to [Object Store](storage.md#object-store).
1. Performs in-memory encryption and decryption of packets. 
1. Performs security checks, checksum, file validations, ID object validations etc on the registration packet.
1. Provides packet information to other services via APIs. In case of multiple packets associated with an ID, pulls information from packets based on configured priority. (See [`packetmanager.default.priority`](https://github.com/mosip/mosip-config/blob/develop3-v3/application-default.properties)).

Packet Manager runs as a service and is also available as a library. The library is used by Registration Client and Resident Service to create packets. The Registration Processor uses the service to read packets.


## Configuration

## API
Refer [API Documentation](https://mosip.github.io/documentation/1.2.0-rc2/1.2.0-rc2.html).

## Source code 
[Github repo](https://github.com/mosip/packet-manager/tree/1.2.0-rc2)



