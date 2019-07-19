Technical Design for the Network Connectivity and Disk Space checker

Functional Requirements
=======================

The Registration client application should verify the network
connectivity for all the external calls before proceeding. This will
help the system to identify whether the application is offline or
online. This will be called as the initial checker before communicate to
the external systems.

The Disk space checker will verify the configurable disk space
availability in the local system to store the packet of individual
registration details.

The target users are

-   Client application, which will use to verify the network
    connectivity to communicate any external API communication.

-   Client application, which will use to verify the minimum configured
    disk space to save the registration information of the individual
    known as packet.

-   

The key non-functional requirements are

-   Timeout: Should verify the network connectivity with the stipulated
    time which is configured as timeout for the request.

Technical Approach
==================

The key solution considerations are -

-   Create ***RegistrationAppHealthCheckUtil*** for below operation:

    -   Network connectivity checker

    -   Disk Space checker

-   This should be a singleton class and the operation methods should be
    static.

-   Provide API.

-   This class loads the required configuration from property file and
    validate against it.

-   Handle exceptions in using custom Exception handler and provide
    proper response alert to the end user \[which is going to use the
    registration client\].

> Apply the below common criteria

-   Audit

-   Log

-   Java Documentation

-   Junit

**Configuration:**

  **Property Key and Value**             **Purpose of the property**
  -------------------------------------- -----------------------------
  DISK\_SPACE=2GB                        
  ONLINE\_CONNECT\_URL=https://\<otp\>   
  ONLINE\_CONNECT\_URL\_TIMEOUT=10sec    
  ONLINE\_CONNECT\_URL\_JKS=\<\>         

Class Diagram:

<https://github.com/mosip/mosip/blob/DEV/design/registration/_images/_class_diagram/registration-networkconnectivity-classDiagram.png>

Sequence Diagram:

**NA**

1.  This should be call as an initial call for all the external calls.
