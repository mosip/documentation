## Deployment Structure

This guide provides a comprehensive overview of deploying eSignet with various identity systems. It covers different scenarios, compatibility, plugin information, and step-by-step deployment instructions.

### Guide Overview

- **Scenarios**: Deployment options for eSignet with different ID systems.
  - **MOSIP + eSignet**
    - Compatibility matrix
    - Plugin information
    - Deploying eSignet when MOSIP is already present
  - **Non-MOSIP ID + eSignet**
    - Plugin information
    - Integration guide links
    - Instructions to build custom authentication plugins
    - Reference to Step 5 for onboarding
  - **Sunbird + eSignet**
    - Plugin information

### Guide Structure

- **Default Flow**: Sequential steps for deployment.
- **Pre-requisites**: Tools and resources required for MOSIP + eSignet deployment.
- **Infrastructure Deployment**: Setting up MOSIP base infrastructure, including tools and steps.
- **eSignet as a Partner**: Overview of eSignet core deployment and UI.
- **Contribution and Community**: How to contribute and engage with the community.
- **Required Skills**: Basic skills needed for deployment.

---

## Deployment Architecture & Steps

### Step 1: Pre-requisites

- Overview of requirements for overall deployment.

### Step 2: Wireguard Setup

- [Link to MOSIP deployment guide](#)

### Step 3: Base Infrastructure Setup

- Instructions for setting up the base infrastructure.

### Step 4: eSignet-Specific Infra Configuration

- Configuration steps specific to eSignet.

### Step 5: eSignet Onboarding as Partner

- Onboarding eSignet as a MOSIP MISP partner or as a core component for other ID systems.

### Step 6: eSignet Nginx Setup

- Nginx configuration for eSignet.

### Step 7: eSignet Core Deployment

- Components installed and their purposes.
- Verification steps for base infrastructure.
- **eSignet Service**
  - Install pre-requisites (commands, user prompts, configuration)
    - HSM
    - API Access Control
    - Postgres
    - Keycloak
    - Redis
  - Configuration details for setup.
  - Initialization commands and prompts.
- **OIDC UI**
  - Setup commands, prompts, and configuration.
- **Mock Relying Party Setup (Optional)**
  - Setup commands, prompts, and configuration.
- **Mock Relying Party UI Setup (Optional)**
  - Setup commands, prompts, and configuration.

### Step 8: Testing the Deployment

- Steps to verify and test the deployment.
