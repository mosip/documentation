# MOSIP Modules Deployment

Below is the sequence of installation of MOSIP modules and the sequence must be followed to resolve all interdependencies.

1. [Config Server Secrets](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/conf-secrets/README.md)
2. [Config Server](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/config-server/README.md)
3. [Artifactory](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/artifactory/README.md)
4. [Key Manager](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/keymanager/README.md)
5. [WebSub](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/websub/README.md)
6. [Mock SMTP](https://github.com/mosip/mosip-infra/blob/develop/deployment/v3/mosip/mock-smtp/README.md)
7. [Kernel](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/kernel/README.md)
8. [Masterdata-loader]()
9. [Biosdk server](https://github.com/mosip/mosip-infra/tree/1.2.0.1/deployment/v3/mosip/biosdk)
10. [Packet Manager](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/packetmanager/README.md)
11. [Datashare](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/datashare/README.md)
12. [Pre-registration](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/prereg/README.md)
13. [ID Repository](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/idrepo/README.md)
14. [Partner Management](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/pms/README.md)
15. [Mock ABIS](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/mock-abis/README.md)
16. [Mock MV](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/mock-mv/README.md)
17. [Registration Processor](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/regproc/README.md)
18. [Admin](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/admin/README.md)
19. [ID Authentication](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/ida/README.md)
20. [Print](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/print/README.md)
21. [Partner Onboarder](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/partner-onboarder/README.md)
22. [MOSIP File Server](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/mosip-file-server/README.md)
23. [Registration Client](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/regclient/README.md)
24. [Resident Services](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/v3/mosip/resident/README.md)

## Installation

* Conf secrets

```
cd $INFRA_ROOT/deployment/v3/mosip/conf-secrets
./install.sh
```

* Config Server

```
cd $INFRA_ROOT/deployment/v3/mosip/config-server
./install.sh
```

* Artifactory

```
cd $INFRA_ROOT/deployment/v3/mosip/artifactory
./install.sh
```

* Keymanager

```
cd $INFRA_ROOT/deployment/v3/mosip/keymanager
./install.sh
```

* WebSub

```
cd $INFRA_ROOT/deployment/v3/mosip/websub
./install.sh
```

* Mock-SMTP
```
cd $INFRA_ROOT/deployment/v3/mosip/mock-smtp
./install.sh
```

* Kernel

```
cd $INFRA_ROOT/deployment/v3/mosip/kernel
./install.sh
```

* Masterdata-loader

```
cd $INFRA_ROOT/deployment/v3/mosip/masterdata-loader
./install.sh
```

* Mock-biosdk

```
cd $INFRA_ROOT/deployment/v3/mosip/biosdk
./install.sh
```

* Packetmanager

```
cd $INFRA_ROOT/deployment/v3/mosip/packetmanager
./install.sh
```

* Datashare

```
cd $INFRA_ROOT/deployment/v3/mosip/datashare
./install.sh
```

* Pre-reg

```
cd $INFRA_ROOT/deployment/v3/mosip/prereg
./install.sh
```

* Idrepo

```
cd $INFRA_ROOT/deployment/v3/mosip/idrepo
./install.sh
```

* Partner Management Services

```
cd $INFRA_ROOT/deployment/v3/mosip/pms
./install.sh
```

* Mock ABIS

```
cd $INFRA_ROOT/deployment/v3/mosip/mock-abis
./install.sh
```

* Mock-mv

```
cd $INFRA_ROOT/deployment/v3/mosip/mock-mv
./install.sh
```

* Registration Processor

```
cd $INFRA_ROOT/deployment/v3/mosip/regproc
./install.sh
```

* Admin

```
cd $INFRA_ROOT/deployment/v3/mosip/admin
./install.sh
```

* ID Authentication

```
cd $INFRA_ROOT/deployment/v3/mosip/ida
./install.sh
```

* Print

```
cd $INFRA_ROOT/deployment/v3/mosip/print
./install.sh
```

* Partner Onboarder

```
cd $INFRA_ROOT/deployment/v3/mosip/partner-onboarder
./install.sh
```

* MOSIP File Server

```
cd $INFRA_ROOT/deployment/v3/mosip/mosip-file-server
./install.sh
```

* Resident services

```
cd $INFRA_ROOT/deployment/v3/mosip/resident
./install.sh
```

* Registration Client

```
cd $INFRA_ROOT/deployment/v3/mosip/regclient
./install.sh
```
