# Infrastructure Requirements

### **Overview**

This document outlines the **infrastructure requirements** for deploying the **Inji Stack** in a **Proof of Concept (POC)** or **demo sandbox environment** or **small scale pilot**. It serves as a comprehensive reference for system architects, DevOps engineers, and IT administrators who are responsible for provisioning and configuring the virtualized infrastructure required to run Inji modules effectively.

The Inji Stack enables secure issuance, holding, and verification of **Verifiable Credentials (VCs)** and includes services such as Inji Web Wallet, Inji Mobile Wallet, Inji Verify, and Inji Certify. To demonstrate these capabilities effectively, a stable and scalable Kubernetes-based deployment environment is essential. To showcase these capabilities in a demo, small scale pilot or POC setting, the stack must be deployed on a Kubernetes cluster with properly allocated resources, network settings, and domain configurations.

**This document outlines the necessary hardware, VM provisioning details, cluster roles, and optional components to support observability and access control.**

#### **Purpose of this Document**

* Define the **minimum infrastructure** required for running all components of Inji Stack.
* Specify **node roles**, **hardware configurations**, and **networking prerequisites**.
* Provide **guidelines for optional tools** like Rancher and Keycloak, if Role-Based Access Control (RBAC) and observability are desired.
* Highlight key considerations around **DNS setup**, **SSL certificates**, and **VM provisioning**.

#### **Who Should Use This Document?**

* **DevOps Engineers** setting up and maintaining the Inji Stack environments.
* **System Integrators** or **Partner Teams** participating in small scale pilots, POCs or sandbox testing.
* **IT Teams** preparing demo infrastructure for showcasing Inji capabilities.
* **Solution Architects** planning how to scale from demo to production-ready deployments.

#### **How It Helps**

* Reduces ambiguity by clearly stating **resource needs** and **cluster expectations**.
* Supports **repeatable deployments** by defining baseline configurations.
* Acts as a starting point to scale up to a **high-availability production architecture**.

### **Cluster Roles**

Refer to [**Kubernetes Core Components**](https://kubernetes.io/docs/concepts/overview/components/#core-components) for standard terminology.

#### **Cluster Composition**

* The environment consists of **4 Virtual Machines (VMs)** functioning as nodes in a Kubernetes cluster.
* The cluster consists of four virtual machines (VMs), each functioning as a separate node.

**Control Plane Node**

* **Purpose**: Acts as both the master node and the etcd plane node.
* **Role**: Hosts all essential Kubernetes components required to orchestrate and manage the cluster.

**Worker Node**

* **Purpose**: Serves as a dedicated worker node for running the complete Inji Stack.
* **Role**: Hosts all services across all modules of Inji.

**Cluster-wide Role Assignment**:

* All cluster nodes are assigned to all of the above-mentioned cluster roles.
  * Proper configuration and resource allocation ensure seamless functioning of the cluster.

#### **Hardware Requirements**

| **Usage**                 | **VMs** | **vCPU** | **RAM** | **HDD** | **Network Interface** |
| ------------------------- | ------- | -------- | ------- | ------- | --------------------- |
| Inji-Cluster Worker Nodes | 3       | 8        | 32GB    | 64GB    | 1 Private             |
| Inji-Cluster NGINX        | 1       | 4        | 8GB     | 128GB   | 1 Private + 1 Public  |
| Wireguard Bastion Server  | 1       | 2        | 4GB     | 30GB    | 1 Private + 1 Public  |



{% hint style="warning" %}
**Note:** This configuration is for Proof of Concept, Small scale pilot, demonstration and evaluation purposes only. For production deployments, follow high availability best practices as outlined in the Kubernetes or RKE documentation to be able to sustain failures.
{% endhint %}



#### **Production Guidelines (Optional for POC)**

For reference, follow Rancher’s production-ready checklist and instruction for RKE which are mentioned here : [**Recommended Cluster Architecture - Rancher**](https://ranchermanager.docs.rancher.com/how-to-guides/new-user-guides/kubernetes-clusters-in-rancher-setup/checklist-for-production-ready-clusters/recommended-cluster-architecture).

### **Optional Components (Observability and RBAC)**

In case Rancher is used for cluster management and Keycloak is integrated for Role-Based Access Control (RBAC), the following infrastructure is additionally required:

#### **Observation Cluster Setup**

| **Usage**                 | **VMs** | **vCPU** | **RAM** | **HDD** | **Network Interface** |
| ------------------------- | ------- | -------- | ------- | ------- | --------------------- |
| Observation Cluster Nodes | 2       | 4        | 8GB     | 64GB    | 1 Private             |
| Observation Cluster NGINX | 1       | 4        | 8GB     | 64GB    | 1 Private             |

### **SSL Certificate Requirements**

* **Two wildcard SSL certificates** are recommended:
  1. One for Inji cluster components (e.g., \*.inji.example.org) mapping.
  2. (Optional) One for Observation cluster components if deployed separately.

### **Network Requirements**

* All VMs must be able to **communicate with each other** over a stable **private network**.
* **Stable internet connectivity** is needed on all VMs for:
  * Docker image downloads.
  * External software updates (or access to a local Docker registry for offline setups).
* Networking interfaces must be configured as per the Hardware table requirements given above:
  * Public and private interfaces, where required.

### **DNS Requirements**

* Access to a **DNS server** to map multiple subdomains under a wildcard domain (e.g., \*.inji.example.org).
* Subdomain mapping enables hosting of services and components such as:
  * verify.inji.example.org
  * certify.inji.example.org
  * wallet.inji.example.org

### **Conclusion**

This infrastructure specification provides the baseline setup needed to deploy the Inji Stack for showcasing its verifiable credentials capabilities as an end-to-end ecosystem. While the current configurations are optimized for Proof of Concept, Small scale pilot and demo scenarios, this document also points to production-ready practices for teams planning to transition to a fully operational environment.
