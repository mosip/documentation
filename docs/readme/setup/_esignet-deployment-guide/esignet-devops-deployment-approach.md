# eSignet DevOps-Focused Deployment Strategy

## Overview

This document outlines a modern DevOps approach for eSignet deployment documentation, focusing on **application stack deployment** with multiple identity system integrations. The restructure assumes infrastructure readiness and emphasizes Docker and Kubernetes deployment methods.

## Current Challenge Analysis

The existing eSignet guide follows infrastructure-first approach similar to Inji, covering Kubernetes cluster setup, Nginx, Istio, etc. DevOps teams need deployment guides that focus on eSignet integration patterns and application deployment when infrastructure is already provisioned.

## Recommended Documentation Structure

### **1. Modern eSignet Deployment Guide Structure**

```markdown
# eSignet Deployment Guide


## Quick Start
- [5-Minute Docker Setup](#docker-quick-start)
- [Kubernetes Quick Start](#k8s-quick-start)
- [Integration Scenarios](#integration-scenarios)

## Integration Scenarios
* Scenario 1: eSignet + MOSIP Identity System
* Scenario 2: eSignet + Custom Identity System
* Scenario 3: eSignet + Sunbird RC
* Scenario 4: eSignet Standalone (Mock Plugin)

## Deployment Methods
* Option 1: Docker Compose (Development/Testing)
* Option 2: Kubernetes with Helm (Production)
* Option 3: Cloud-Specific Deployments

## Plugin Architecture & Customization
## Configuration & Integration
## Operations & Maintenance

### **2. Integration-First Approach** ⭐⭐⭐⭐⭐


# eSignet Integration & Deployment Guide

## Choose Your Integration Scenario

### 🏛️ eSignet + MOSIP Identity System
**Best for:** Countries using MOSIP for identity management
**Time to deploy:** 45 minutes
**Prerequisites:** MOSIP cluster, eSignet-compatible infrastructure
**Plugin:** `mosip-identity-plugin`

#### Quick Deploy
```bash
# Add Helm repository
helm repo add mosip https://mosip.github.io/mosip-helm

# Deploy eSignet with MOSIP plugin
helm install esignet mosip/esignet \
  --set integration.type=mosip \
  --set mosip.idaUrl=https://ida.mosip.net \
  --set mosip.pmsUrl=https://pms.mosip.net
```

### 🔧 eSignet + Custom Identity System
**Best for:** Organizations with existing identity systems
**Time to deploy:** 60 minutes (+ custom plugin development)
**Prerequisites:** Custom identity API, plugin development
**Plugin:** Custom plugin implementation

#### Integration Steps
1. [Develop Custom Plugin](#custom-plugin-development)
2. [Deploy eSignet Core](#esignet-core-deployment)
3. [Configure Integration](#custom-integration-config)




### 🌐 eSignet + Sunbird RC
**Best for:** Verifiable credential ecosystems
**Time to deploy:** 30 minutes
**Prerequisites:** Sunbird RC instance
**Plugin:** `sunbird-rc-plugin`

#### Quick Deploy
```bash
helm install esignet mosip/esignet \
  --set integration.type=sunbird-rc \
  --set sunbird.registryUrl=https://registry.sunbird.org
```



### 🧪 eSignet Standalone (Development/Testing)
**Best for:** Development, testing, proof-of-concept
**Time to deploy:** 15 minutes
**Prerequisites:** Docker/Kubernetes only
**Plugin:** `esignet-mock-plugin`

#### Quick Deploy
```bash
# Docker Compose
docker-compose -f docker-compose.mock.yml up -d

# Kubernetes
helm install esignet mosip/esignet --set integration.type=mock
```

## Compatibility Matrix

| Identity System | eSignet Version | Plugin Version | Status | Integration Guide |
|----------------|----------------|----------------|---------|-------------------|
| MOSIP 1.2.x    | 1.6.1         | 1.3.x          | ✅ Stable | [MOSIP Integration](#mosip-integration) |
| MOSIP 1.1.x    | 1.5.x         | 1.2.x          | ⚠️ Legacy | [Legacy MOSIP](#legacy-mosip) |
| Sunbird RC 2.x | 1.6.1         | 1.0.x          | ✅ Stable | [Sunbird Integration](#sunbird-integration) |
| Custom API     | 1.6.1         | Custom         | 🔧 Custom | [Plugin Development](#plugin-development) |

## Infrastructure Prerequisites

### What You Need Ready
- [ ] Kubernetes cluster (EKS, GKE, AKS, on-prem)
- [ ] PostgreSQL database
- [ ] Redis cache
- [ ] Keycloak/Identity Provider
- [ ] SSL certificates
- [ ] Domain names configured



### Infrastructure Guides (Optional)
> **Note:** If you need infrastructure setup help, see [Infrastructure Guides](./infrastructure/)
- [AWS EKS Setup](./infrastructure/aws-eks.md)
- [On-Premise K8s](./infrastructure/on-prem-k8s.md)
- [MOSIP Infrastructure](./infrastructure/mosip-infra.md)


## Specific Implementation Recommendations

### **1. Docker Compose Approach** ⭐⭐⭐⭐⭐

```yaml
# docker-compose.yml
version: '3.8'
services:
  # Infrastructure services
  postgres:
    image: postgres:13
    environment:
      POSTGRES_DB: esignet
      POSTGRES_USER: ${DB_USER}
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./db-init:/docker-entrypoint-initdb.d

  redis:
    image: redis:7-alpine
    command: redis-server --requirepass ${REDIS_PASSWORD}

  keycloak:
    image: quay.io/keycloak/keycloak:22.0
    environment:
      KEYCLOAK_ADMIN: admin
      KEYCLOAK_ADMIN_PASSWORD: ${KEYCLOAK_PASSWORD}
      KC_DB: postgres
      KC_DB_URL: jdbc:postgresql://postgres:5432/keycloak
    depends_on: [postgres]



  # eSignet Core Services
  esignet-service:
    image: mosip/esignet:${ESIGNET_VERSION}
    environment:
      SPRING_PROFILES_ACTIVE: docker
      DB_HOST: postgres
      REDIS_HOST: redis
      KEYCLOAK_URL: http://keycloak:8080
      PLUGIN_TYPE: ${PLUGIN_TYPE:-mock}
    depends_on: [postgres, redis, keycloak]

  # Plugin-specific services (conditional)
  mock-identity-service:
    image: mosip/mock-identity:${MOCK_VERSION}
    profiles: ["mock"]
    depends_on: [postgres]

  # UI Services
  esignet-ui:
    image: mosip/esignet-ui:${ESIGNET_VERSION}
    environment:
      ESIGNET_API_URL: http://esignet-service:8088
    ports:
      - "3000:3000"

  mock-relying-party:
    image: mosip/mock-relying-party:${MOCK_RP_VERSION}
    profiles: ["development"]
    environment:
      ESIGNET_URL: http://esignet-service:8088
    ports:
      - "3001:3000"

  # Reverse proxy
  nginx:
    image: nginx:alpine
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./ssl:/etc/ssl
    ports:
      - "443:443"
    depends_on: [esignet-ui, esignet-service]

volumes:
  postgres_data:
```






### **2. Helm Chart Approach** ⭐⭐⭐⭐⭐

```yaml
# Chart.yaml
apiVersion: v2
name: esignet-stack
description: Complete eSignet deployment with identity integration
version: 1.6.1
dependencies:
  - name: postgresql
    version: 12.x.x
    repository: https://charts.bitnami.com/bitnami
    condition: postgresql.enabled
  - name: redis
    version: 17.x.x
    repository: https://charts.bitnami.com/bitnami
    condition: redis.enabled
  - name: keycloak
    version: 15.x.x
    repository: https://charts.bitnami.com/bitnami
    condition: keycloak.enabled
  - name: esignet-service
    version: 1.6.x
    repository: https://mosip.github.io/mosip-helm
  - name: esignet-ui
    version: 1.6.x
    repository: https://mosip.github.io/mosip-helm
```


```yaml
# values.yaml
global:
  domain: "esignet.example.com"
  imageRegistry: "docker.io"
  
integration:
  type: "mosip"  # Options: mosip, sunbird-rc, mock, custom
  
# MOSIP Integration
mosip:
  enabled: true
  idaUrl: "https://ida.mosip.net"
  pmsUrl: "https://pms.mosip.net"
  authManagerUrl: "https://auth.mosip.net"

# Sunbird RC Integration  
sunbird:
  enabled: false
  registryUrl: "https://registry.sunbird.org"
  issuerUrl: "https://issuer.sunbird.org"

# Mock Plugin (for testing)
mock:
  enabled: false
  identityService:
    enabled: true

esignet-service:
  ingress:
    enabled: true
    hostname: "api.esignet.example.com"

esignet-ui:
  ingress:
    enabled: true
    hostname: "auth.esignet.example.com"
```

### **3. Plugin-Specific Configurations**

#### **MOSIP Integration Configuration**
```yaml
# values-mosip.yaml
integration:
  type: "mosip"

mosip:
  enabled: true
  idaUrl: "https://ida.mosip.net"
  pmsUrl: "https://pms.mosip.net"
  authManagerUrl: "https://auth.mosip.net"
  
  # MISP Partner Configuration
  misp:
    partnerId: "esignet-partner"
    policyGroup: "auth"
    
  # Plugin Configuration
  plugin:
    image: "mosip/mosip-identity-plugin:1.3.x"
    config:
      ida:
        secretKey: "${MOSIP_IDA_SECRET}"
        authenticateUrl: "/idauthentication/v1/auth"
        kycUrl: "/idauthentication/v1/kyc"
```

#### **Custom Plugin Configuration**
```yaml
# values-custom.yaml
integration:
  type: "custom"

custom:
  plugin:
    image: "yourorg/custom-esignet-plugin:1.0.0"
    config:
      identityApiUrl: "https://your-identity-api.com"
      authEndpoint: "/api/authenticate"
      kycEndpoint: "/api/kyc"
      secretKey: "${CUSTOM_API_SECRET}"
```

## Deployment Workflow Examples

### **Scenario 1: MOSIP + eSignet Production Deployment**

```bash
# 1. Prepare environment
kubectl create namespace esignet
kubectl create secret generic esignet-secrets \
  --from-literal=db-password=yourpassword \
  --from-literal=mosip-ida-secret=yoursecret

# 2. Deploy with MOSIP integration
helm install esignet mosip/esignet-stack \
  --namespace esignet \
  --values values-mosip.yaml \
  --set global.domain=esignet.yourorg.com \
  --set mosip.idaUrl=https://ida.yourorg.com

# 3. Verify deployment
kubectl get pods -n esignet
kubectl logs -n esignet deployment/esignet-service

# 4. Configure MISP Partner
kubectl exec -n esignet deployment/esignet-service -- \
  ./scripts/onboard-misp-partner.sh
```

### **Scenario 2: Development with Mock Plugin**

```bash
# 1. Quick development setup
git clone https://github.com/mosip/esignet-docker
cd esignet-docker

# 2. Configure for mock
cp .env.mock .env
echo "PLUGIN_TYPE=mock" >> .env

# 3. Start services
docker-compose up -d

# 4. Verify
curl -k https://localhost/authorize
open https://localhost:3001  # Mock Relying Party
```

## Enhanced Documentation Structure

### **File Organization**
```
docs/
├── deployment/
│   ├── README.md                    # Main deployment guide
│   ├── quick-start.md              # 5-minute setup
│   ├── integration-scenarios.md    # All integration patterns
│   ├── docker/
│   │   ├── README.md               # Docker deployment
│   │   ├── docker-compose.yml      # Full stack compose
│   │   ├── docker-compose.mock.yml # Mock plugin only
│   │   └── .env.examples/          # Environment templates
│   ├── kubernetes/
│   │   ├── README.md               # K8s deployment
│   │   ├── helm-chart/             # eSignet Helm chart
│   │   ├── values-examples/        # Integration-specific values
│   │   └── troubleshooting.md      # K8s-specific issues
│   └── plugins/
│       ├── mosip-plugin.md         # MOSIP integration
│       ├── sunbird-plugin.md       # Sunbird RC integration
│       ├── custom-plugin.md        # Custom plugin development
│       └── plugin-development.md   # Plugin SDK guide
├── integration/
│   ├── mosip-integration.md        # Detailed MOSIP setup
│   ├── sunbird-integration.md      # Detailed Sunbird setup
│   ├── custom-api-integration.md   # Custom API integration
│   └── oauth-flows.md              # OAuth/OIDC flows
├── operations/
│   ├── monitoring.md               # Monitoring setup
│   ├── security.md                 # Security hardening
│   ├── backup-restore.md           # Backup procedures
│   └── troubleshooting.md          # Common issues
└── reference/
    ├── api-reference.md            # API documentation
    ├── configuration.md            # Configuration reference
    └── plugin-api.md               # Plugin development API
```

## Implementation Plan

### **Phase 1: Core Restructure (Week 1-2)**
1. Create Docker Compose stack for all integration scenarios
2. Develop Helm chart with integration options
3. Create integration-specific value files
4. Test mock plugin deployment

### **Phase 2: Integration Guides (Week 3-4)**
1. Create MOSIP integration guide with MISP onboarding
2. Develop Sunbird RC integration documentation
3. Create custom plugin development guide
4. Test each integration scenario

### **Phase 3: Documentation Enhancement (Week 5)**
1. Restructure main deployment guide
2. Create scenario-based quick start guides
3. Move infrastructure content to optional section
4. Add comprehensive troubleshooting

### **Phase 4: Validation & Testing (Week 6)**
1. Test Docker deployments across scenarios
2. Validate Helm deployments on different K8s platforms
3. Verify integration scenarios work end-to-end
4. Gather feedback from DevOps teams

## Benefits of This Approach

### **Integration-Focused Benefits**
1. **Clear Integration Paths**: Each identity system has dedicated deployment path
2. **Plugin Architecture**: Modular approach supports multiple identity providers
3. **Scenario-Based**: Users choose based on their identity infrastructure
4. **Quick Testing**: Mock plugin enables rapid prototyping

### **DevOps Benefits**
1. **Infrastructure Agnostic**: Works on any Docker/K8s platform
2. **Integration-First**: Focuses on eSignet's core value proposition
3. **Production Ready**: Helm charts with proper production configuration
4. **Flexible Deployment**: Multiple deployment methods for different needs

### **Developer Benefits**
1. **Plugin SDK**: Clear guidance for custom plugin development
2. **API Integration**: Comprehensive API integration documentation
3. **Testing Support**: Mock services for development and testing
4. **Configuration Examples**: Real-world configuration patterns

## Key Principles

1. **Integration-Centric**: Structure around identity system integrations
2. **Plugin Architecture**: Emphasize modular plugin approach
3. **Multiple Deployment Paths**: Docker for dev, Helm for production
4. **Quick Success**: Users should have working eSignet in under 15 minutes
5. **Production Ready**: Enterprise-grade configuration examples
6. **Developer Friendly**: Clear plugin development and customization guides

This approach transforms eSignet documentation from infrastructure-first to integration-first, making it easier for organizations to adopt eSignet with their existing identity systems while providing clear paths for customization and extension.