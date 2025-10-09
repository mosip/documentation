# DevOps-Focused Inji Deployment Strategy

## Overview

This document outlines a recommended restructure of the Inji deployment documentation based on DevOps feedback to focus on **application stack deployment** rather than infrastructure provisioning. The approach assumes infrastructure is ready and targets Docker and Kubernetes deployment methods.

## Current Challenge

The existing deployment guide covers infrastructure setup (Wireguard, base infrastructure, etc.) which varies significantly across deployment environments (bare metal, AWS, GCP, Azure). DevOps teams prefer deployment guides that focus on the application stack when the environment is already provisioned.

## Recommended Documentation Structure

### **1. Main Deployment Guide Structure**

```markdown
# Inji Stack Deployment Guide

## Quick Start
- [5-Minute Docker Setup](#docker-quick-start)
- [Kubernetes Quick Start](#k8s-quick-start)
- [Cloud Provider Guides](#cloud-guides)

## Deployment Methods
### Option 1: Docker Compose (Development/Testing)
### Option 2: Kubernetes with Helm (Production)
### Option 3: Cloud-Specific Deployments

## Prerequisites & Environment Readiness
## Inji Stack Components
## Configuration & Customization
## Operations & Maintenance
```

### **2. DevOps-Focused Approach Options**

#### **Option A: Environment-Agnostic Structure** ⭐⭐⭐⭐⭐

```markdown
# Inji Stack Deployment

## Prerequisites
### Infrastructure Requirements
- Kubernetes cluster (any provider: EKS, GKE, AKS, on-prem)
- Helm 3.x installed
- kubectl configured
- Container registry access

### Dependencies
- PostgreSQL database
- Redis cache
- Object storage (S3-compatible)
- SSL certificates

## Deployment Methods

### Method 1: Docker Compose (Development)
#### Quick Start
```bash
git clone https://github.com/mosip/inji-stack-docker
cd inji-stack-docker
cp .env.example .env
# Edit .env with your configuration
docker-compose up -d
```

### Method 2: Kubernetes with Helm (Production)
#### Quick Start
```bash
# Add Helm repository
helm repo add mosip https://mosip.github.io/mosip-helm
helm repo update

# Install Inji Stack
helm install inji-stack mosip/inji-stack \
  --set global.domain=your-domain.com \
  --set postgres.host=your-db-host \
  --set redis.host=your-redis-host
```

### Method 3: Cloud-Specific Deployments
- AWS EKS Deployment
- Google GKE Deployment
- Azure AKS Deployment
```

#### **Option B: Deployment-Method-First Structure** ⭐⭐⭐⭐

```markdown
# Inji Stack Deployment Guide

## Choose Your Deployment Method

### 🐳 Docker Compose (Recommended for Development)
**Best for:** Local development, testing, proof-of-concept
**Time to deploy:** 10 minutes
**Prerequisites:** Docker, Docker Compose

### ⚙️ Kubernetes + Helm (Recommended for Production)
**Best for:** Production, staging, enterprise deployments
**Time to deploy:** 30 minutes
**Prerequisites:** K8s cluster, Helm, external dependencies

### ☁️ Cloud Managed Services
**Best for:** Cloud-native deployments with managed services
**Time to deploy:** 45 minutes
**Prerequisites:** Cloud account, managed databases

## Infrastructure Prerequisites
### What You Need Ready
- [ ] Container orchestration platform (Docker/K8s)
- [ ] Database (PostgreSQL)
- [ ] Cache (Redis)
- [ ] Object Storage (S3-compatible)
- [ ] Load balancer/Ingress
- [ ] SSL certificates

### Infrastructure Guides (Optional)
> **Note:** If you need help setting up infrastructure, see our [Infrastructure Setup Guides](./infrastructure/)
- [AWS Infrastructure](./infrastructure/aws.md)
- [GCP Infrastructure](./infrastructure/gcp.md)
- [On-Premise Infrastructure](./infrastructure/on-prem.md)
```

## Specific Implementation Recommendations

### **1. Docker-First Approach** ⭐⭐⭐⭐⭐

Create a **Docker Compose stack** that includes everything:

```yaml
# docker-compose.yml
version: '3.8'
services:
  # Infrastructure services
  postgres:
    image: postgres:13
    environment:
      POSTGRES_DB: inji
      POSTGRES_USER: ${DB_USER}
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./db-init:/docker-entrypoint-initdb.d

  redis:
    image: redis:7-alpine
    command: redis-server --requirepass ${REDIS_PASSWORD}

  minio:
    image: minio/minio
    command: server /data --console-address ":9001"
    environment:
      MINIO_ROOT_USER: ${MINIO_USER}
      MINIO_ROOT_PASSWORD: ${MINIO_PASSWORD}

  # Inji Stack services
  config-server:
    image: mosip/config-server:${INJI_VERSION}
    environment:
      SPRING_PROFILES_ACTIVE: docker
      DB_HOST: postgres
      REDIS_HOST: redis

  inji-certify:
    image: mosip/inji-certify:${INJI_VERSION}
    depends_on: [config-server, postgres, redis]
    environment:
      CONFIG_SERVER_URL: http://config-server:8080

  mimoto:
    image: mosip/mimoto:${INJI_VERSION}
    depends_on: [config-server, postgres, redis]

  inji-web:
    image: mosip/inji-web:${INJI_VERSION}
    depends_on: [mimoto]
    ports:
      - "80:80"

  inji-verify:
    image: mosip/inji-verify:${INJI_VERSION}
    depends_on: [config-server, postgres]

  # Reverse proxy
  nginx:
    image: nginx:alpine
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./ssl:/etc/ssl
    ports:
      - "443:443"
    depends_on: [inji-web, inji-certify, inji-verify]

volumes:
  postgres_data:
```

### **2. Helm Chart Approach** ⭐⭐⭐⭐⭐

Create an **umbrella Helm chart**:

```yaml
# Chart.yaml
apiVersion: v2
name: inji-stack
description: Complete Inji Stack deployment
version: 0.8.0
dependencies:
  - name: postgresql
    version: 12.x.x
    repository: https://charts.bitnami.com/bitnami
    condition: postgresql.enabled
  - name: redis
    version: 17.x.x
    repository: https://charts.bitnami.com/bitnami
    condition: redis.enabled
  - name: inji-certify
    version: 0.8.x
    repository: https://mosip.github.io/mosip-helm
  - name: mimoto
    version: 0.8.x
    repository: https://mosip.github.io/mosip-helm
  - name: inji-web
    version: 0.8.x
    repository: https://mosip.github.io/mosip-helm
  - name: inji-verify
    version: 0.8.x
    repository: https://mosip.github.io/mosip-helm
```

```yaml
# values.yaml
global:
  domain: "inji.example.com"
  imageRegistry: "docker.io"
  storageClass: "standard"

postgresql:
  enabled: true
  auth:
    database: "inji"
    username: "inji"

redis:
  enabled: true
  auth:
    enabled: true

inji-certify:
  ingress:
    enabled: true
    hostname: "certify.inji.example.com"

mimoto:
  ingress:
    enabled: true
    hostname: "api.inji.example.com"

inji-web:
  ingress:
    enabled: true
    hostname: "wallet.inji.example.com"

inji-verify:
  ingress:
    enabled: true
    hostname: "verify.inji.example.com"
```

### **3. Recommended Documentation Strategy**

#### **Primary Guide: Quick Start**
```markdown
# Inji Stack Quick Start

## 🚀 5-Minute Setup (Docker)
```bash
# 1. Clone and setup
git clone https://github.com/mosip/inji-stack
cd inji-stack
cp .env.example .env

# 2. Configure (edit .env file)
nano .env

# 3. Deploy
docker-compose up -d

# 4. Verify
curl -k https://localhost/health
```

## 🎯 Production Setup (Kubernetes)
```bash
# 1. Add Helm repo
helm repo add mosip https://mosip.github.io/mosip-helm

# 2. Deploy with your values
helm install inji mosip/inji-stack -f my-values.yaml

# 3. Verify
kubectl get pods -l app.kubernetes.io/name=inji-stack
```
```

#### **Secondary Guides: Environment-Specific**
- `deployment/docker/README.md` - Complete Docker setup
- `deployment/kubernetes/README.md` - Complete K8s setup  
- `deployment/cloud/aws.md` - AWS-specific deployment
- `deployment/cloud/gcp.md` - GCP-specific deployment
- `deployment/cloud/azure.md` - Azure-specific deployment

#### **Tertiary Guides: Infrastructure (Optional)**
- `infrastructure/` - Only if users need infrastructure help
- Keep current wireguard/base-infra content here as reference

## Implementation Plan

### **Phase 1: Create Docker Stack (Week 1-2)**
1. Create `docker-compose.yml` with full stack
2. Create `.env.example` with all required variables
3. Create init scripts for databases
4. Test end-to-end deployment

### **Phase 2: Create Helm Chart (Week 3-4)**
1. Create umbrella Helm chart
2. Define proper values.yaml structure
3. Create chart dependencies
4. Test on different K8s platforms

### **Phase 3: Documentation Restructure (Week 5)**
1. Restructure deployment guide with new approach
2. Move infrastructure content to separate section
3. Create cloud-specific guides
4. Add troubleshooting section

### **Phase 4: Validation (Week 6)**
1. Test Docker deployment on fresh environment
2. Test Helm deployment on different K8s platforms
3. Validate with DevOps team
4. Gather feedback and iterate

## Benefits of This Approach

1. **DevOps-Friendly**: Focuses on what DevOps teams actually need
2. **Environment-Agnostic**: Works on any Docker/K8s platform
3. **Quick Start**: Get running in minutes, not hours
4. **Production-Ready**: Helm charts for proper production deployment
5. **Flexible**: Users can choose their deployment method
6. **Maintainable**: Easier to keep updated vs. infrastructure-specific guides

## Example File Structure

```
docs/
├── deployment/
│   ├── README.md                 # Main deployment guide
│   ├── quick-start.md           # 5-minute setup guide
│   ├── docker/
│   │   ├── README.md            # Complete Docker guide
│   │   ├── docker-compose.yml
│   │   ├── .env.example
│   │   └── nginx.conf
│   ├── kubernetes/
│   │   ├── README.md            # Complete K8s guide
│   │   ├── helm-chart/
│   │   ├── values-examples/
│   │   └── troubleshooting.md
│   └── cloud/
│       ├── aws.md               # AWS-specific deployment
│       ├── gcp.md               # GCP-specific deployment
│       └── azure.md             # Azure-specific deployment
├── infrastructure/              # Optional infrastructure guides
│   ├── wireguard.md            # Current wireguard content
│   ├── base-infrastructure.md   # Current base infra content
│   └── on-premise.md           # Current on-prem content
└── operations/
    ├── monitoring.md
    ├── backup.md
    └── troubleshooting.md
```

## Key Principles

1. **Assume Infrastructure Exists**: Focus on application deployment
2. **Multiple Deployment Paths**: Docker for dev, Helm for production
3. **Quick Success**: Users should be running Inji in under 10 minutes
4. **Environment Agnostic**: Works on any Docker/K8s platform
5. **Production Ready**: Proper production configuration examples
6. **DevOps Focused**: Speaks the language DevOps teams understand

This approach aligns with modern DevOps practices where infrastructure is assumed to be ready, and deployment guides focus on the application stack itself.