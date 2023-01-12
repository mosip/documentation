# AWS 1.2.0.1-B2 V3 Installation Guidelines

* Wireguard installation
    * Bastion server installation.
    * Setting up client in PC.
    * Connect to wireguard using `wireguard conf` and demo one ssh connection withprivate ip.
    
* Rancher cluster creation
    * Install pre requisites in local PC
    * Setup VM’s and checks
    * Enable ports
    * Install Docker
    * Create cluster
    * Connect to cluster using kubeconfig files
    
* Setting up Rancher cluster
    * Ingress controller
    * Longhorn

* Setting up nginx server for Rancher Cluster
    * SSL Certificate creation
    * Server setup
    * DNS mapping
    
* Rancher Cluster apps installation
    * Install Rancher based UI for importing clusters
    * Install Keycloak
    * Integrate rancher and keycloak
    
* MOSIP Cluster creation
    * Install pre-requisites
    * Setup VM’s and checks
    * Enable Ports
    * Install Docker
    * Create Cluster
    * Connect to cluster using kubeconfig
    * Import MOSIP Cluster in Rancher UI
    
* MOSIP Cluster setup
    * Istio Installation
    * Longhorn installation
    * Global ConfigMap setup
    
* Setting up the Nginx server for Mosip cluster
    * SSL Certificate Creation.
    * Nginx Server setup
    * DNS Mapping
    * Test wiring using httpbin.
    
* Monitoring services installation

* Alerting services installation

* Logging services installation

* External service deployment
    * Postgres
    * IAM
    * HSM
    * Object store
    * Anti Virus
    * AciveMQ
    * Kafka
    * Biosdk
    * ABIS
    * Message gateway
    
* MOSIP services deployment
    * Landing page
    * Docker secrets for private docker if any
    * Masterdata loader
    * Prereg captcha
    * Config server
    * Artifactory
    * WebSub
    * Mock ABIS
    * Keymanager
    * Kernel
    * Packetmanager
    * Datashare
    * Pre-registration
    * ID repository
    * Partner management services
    * Registration processor
    * Admin
    * ID authentication
    * Print
    * Partner onboarder
    * MOSIP file server
    * Registration client
    * Resident
    * API testrig deployment
    * Reporting module
