# Overview

Kernel is on which MOSIP services are built. Kernel is a platform to build higher-level services as well as a secure sandbox within which the higher-level service functions. Kernel provides a bedrock to build and run the services by providing several significant necessary technical functions so that individual services are concerned with specific business functions. 

Kernel is not a  distinct module but a bunch of services and libraries that are shared across different modules. 

# Components

Refer to [commons repo/kernel](https://github.com/mosip/commons/tree/master/kernel) for all components of Kernel.

# Detailed functionality

Kernel has many services and functions.  Details of some of them are mentioned below:
* [Common Services Functionality](Common-Services-Functionality.md)
* [UIN & VID Generation Service](UIN-and-VID-Generation-Service-Functionality.md)
* [Data Services Functionality](Data-Services-Functionality.md)
* [Master Data Services Functionality](Master-Data-Services-Functionality.md)
* [Audit Manager Functionality](Audit-Manager-Functionality.md)
* [Authentication and Authorization Functionality](Authentication-and-Authorization-Functionality.md)

# Logical view

![](_images/kernel/kernel_logical_diagram.jpg)

# Services and libraries

Details of all services and libraries along with code, design are availabe in [commons repo/kernel](https://github.com/mosip/commons/tree/master/kernel).

# Build and deploy

Refer to build and deploy instructions in [commons repo/kernel](https://github.com/mosip/commons/tree/master/kernel).

# APIs

[Kernel APIs](Kernel-APIs.md)
