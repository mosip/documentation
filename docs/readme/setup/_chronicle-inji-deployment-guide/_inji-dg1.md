# Inji Deployment Guide - Revised Outline


<!--

Prompts

Read the content on this page first, also read the content from hyperlinks.
This is a deployment guide for the Inji stack, outlining the necessary steps and considerations for a successful deployment.


On the basis of the content on this page and the outgoing hyperlinks create this 'How is this guide organized?'

-->







# Overview

## What is Inji?
Inji is a digital credentialing platform that enables users to create, manage, and present their digital identities and credentials securely. It leverages blockchain technology to ensure the authenticity and integrity of credentials, providing a seamless experience for users across various applications and services.

## What to expect from this guide and How is this guide organized?
This guide expects you to stay here on this page and provide you a complete map of deploying the inji stack.

This is broadly and logically divided as below:
Prerequisites
Base Infrastructure Setup - This is the part where you have to make a major toil expecting this is on-premise deployment. When you get this part done installing Inji is simple.
Inji Stack Deployment
Component Deployments
Troubleshooting
Contact Information



This guide is structured to provide a step-by-step approach for deploying the Inji stack, covering all essential aspects from prerequisites to troubleshooting:

1. **Overview**: Introduction to Inji, its modules, deployment scenarios, required skillsets, architecture, deployment order, key considerations, dependencies, and supported environments.
2. **Prerequisites**: Details on hardware, infrastructure, and software requirements, including tools, system specifications, and initial setup steps.
3. **Base Infrastructure Setup**: Instructions for setting up Kubernetes clusters, NGINX, cluster configuration, and optional observation clusters.
4. **Inji Stack Deployment**: Guidance on configuring and deploying core Inji components, including configuration management and object storage.
5. **Component Deployments**: Stepwise deployment instructions for Inji Certify, Mimoto, Web UI, and Verify modules.
6. **Troubleshooting**: Common issues and solutions encountered during deployment.
7. **Contact Information**: How to reach out for further support.

Each section references detailed steps and external resources where applicable, ensuring a comprehensive and actionable deployment process.


Inji Modules (Wallet, Certify, Verify, Web)

## About Inji Modules

**Inji Wallet**  
The Inji Wallet is a secure digital wallet that allows users to store, manage, and present their digital credentials. It is available in two variants:
- **Web**: A browser-based application enabling users to access their credentials from any device with internet connectivity.
- **Mobile**: A mobile app providing secure, on-the-go access to credentials, supporting offline functionality and enhanced security features.

**Inji Certify**  
Inji Certify is the module responsible for issuing and managing digital credentials. It interfaces with identity systems and ensures that credentials are securely generated, signed, and delivered to the Inji Wallet.

**Verify**  
The Verify module enables the validation of digital credentials presented by users. It checks the authenticity and integrity of credentials, ensuring they are valid and have not been tampered with, supporting both online and offline verification scenarios.




## Typical Deployment Scenarios - [sanchi singh]

## Prerequisites

Skillset Required [Keshav Singh]

### Basic Skillset Required

To successfully deploy and manage the Inji stack, the following skillsets are recommended:

- **Kubernetes Administration**: Understanding of Kubernetes concepts, cluster setup, resource management, and troubleshooting.
- **Linux System Administration**: Proficiency in Linux command-line operations, user and permission management, and basic networking.
- **Containerization**: Experience with Docker or similar container technologies for building and managing service containers.
- **Helm**: Familiarity with Helm for managing Kubernetes manifests and deployments.
- **Networking Fundamentals**: Knowledge of firewalls, load balancers, DNS, and secure network configuration.
- **Database Management**: Basic skills in managing PostgreSQL or similar databases, including initialization and schema setup.
- **Configuration Management**: Ability to manage application configuration files, secrets, and certificates securely.
- **Monitoring and Logging**: Understanding of logging and monitoring tools to observe system health and troubleshoot issues.
- **Security Best Practices**: Awareness of secure credential handling, certificate management, and access control.
- **Scripting**: Basic scripting skills (e.g., Bash, Python) for automation and operational tasks.
- **Familiarity with CI/CD Pipelines**: Understanding of continuous integration and deployment processes is a plus.


## High-Level Architecture of Inji [Keshav  Singh]

Put the diagram here


## Deployment Order

The recommended order for deploying the Inji stack ensures that dependencies are met and each component functions as intended. Follow this sequence for a smooth deployment:

1. **Certify**  
  Deploy the Certify module first, as it is responsible for issuing and managing digital credentials. Other modules depend on Certify for credential operations.

2. **Wallet**  
  After Certify, deploy the Inji Wallet, which allows users to store and manage their credentials. Deploy both variants as needed:
  - **Mobile**: For users requiring on-the-go access and offline capabilities.
  - **Web**: For browser-based access to credentials.

3. **Verify**  
  Deploy the Verify module last. It relies on both Certify and Wallet to validate and authenticate credentials presented by users.

> **Note:** Ensure that all prerequisites and infrastructure components (such as databases, storage, and configuration servers) are set up before starting the deployment of these modules.

This order helps maintain system integrity and ensures that each module is operationally ready for the next.

## Consideration - [Keshav Singh]

## Supported Operating Systems

The Inji stack can be deployed on the following operating systems:

- **Linux** (recommended for production deployments)
- **Windows**
- **macOS (OSX)**

> **Note:** Most deployment scripts and tools are tested primarily on Linux. For Windows and macOS, ensure compatibility of required tools (e.g., Docker, Kubernetes CLI, Helm) and consider using WSL (Windows Subsystem for Linux) or virtualization where necessary.

## Supported Deployment Environments (**On-prem**, Cloud, Hybrid)

## Dependencies on MOSIP Modules (eSignet) - \[Deployment Scenario consideration - With and Without eSignet - Configuration changes in Inji Certify and Wallet to support \] - Discuss again with - [varaniya]



# Prerequisites

## System Requirements
###  Hardware and Infrastructure Requirements - [Keshav Singh]

- Tools and utilities to be installed on Personal Computers (Tools for
  Secure Access , locally
  [steps](https://docs.inji.io/readme/setup/deploy#tools-and-utilities)

- System Requirements: Hardware, network, Security, Firewall
  Requirements and certificate requirements
  [steps](https://docs.inji.io/readme/setup/deploy#system-requirements)

- Software Requirements - (Java, Kubernetes, Helm, Postgres, etc.) -
  Reconfirm with DevOps

- Set up Wireguard Bastion Host
  [steps](https://docs.inji.io/readme/setup/deploy#wireguard)

## Setting Up the Deployment Environment - ([Chandra Keshav Mishra]

- Configuring Secrets and Certificates

- Database Initialization and Schema Setup

- Storage and Logging Setup

- External Integrations (OIDC, GovBR/eSignet, SMTP, etc.)


# Base infrastructure setup - [Keshav Singh]

- K8s Cluster setup
  [steps](https://docs.inji.io/readme/setup/deploy#k8-cluster-setup)

- NGINX setup and configuration
  [steps](https://docs.inji.io/readme/setup/deploy#nginx-for-inji-k8-cluster)

  - Note: (Extra configuration for individual tracks) - Basic to be common , yet , Individual ones may need extra configuration) - [Swati]

- K8s Cluster Configuration
  [steps](https://docs.inji.io/readme/setup/deploy#k8-cluster-configuration)

- Observation Cluster setup (Optional)


# Inji Stack Deployment - [Keshav Singh](https://mosip.atlassian.net/wiki/people/712020:89022ae0-b73b-4f19-a5dc-8cf7cf3c67a7?ref=confluence) + [Chandra Keshav Mishra](https://mosip.atlassian.net/wiki/people/5d4159ed4125b20c3159b1ed?ref=confluence)

inji-stack-config ConfigMap
[steps](https://docs.inji.io/readme/setup/deploy#pre-requisites)

Config server secerts
[steps](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/mosip/conf-secrets)

Config server installation
[steps](https://docs.inji.io/readme/setup/deploy#config-server-installation)

Object store installation
[steps](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/external/object-store)

Note: Before running the minio install script, update the EXTERNAL_HOST variable in the script.


# Deploying Inji Certify - [Keshav Singh] + [Chandra Keshav Mishra]

Content

# Deploying Mimoto - [Keshav Singh] + [Chandra Keshav Mishra]

Content

# Deploying Inji Web UI - [Keshav Singh] + [Chandra Keshav Mishra]

Content

# Deploying Inji Verify - [Keshav Singh] + [Chandra Keshav Mishra]

Content

# Troubleshooting - [Chandra Keshav Mishra]

Content

# Contact Us -
