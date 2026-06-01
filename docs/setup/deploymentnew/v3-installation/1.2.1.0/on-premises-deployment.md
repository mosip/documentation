# On-Premises Deployment

## 1. Wireguard

- Wireguard bastion server provides a secure private channel to access the MOSIP cluster.
- The bastion server restricts public access and enables access only to clients whose public keys are listed in the Wireguard server.
- The bastion server listens on UDP port 51820.
- If you already have a VPN configured to access nodes privately, skip Wireguard installation and continue using the same VPN.

### Setup Wireguard VM and Wireguard Bastion Server

- Create a Wireguard server VM as per the [**Hardware and Network Requirements**](https://github.com/mosip/documentation/blob/1.2.0/docs/setup/deploymentnew/v3-installation/1.2.0.2/pre-requisites.md).

- Open the required ports on the bastion server VM:

```bash
cd $K8_ROOT/wireguard/
cp hosts.ini.sample hosts.ini
```

> **Note:**
> - Remove the `[Cluster]` section entirely from the copied `hosts.ini` file.
> - Add the following details:
>   - `ansible_host` — public IP of the Wireguard bastion server. e.g. `100.10.20.56`
>   - `ansible_user` — user for installation. In this reference implementation we use the Ubuntu user.
>   - `ansible_ssh_private_key_file` — path to the PEM key for SSH to the Wireguard server. e.g. `~/.ssh/wireguard-ssh.pem`

- Execute `ports.yaml` to open ports at the VM level using ufw:

```bash
ansible-playbook -i hosts.ini ports.yaml
```

> **Note:**
> - PEM file permissions for SSH access must be set to 400: `sudo chmod 400 ~/.ssh/privkey.pem`
> - These ports only need to be opened for UDP packet sharing.
> - Ensure the Wireguard server is reachable on port `51820/udp` at the firewall level.

- Install Docker on the Wireguard VM:

```bash
ansible-playbook -i hosts.ini docker.yaml
```

- Set up the Wireguard server. SSH into the Wireguard VM:

```bash
ssh -i <path-to-.pem> ubuntu@<Wireguard server public IP>
```

- Create a directory for storing Wireguard config files:

```bash
mkdir -p wireguard/config
```

- Install and start the Wireguard server using Docker:

```bash
sudo docker run -d \
  --name=wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Calcutta \
  -e PEERS=30 \
  -p 51820:51820/udp \
  -v /home/ubuntu/wireguard/config:/config \
  -v /lib/modules:/lib/modules \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart unless-stopped \
  ghcr.io/linuxserver/wireguard
```

> **Note:**
> - Increase the number of peers if more than 30 Wireguard client configs are needed (`-e PEERS=30`).
> - Change the mounted directory as needed. All Wireguard configs will be generated in the mounted directory (`-v /home/ubuntu/wireguard/config:/config`).

### Setup Wireguard Client on your PC

- Install the Wireguard client using the steps at [wireguard.com/install](https://www.wireguard.com/install/).

- Assign a `wireguard.conf`. SSH into the Wireguard server VM and navigate to the config directory:

```bash
ssh -i <path-to-.pem> ubuntu@<Wireguard server public IP>
cd /home/ubuntu/wireguard/config
```

- Assign one peer to yourself and use it from your PC to connect to the server.

- Create an `assigned.txt` file to track allocated peer files, and update it each time a peer is assigned:

```
peer1 :   peername
peer2 :   xyz
```

- Use `ls` to see the list of available peers.

- Enter your selected peer directory and update `peer.conf`:

```bash
cd peer1
nano peer1.conf
```

- Make the following changes:
  - Delete the DNS IP line.
  - Update `AllowedIPs` to the subnets CIDR range. e.g. `10.10.20.0/23`

> **Note:**
> - The CIDR range will be provided by the infrastructure provider.
> - Ensure all nodes are covered in the CIDR range (nginx server, Observation K8s cluster nodes, and MOSIP K8s cluster nodes).

- Share the updated `peer.conf` with the respective peer to allow them to connect from their PC.

- Add `peer.conf` to your PC's `/etc/wireguard/` directory as `wg0.conf`.

- Start the Wireguard client and check the status:

```bash
sudo systemctl start wg-quick@wg0
sudo systemctl status wg-quick@wg0
```

- Once connected to Wireguard, you can log in to cluster nodes using their private IPs.

---

## 2. Observation K8s Cluster Setup and Configuration

> **Note:** Cluster creation uses **RKE2** (RKE1 is EOL). The recommended approach is the Ansible-based automated setup from `$K8_ROOT/k8-cluster/on-prem/rke2/ansible`. See the [RKE2 documentation](https://docs.rke2.io/) for full reference.

- Install all the required tools listed in the [Personal Computer Setup](https://github.com/mosip/documentation/blob/1.2.0/docs/setup/deploymentnew/v3-installation/1.2.0.2/pre-requisites.md#personal-computer-requirements) section.
- Ensure the following are installed on all cluster VMs and the client machine: `ufw`, `wget`, `curl`, `kubectl`, `istioctl`, `helm`, `jq`, `ansible` (version > 2.12.4).
- Set up Observation Cluster node VMs per the [hardware and network requirements](https://github.com/mosip/documentation/blob/1.2.0/docs/setup/deploymentnew/v3-installation/1.2.0.2/pre-requisites.md#hardware-requirements).
- Set up passwordless SSH to the cluster nodes via PEM keys (skip if VMs are already accessible via PEM):
  - Generate keys on your PC: `ssh-keygen -t rsa`
  - Copy the keys to remote observation node VMs: `ssh-copy-id <remote-user>@<remote-ip>`
  - Verify SSH access: `ssh -i ~/.ssh/<your-private-key> <remote-user>@<remote-ip>`

> **Note:** Ensure the PEM file permission is set to 400: `sudo chmod 400 ~/.ssh/privkey.pem`

### Step 1 — Prepare Inventory File

Navigate to the ansible directory and create a copy of the sample inventory:

```bash
cd $K8_ROOT/k8-cluster/on-prem/rke2/ansible
cp hosts.ini.sample hosts.ini
```

Update `hosts.ini` with the details of all cluster VMs:

> **Note:**
> - `ansible_host` — internal IP of each node. e.g. `100.10.20.56`, `100.10.20.57`
> - `ansible_user` — user for installation. In this reference implementation we use the Ubuntu user.
> - `ansible_ssh_private_key_file` — path to the PEM key. e.g. `~/.ssh/nodes-ssh.pem`
> - **Sandbox/Development:** comment out the `[etcd]` section in `hosts.ini`.
> - **Production:** ensure all sections including `[etcd]` are fully populated.

### Step 2 — Enable Required Ports

Open the required ports on all nodes using ufw. For the full list of RKE2 networking requirements see [docs.rke2.io](https://docs.rke2.io/install/requirements#networking):

```bash
ansible-playbook -i hosts.ini ports.yaml
```

### Step 3 — Disable Swap

Disable swap on all cluster nodes (skip if already disabled):

```bash
ansible-playbook -i hosts.ini swap.yaml
```

> **Caution:** Verify swap status with `swapon --show` before running this playbook.

> **Note:** RKE2 uses containerd and does **not** require Docker. There is no `docker.yaml` step for RKE2 clusters.

### Step 4 — Run the Main Playbook

Execute the main Ansible playbook to install and configure the RKE2 cluster across all nodes:

```bash
ansible-playbook -i hosts.ini main.yaml
```

This provisions the RKE2 cluster — installing the binary, distributing config to each node type (primary server, secondary servers, etcd, agents), and starting all services automatically.

### Step 5 — Securely Store the Kubeconfig File

After the cluster is successfully created, the kubeconfig file is saved in the `ansible/playbook/` directory as `{{ cluster_domain }}-{{ inventory_hostname }}.yaml`. Copy it to your `.kube` directory:

```bash
cp {{ cluster_domain }}-{{ inventory_hostname }}.yaml $HOME/.kube/<cluster_name>_config
chmod 400 $HOME/.kube/<cluster_name>_config
```

### Step 6 — Access the Cluster

To use this kubeconfig, choose one of the following:

```bash
cp $HOME/.kube/<cluster_name>_config $HOME/.kube/config
```

Alternatively, set the `KUBECONFIG` environment variable:

```bash
export KUBECONFIG="$HOME/.kube/<cluster_name>_config"
```

### Step 7 — Verify Cluster Access

```bash
kubectl get nodes
```

The output should list all nodes of the Observation cluster.

> **Important:** Store the kubeconfig file and the `hosts.ini` used for this deployment in a secure location. They are required for cluster management, adding nodes, and recovery.

---

## 3. Observation K8s Cluster Ingress and Storage Class Setup

Once the cluster is ready, ingress and a storage class must be configured before other applications can be installed.

### 3.a. Nginx Ingress Controller

[Nginx Ingress Controller](https://kubernetes.github.io/ingress-nginx/) is used for ingress in the Rancher cluster.

```bash
cd $K8_ROOT/ingress/ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install \
  ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --version 4.0.18 \
  --create-namespace \
  -f ingress-nginx.values.yaml
```

> **Note:**
> - This installs ingress into the `ingress-nginx` namespace of the Observation cluster.
> - Verify the installation: `kubectl get all -n ingress-nginx`
> - The output should list all pods and deployments in the `ingress-nginx` namespace.

### 3.b. Storage Classes

Multiple storage class options are available for on-premises K8s clusters. This reference deployment uses NFS as the storage class.

- Move to the NFS directory on your personal computer:

```bash
cd $K8_ROOT/storage-class/nfs
```

- Create a copy of `hosts.ini.sample` as `hosts.ini`:

```bash
cp hosts.ini.sample hosts.ini
```

- Update the NFS machine details in `hosts.ini`:

> **Note:**
> - `ansible_host` — internal IP of the NFS server. e.g. `10.12.23.21`
> - `ansible_user` — user for installation. In this reference implementation we use the Ubuntu user.
> - `ansible_ssh_private_key_file` — path to the PEM key. e.g. `~/.ssh/nfs-ssh.pem`

- Confirm the kubeconfig is pointing to the correct Observation cluster:

```bash
kubectl config view
```

> **Note:** The output should show the expected cluster name. If not, update your kubeconfig to point to the correct cluster.

- Open the required firewall ports on the NFS node:

```bash
ansible-playbook -i hosts.ini nfs-ports.yaml
```

- SSH into the NFS node:

```bash
ssh -i ~/.ssh/nfs-ssh.pem ubuntu@<internal IP of NFS server>
```

- Clone the `k8s-infra` repo on the NFS VM:

```bash
git clone https://github.com/mosip/k8s-infra -b v1.2.1.3
```

- Move to the NFS directory and run the install script:

```bash
cd /home/ubuntu/k8s-infra/storage-class/nfs/
sudo ./install-nfs-server.sh
```

> **Note:** The script will prompt for an environment name:
>
> ```
> Please Enter Environment Name: <envName>
> ```
>
> where `envName` is the environment name e.g. `dev`, `qa`, `uat`. The NFS share will be exported at `/srv/nfs/mosip/<envName>`.

- Switch back to your personal computer and run the NFS client provisioner:

```bash
cd $K8_ROOT/storage-class/nfs/
./install-nfs-client-provisioner.sh
```

> **Note:** The script will prompt for:
> - NFS Server: IP of the NFS server.
> - NFS Path: Path for persisted data. e.g. `/srv/nfs/mosip/`

- Post-installation checks:

  - Check the status of the NFS Client Provisioner:

```bash
kubectl -n nfs get deployment.apps/nfs-client-provisioner
```

  - Check the storage class is registered:

```bash
kubectl get storageclass
```

Expected output:

```
NAME                 PROVISIONER                            RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
longhorn (default)   driver.longhorn.io                     Delete          Immediate           true                   57d
nfs-client           cluster.local/nfs-client-provisioner   Delete          Immediate           true                   40s
```

  - Set `nfs-client` as the default storage class:

```bash
kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

---

## 4. Setting up Nginx Server for Observation K8s Cluster

### 4.a. SSL Certificate Setup for TLS Termination

An SSL certificate is required for the Nginx server. If a valid certificate is not available, generate one using Let's Encrypt:

- SSH into the nginx server.

- Install the prerequisites:

```bash
sudo apt update -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update -y
sudo apt-get install python3.8 -y
sudo apt install letsencrypt -y
sudo apt install certbot python3-certbot-nginx -y
```

- Generate a wildcard SSL certificate for your domain:

```bash
sudo certbot certonly --agree-tos --manual --preferred-challenges=dns -d *.org.net
```

> **Note:** Replace `org.net` with your actual domain.

- The DNS challenge requires you to create a TXT record in your DNS service:
  - Host: `_acme-challenge.org.net`
  - Value: the string prompted by the script.

- Wait a few minutes for the DNS entry to propagate. Verify with:

```bash
host -t TXT _acme-challenge.org.net
```

- Press Enter in the `certbot` prompt to proceed.
- Certificates are created in `/etc/letsencrypt/` and are valid for 3 months.
- For certificate renewal, see the [wildcard SSL renewal guide](https://github.com/mosip/k8s-infra/blob/v1.2.1.3/docs/wildcard-ssl-certs-letsencrypt.md#ssl-certificate-renewal).

### 4.b. Install Nginx

- Move to the nginx directory:

```bash
cd $K8_ROOT/nginx/observation
```

- Create a `hosts.ini` file for the nginx server:

```bash
nano hosts.ini
```

- Add the following with the nginx server details and save:

```ini
[nginx]
node-nginx ansible_host=<internal ip> ansible_user=root ansible_ssh_private_key_file=<path-to-.pem>
```

- Open the required ports:

```bash
ansible-playbook -i hosts.ini nginx_ports.yaml
```

- SSH into the nginx server node:

```bash
ssh -i ~/.ssh/<pem-file> ubuntu@<nginx server IP>
```

- From the nginx directory, run the install script:

```bash
cd $K8_ROOT/nginx/observation
sudo ./install.sh
```

- Provide the following inputs when prompted:
  - Rancher nginx IP: internal IP of the nginx server VM.
  - SSL cert path: path to the SSL certificate for TLS termination.
  - SSL key path: path to the SSL key for TLS termination.
  - Cluster node IPs: IPs of the Rancher cluster nodes.

- Post-installation checks:
  - `sudo systemctl status nginx`
  - To uninstall nginx if required: `sudo apt purge nginx nginx-common`
  - **DNS mapping:** Once nginx is installed successfully, create DNS records for the Rancher cluster domains as described in the DNS requirements section (e.g. `rancher.org.net`, `keycloak.org.net`).

---

## 5. Observation K8s Cluster Apps Installation

### 5.a. Rancher UI

Rancher provides full management capability for creating and administering Kubernetes clusters.

- Update `hostname` in `rancher-values.yaml`, then install Rancher using Helm:

```bash
cd $K8_ROOT/observation/rancher-ui
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
helm install rancher rancher-latest/rancher \
  --version 2.6.9 \
  --namespace cattle-system \
  --create-namespace \
  -f rancher-values.yaml
```

- Connect to Wireguard (on Windows via WSL, connect to the Wireguard server from Windows, not from WSL).
- Open the Rancher page in a browser.
- Retrieve the bootstrap password:

```bash
kubectl get secret --namespace cattle-system bootstrap-secret \
  -o go-template='{{ .data.bootstrapPassword|base64decode}}{{ "\n" }}'
```

> **Important:** Assign a strong password and store it securely. It will be needed by the admin.

### 5.b. Keycloak

Keycloak is an OAuth 2.0-compliant Identity and Access Management (IAM) system used to manage access to Rancher for cluster administration.

```bash
cd $K8_ROOT/observation/keycloak
./install.sh <iam.host.name>
```

After installation, access Keycloak at `iam.mosip.net` and retrieve credentials as per the post-installation steps.

### 5.c. Keycloak — Rancher UI Integration

- Log in as the `admin` user in Keycloak and ensure the `email` and `firstName` fields are populated for the admin user. These fields are required for Rancher authentication.

- In Keycloak (in the `master` realm), create a new client with the following values:
  - `Client ID`: `https://<your-rancher-host>/v1-saml/keycloak/saml/metadata`
  - `Client Protocol`: `saml`
  - `Root URL`: *(leave empty)*

- After saving, configure the client with the following settings:

| Field | Value |
|-------|-------|
| Name | `rancher` |
| Enabled | `ON` |
| Login Theme | `keycloak` |
| Sign Documents | `ON` |
| Sign Assertions | `ON` |
| Encrypt Assertions | `OFF` |
| Client Signature Required | `OFF` |
| Force POST Binding | `OFF` |
| Front Channel Logout | `OFF` |
| Force Name ID Format | `OFF` |
| Name ID Format | `username` |
| Valid Redirect URIs | `https://<your-rancher-host>/v1-saml/keycloak/saml/acs` |
| IDP Initiated SSO URL Name | `IdPSSOName` |

- In the same client, go to the `Mappers` tab and create the following mappers:

  **Mapper 1 — username:**

  | Field | Value |
  |-------|-------|
  | Protocol | `saml` |
  | Name | `username` |
  | Mapper Type | `User Property` |
  | Property | `username` |
  | Friendly Name | `username` |
  | SAML Attribute Name | `username` |
  | SAML Attribute NameFormat | `Basic` |

  **Mapper 2 — groups:**

  | Field | Value |
  |-------|-------|
  | Protocol | `saml` |
  | Name | `groups` |
  | Mapper Type | `Group List` |
  | Group Attribute Name | `member` |
  | Friendly Name | *(leave empty)* |
  | SAML Attribute NameFormat | `Basic` |
  | Single Group Attribute | `ON` |
  | Full Group Path | `OFF` |

- Click `Add Builtin` → select all → `Add Selected`.

- Download the Keycloak SAML descriptor XML from:

```
https://<your-keycloak-host>/auth/realms/master/protocol/saml/descriptor
```

- Generate a self-signed SSL certificate and key (if not already available):

```bash
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
  -keyout myservice.key -out myservice.cert
```

- In Rancher UI, navigate to: `Users & Authentication` → `Auth Providers` → `Keycloak (SAML)`

- Configure the fields as follows:

| Field | Value |
|-------|-------|
| Display Name Field | `givenName` |
| User Name Field | `email` or `uid` |
| UID Field | `username` |
| Groups Field | `member` |
| Entity ID Field | *(leave empty)* |
| Rancher API Host | `https://<your-rancher-host>` |

- Upload the following files:
  - `Private Key`: `myservice.key`
  - `Certificate`: `myservice.cert`
  - `SAML Metadata XML`: content from the Keycloak descriptor URL above

- Click **Enable** to activate Keycloak authentication. After successful integration, Rancher users can log in using their Keycloak credentials.

### 5.d. RBAC for Rancher using Keycloak

- Assign **cluster** and **project** roles in Rancher for Keycloak users. Add all namespaces under the `default` project. Non-admin users can be granted the Read-Only role at the project level.
- To create custom roles, follow the steps [here](https://github.com/mosip/k8s-infra/blob/v1.2.1.3/docs/create-custom-role.md).

- To add a member to a cluster or project in Rancher:
  - Navigate to RBAC cluster members.
  - Add the member name exactly as the `username` in Keycloak.
  - Assign an appropriate role (e.g. Cluster Owner, Cluster Viewer).

- To add a group to a cluster or project in Rancher:
  - Navigate to RBAC cluster members.
  - Click `Add` and select a group from the dropdown.
  - Assign an appropriate role.
  - Note: a user must be a member of the group to add it.

- To create a Keycloak group:
  - Go to the `Groups` section in Keycloak and create a group with default roles.
  - In the `Users` section, select a user, go to the `Groups` tab, and add the user to the required group.

---

## 6. MOSIP K8s Cluster Setup

> **Note:** Cluster creation uses **RKE2** (RKE1 is EOL). The recommended approach is the Ansible-based automated setup from `$K8_ROOT/k8-cluster/on-prem/rke2/ansible`. See the [RKE2 documentation](https://docs.rke2.io/) for full reference.

- Install the following tools on your PC and all cluster VMs: `kubectl`, `helm`, `ansible` (version > 2.12.4), `ufw`, `wget`, `curl`, `istioctl`, `jq`.

- Add the required Helm repositories:

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add mosip https://mosip.github.io/mosip-helm
```

- Set up MOSIP K8s Cluster node VMs per the [Hardware and Network Requirements](https://github.com/mosip/documentation/blob/1.2.0/docs/setup/deploymentnew/v3-installation/1.2.0.2/pre-requisites.md).

- Set up passwordless SSH to the cluster nodes via PEM keys (skip if VMs are already accessible via PEM):
  - Generate keys on your PC: `ssh-keygen -t rsa`
  - Copy keys to remote cluster node VMs: `ssh-copy-id <remote-user>@<remote-ip>`
  - Verify SSH access: `ssh -i ~/.ssh/<your-private-key> <remote-user>@<remote-ip>`

### Step 1 — Prepare Inventory File

Navigate to the ansible directory and create a copy of the sample inventory:

```bash
cd $K8_ROOT/k8-cluster/on-prem/rke2/ansible
cp hosts.ini.sample hosts.ini
```

Update `hosts.ini` with the details of all MOSIP cluster VMs:

> **Note:**
> - `ansible_host` — internal IP of each node. e.g. `100.10.20.56`, `100.10.20.57`
> - `ansible_user` — user for installation. In this reference implementation we use the Ubuntu user.
> - `ansible_ssh_private_key_file` — path to the PEM key. e.g. `~/.ssh/nodes-ssh.pem`
> - **Sandbox/Development:** comment out the `[etcd]` section in `hosts.ini`.
> - **Production:** ensure all sections including `[etcd]` are fully populated.

### Step 2 — Enable Required Ports

Open the required ports on all nodes. For the full list of RKE2 networking requirements see [docs.rke2.io](https://docs.rke2.io/install/requirements#networking):

```bash
ansible-playbook -i hosts.ini ports.yaml
```

### Step 3 — Disable Swap

Disable swap on all cluster nodes (skip if already disabled):

```bash
ansible-playbook -i hosts.ini swap.yaml
```

> **Caution:** Verify swap status with `swapon --show` before running this playbook.

> **Note:** RKE2 uses containerd and does **not** require Docker. There is no `docker.yaml` step for RKE2 clusters.

### Step 4 — Run the Main Playbook

Execute the main Ansible playbook to install and configure the RKE2 cluster across all nodes:

```bash
ansible-playbook -i hosts.ini main.yaml
```

This provisions the RKE2 cluster — installing the binary, distributing config to each node type (primary server, secondary servers, etcd, agents), and starting all services automatically.

### Step 5 — Securely Store the Kubeconfig File

After the cluster is successfully created, the kubeconfig file is saved in the `ansible/playbook/` directory as `{{ cluster_domain }}-{{ inventory_hostname }}.yaml`. Copy it to your `.kube` directory:

```bash
cp {{ cluster_domain }}-{{ inventory_hostname }}.yaml $HOME/.kube/<cluster_name>_config
chmod 400 $HOME/.kube/<cluster_name>_config
```

### Step 6 — Access the Cluster

To use this kubeconfig, choose one of the following:

```bash
cp $HOME/.kube/<cluster_name>_config $HOME/.kube/config
```

Alternatively, set the `KUBECONFIG` environment variable:

```bash
export KUBECONFIG="$HOME/.kube/<cluster_name>_config"
```

### Step 7 — Verify Cluster Access

```bash
kubectl get nodes
```

The output should list all nodes of the MOSIP cluster.

> **Important:** Store the kubeconfig file and the `hosts.ini` used for this deployment in a secure location. They are required for cluster management, adding nodes, and recovery.

---

## 7. MOSIP K8s Cluster Global ConfigMap, Ingress, and Storage Class Setup

### 7.a. Global ConfigMap

The global ConfigMap contains common configuration values shared across all namespaces in the cluster.

```bash
cd $INFRA_ROOT/deployment/v3/external
cp global_configmap.yaml.sample global_configmap.yaml
```

Update the domain names in `global_configmap.yaml`, then apply:

```bash
kubectl apply -f global_configmap.yaml
```

### 7.b. Istio Ingress Setup

[Istio](https://istio.io/) is a service mesh for the MOSIP K8s cluster. It provides transparent layers over existing microservices, enabling a uniform way to secure, connect, and monitor services.

```bash
cd $K8_ROOT/ingress/istio-mesh/nodeport
./install.sh
```

This will bring up all Istio components and the Ingress Gateways. Verify the Ingress Gateway services:

```bash
kubectl get svc -n istio-system
```

> **Note:** The response should include the following services:
> - `istio-ingressgateway` — external-facing Istio service.
> - `istio-ingressgateway-internal` — internal-facing Istio service.
> - `istiod` — Istio daemon that replicates changes to all Envoy filters.

### 7.c. Storage Classes

Multiple storage class options are available for on-premises K8s clusters. This reference deployment uses NFS as the storage class.

- Move to the NFS directory on your personal computer:

```bash
cd $K8_ROOT/storage-class/nfs
```

- Create a copy of `hosts.ini.sample` as `hosts.ini`:

```bash
cp hosts.ini.sample hosts.ini
```

- Update the NFS machine details in `hosts.ini`:

> **Note:**
> - `ansible_host` — internal IP of the NFS server. e.g. `10.12.23.21`
> - `ansible_user` — user for installation. In this reference implementation we use the Ubuntu user.
> - `ansible_ssh_private_key_file` — path to the PEM key. e.g. `~/.ssh/nfs-ssh.pem`

- Confirm the kubeconfig is pointing to the correct MOSIP cluster:

```bash
kubectl config view
```

> **Note:** The output should show the expected cluster name. If not, update your kubeconfig to point to the correct cluster.

- Open the required firewall ports on the NFS node:

```bash
ansible-playbook -i hosts.ini nfs-ports.yaml
```

- SSH into the NFS node:

```bash
ssh -i ~/.ssh/nfs-ssh.pem ubuntu@<internal IP of NFS server>
```

- Clone the `k8s-infra` repo on the NFS VM:

```bash
git clone https://github.com/mosip/k8s-infra -b v1.2.1.3
```

- Move to the NFS directory and run the install script:

```bash
cd /home/ubuntu/k8s-infra/storage-class/nfs/
sudo ./install-nfs-server.sh
```

> **Note:** The script will prompt for an environment name:
>
> ```
> Please Enter Environment Name: <envName>
> ```
>
> where `envName` is the environment name e.g. `dev`, `qa`, `uat`. The NFS share will be exported at `/srv/nfs/mosip/<envName>`.

- Switch back to your personal computer and run the NFS client provisioner:

```bash
cd $K8_ROOT/storage-class/nfs/
./install-nfs-client-provisioner.sh
```

> **Note:** The script will prompt for:
> - NFS Server: IP of the NFS server.
> - NFS Path: Path for persisted data. e.g. `/srv/nfs/mosip/`

- Post-installation checks:

  - Check the status of the NFS Client Provisioner:

```bash
kubectl -n nfs get deployment.apps/nfs-client-provisioner
```

  - Check the storage class is registered:

```bash
kubectl get storageclass
```

---

## 8. Import MOSIP Cluster into Rancher UI

- Log in as admin in the Rancher console.
- Select `Import Existing` for cluster addition.
- Select `Generic` as the cluster type.
- Fill in the `Cluster Name` field with a unique name and click `Create`.
- Copy the generated `kubectl` command and execute it from your PC (ensure your kubeconfig is set to the MOSIP cluster):

```bash
kubectl apply -f https://rancher.e2e.mosip.net/v3/import/<generated-token>.yaml
```

- Wait a few seconds for the cluster to be verified. The cluster will then appear in the Rancher management console.

---

## 9. MOSIP K8s Cluster Nginx Server Setup

### 9.a. SSL Certificate Creation

An SSL certificate is required for the Nginx server. If a valid certificate is not available, generate one using Let's Encrypt:

- SSH into the nginx server.

- Install the prerequisites:

```bash
sudo apt update -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update -y
sudo apt-get install python3.8 -y
sudo apt install letsencrypt -y
sudo apt install certbot python3-certbot-nginx -y
```

- Generate a wildcard SSL certificate for your domain:

```bash
sudo certbot certonly --agree-tos --manual --preferred-challenges=dns \
  -d *.sandbox.mosip.net -d sandbox.mosip.net
```

> **Note:** Replace `sandbox.mosip.net` with your actual domain.

- The DNS challenge requires you to create a TXT record in your DNS service:
  - Host: `_acme-challenge.sandbox.mosip.net`
  - Value: the string prompted by the script.

- Wait a few minutes for the DNS entry to propagate. Verify with:

```bash
host -t TXT _acme-challenge.sandbox.mosip.net
```

- Press Enter in the `certbot` prompt to proceed.
- Certificates are created in `/etc/letsencrypt/` and are valid for 3 months.
- For certificate renewal, see the [wildcard SSL renewal guide](https://github.com/mosip/k8s-infra/blob/v1.2.1.3/docs/wildcard-ssl-certs-letsencrypt.md#ssl-certificate-renewal).

### 9.b. Nginx Server Setup for MOSIP K8s Cluster

- Move to the nginx directory:

```bash
cd $K8_ROOT/nginx/mosip
```

- Create a `hosts.ini` file for the nginx server:

```bash
nano hosts.ini
```

- Add the following with nginx server details and save:

```ini
[nginx]
node-nginx ansible_host=<internal ip> ansible_user=root ansible_ssh_private_key_file=<path-to-.pem>
```

- Open the required ports:

```bash
ansible-playbook -i hosts.ini nginx_ports.yaml
```

- SSH into the nginx server node:

```bash
ssh -i ~/.ssh/<pem-file> ubuntu@<nginx server IP>
```

- From the nginx directory, run the install script:

```bash
cd $K8_ROOT/nginx/mosip
sudo ./install.sh
```

- Provide the following inputs when prompted:
  - MOSIP nginx server internal IP.
  - MOSIP nginx server public IP.
  - Publicly accessible domains (comma-separated, no whitespace).
  - SSL cert path.
  - SSL key path.
  - Cluster node IPs (comma-separated, no whitespace).

- Post-installation checks:
  - `sudo systemctl status nginx`
  - To uninstall nginx if required: `sudo apt purge nginx nginx-common`
  - **DNS mapping:** Once nginx is installed successfully, create DNS records for the MOSIP cluster domains as described in the DNS requirements section.

### 9.c. Verify Nginx and Istio Wiring

Install `httpbin` — a utility that echoes HTTP headers received inside the cluster, useful for debugging ingress and header routing:

```bash
cd $K8_ROOT/utils/httpbin
./install.sh
```

Test external and internal ingress (replace with your actual domain):

```bash
curl https://api.sandbox.xyz.net/httpbin/get?show_env=true
curl https://api-internal.sandbox.xyz.net/httpbin/get?show_env=true
```

---

## 10. Monitoring Module Deployment

> **Note:**
> - Monitoring is optional in sandbox environments.
> - For production environments, alternative monitoring tools may be used.
> - These steps can be skipped in development environments if monitoring is not needed.
> - If skipping, run the following commands to install the monitoring CRD, which is required by MOSIP services:
>
> ```bash
> helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
> helm repo update
> kubectl create ns cattle-monitoring-system
> helm -n cattle-monitoring-system install rancher-monitoring-crd mosip/rancher-monitoring-crd
> ```

- Prometheus, Grafana, and Alertmanager are used for cluster monitoring.
- In Rancher console, go to `Apps & Marketplaces` and select the `Monitoring` app.
- In the Helm options, open the YAML file and disable the Nginx Ingress:

```yaml
ingressNginx:
  enabled: false
```

- Click `Install`.

---

## 11. Alerting Setup

> **Note:**
> - Alerting is optional in sandbox environments.
> - For production environments, alternative alerting tools may be used.
> - These steps can be skipped in development environments if alerting is not needed.

- Alerting is part of cluster monitoring. Alert notifications are sent to a configured email address or Slack channel.
- Monitoring (Prometheus, Grafana, Alertmanager) must be deployed before setting up alerting.

- Create a [Slack incoming webhook](https://api.slack.com/messaging/webhooks).

- Update `slack_api_url` and the Slack channel name in `alertmanager.yml`:

```bash
cd $K8_ROOT/alerting/
nano alertmanager.yml
```

Update the following values:

```yaml
global:
  resolve_timeout: 5m
  slack_api_url: <YOUR-SLACK-API-URL>
...
slack_configs:
  - channel: '<YOUR-CHANNEL-HERE>'
    send_resolved: true
```

- Update the cluster name in `patch-cluster-name.yaml`:

```bash
cd $K8_ROOT/alerting/
nano patch-cluster-name.yaml
```

Update:

```yaml
spec:
  externalLabels:
    cluster: <YOUR-CLUSTER-NAME-HERE>
```

- Install the default and custom alerts:

```bash
cd $K8_ROOT/alerting/
./install.sh
```

---

## 12. Logging Module Setup and Installation

> **Note:**
> - Logging is optional in sandbox environments.
> - For production environments, alternative logging tools may be used.
> - These steps can be skipped in development environments if logging is not needed.

MOSIP uses [Rancher Fluentd](https://ranchermanager.docs.rancher.com/v2.0-v2.4/explanations/integrations-in-rancher/cluster-logging/fluentd) and Elasticsearch to collect logs from all services and display them in a Kibana dashboard.

- Install the Rancher FluentD system (required to scrape logs from all MOSIP microservices):
  - In Rancher UI, go to `Apps & Marketplaces` and install the Logging app.
  - Select chart version `100.1.3+up3.17.7`.

- Configure Rancher FluentD. Create the `clusteroutput`:

```bash
kubectl apply -f clusteroutput-elasticsearch.yaml
```

- Create the `clusterflow`:

```bash
kubectl apply -f clusterflow-elasticsearch.yaml
```

- Install Elasticsearch, Kibana, and Istio addons:

```bash
cd $K8_ROOT/logging
./install.sh
```

- Set the `min_age` value in `elasticsearch-ilm-script.sh` (the minimum number of days to retain indices in Elasticsearch), then execute it:

```bash
cd $K8_ROOT/logging
./elasticsearch-ilm-script.sh
```

- MOSIP provides the following Kibana dashboards:

| Dashboard file | Description |
|----------------|-------------|
| [01-logstash.ndjson](https://github.com/mosip/k8s-infra/blob/v1.2.1.3/logging/dashboards/01-logstash.ndjson) | Logstash index pattern required by all other dashboards |
| [02-error-only-logs.ndjson](https://github.com/mosip/k8s-infra/blob/v1.2.1.3/logging/dashboards/02-error-only-logs.ndjson) | Shows only error-level logs (`MOSIP Error Logs` dashboard) |
| [03-service-logs.ndjson](https://github.com/mosip/k8s-infra/blob/v1.2.1.3/logging/dashboards/03-service-logs.ndjson) | Shows all logs for a specific service (`MOSIP Service Logs` dashboard) |
| [04-insight.ndjson](https://github.com/mosip/k8s-infra/blob/v1.2.1.3/logging/dashboards/04-insight.ndjson) | Shows MOSIP process insights such as UINs generated and packets uploaded (`MOSIP Insight` dashboard) |
| [05-response-time.ndjson](https://github.com/mosip/k8s-infra/blob/v1.2.1.3/logging/dashboards/05-response-time.ndjson) | Shows API response time trends across MOSIP services (`Response Time` dashboard) |

- Import dashboards:

```bash
cd $K8_ROOT/logging
./load_kibana_dashboards.sh ./dashboards <cluster-kube-config-file>
```

- View dashboards: open Kibana at `https://kibana.sandbox.xyz.net`, then navigate to **Menu** → **Dashboard** → select a dashboard.

---

## 13. MOSIP External Dependencies Setup

External dependencies include all external components required by MOSIP's core services: database (PostgreSQL), object store (MinIO), HSM, and others.

```bash
cd $INFRA_ROOT/deployment/v3/external/all
./install-all.sh
```

See the [detailed installation instructions](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-external-dependencies) for all external components.

> **Note:** After installation, connect to the `mosip_pms` PostgreSQL database and extend the `valid_to_date` for `mpolicy-default-mobile`:
>
> ```bash
> psql -h <host> -p 5432 -U postgres -d mosip_pms
> ```
>
> ```sql
> UPDATE pms.auth_policy
> SET valid_to_date = valid_to_date + interval '1 year'
> WHERE name = 'mpolicy-default-mobile';
> ```

---

## 14. MOSIP Modules Deployment

With the Kubernetes cluster and all external dependencies in place, proceed with MOSIP service deployment.

```bash
cd $INFRA_ROOT/deployment/v3/mosip/all
./install-all.sh
```

> **Note:**
> - If `install-all.sh` fails at any point, follow the [MOSIP Modules Deployment](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-modules-deployment) guide from the point of failure.
> - The config-server and admin service may experience startup delays in this version. Apply the following fixes if needed:
>
> **For config-server** — increase `failureThreshold` for `startupProbe` to 60:
>
> ```bash
> kubectl -n config-server edit deployment config-server
> ```
>
> **For admin-service** — increase `failureThreshold` for `startupProbe` to 60:
>
> ```bash
> kubectl -n admin edit deployment admin-service
> ```
>
> Once admin-service is running, re-execute `install.sh` after commenting out the following lines:
>
> ```bash
> #echo Installing Admin-Proxy into Masterdata and Keymanager.
> #kubectl -n $NS apply -f admin-proxy.yaml
> #echo Installing admin hotlist service.
> #helm -n $NS install admin-hotlist mosip/admin-hotlist --version $CHART_VERSION
> #echo Installing admin service. Will wait till service gets installed.
> #helm -n $NS install admin-service mosip/admin-service \
> #  --set istio.corsPolicy.allowOrigins\[0\].prefix=https://$ADMIN_HOST \
> #  --wait --version $CHART_VERSION
> ```

---

## 15. API Testrig

MOSIP's successful deployment can be verified by running the API testrig and comparing results against the testrig benchmark.

- Navigate to the Infra Root Directory:

```bash
cd $INFRA_ROOT
```

- Clone the Functional Tests repository:

```bash
git clone -b v1.3.3 https://github.com/mosip/mosip-functional-tests.git
```

- Move to the apitestrig deployment directory:

```bash
cd $INFRA_ROOT/mosip-functional-tests/deploy/apitestrig
```

- Make the script executable:

```bash
chmod +x copy_cm_func.sh
```

- Run the installer:

```bash
./install.sh
```

> **Note:** The script prompts for the following inputs:
> - Cronjob hour (0–23): e.g. `6` for 6 AM.
> - Do you have a public domain and valid SSL certificate? (Y/n)
> - Retention days for old reports (default: 3).
> - Slack Webhook URL for server issue notifications.
> - Is the eSignet service deployed? (yes/no) — if `no`, eSignet-related test cases are skipped.
> - Is `values.yaml` for the apitestrig chart configured as part of prerequisites? (Y/n)
> - Do you have S3 details for storing API-Testrig reports? (Y/n)

---

## 16. DSL Rig

### Install Packetcreator

- Navigate to the packetcreator directory:

```bash
cd $INFRA_ROOT/deployment/v3/testrig/packetcreator
```

- Run the installation script:

```bash
./install.sh
```

- Provide the following inputs when prompted:
  - NFS Host:
  - NFS PEM File:
  - User for SSH Login: `ubuntu`
  - Ingress Controller Type: select `2` for Istio.

### Install DSL Rig

- Navigate to the dslrig directory:

```bash
cd $INFRA_ROOT/deployment/v3/testrig/dslrig
```

- Run the installation script:

```bash
./install.sh
```

> **Note:** Before running `install.sh`, ensure the following flag is included in the Helm install command:
>
> ```
> --set dslorchestrator.configmaps.dslorchestrator.servicesNotDeployed="esignet"
> ```
>
> The full Helm install command should look like:
>
> ```bash
> helm -n $NS install dslorchestrator mosip/dslorchestrator \
>   --set crontime="0 $time * * *" \
>   --version $CHART_VERSION \
>   --set dslorchestrator.configmaps.s3.s3-host='http://minio.minio:9000' \
>   --set dslorchestrator.configmaps.s3.s3-user-key='admin' \
>   --set dslorchestrator.configmaps.s3.s3-region='' \
>   --set dslorchestrator.configmaps.db.db-server="$DB_HOST" \
>   --set dslorchestrator.configmaps.db.db-su-user="postgres" \
>   --set dslorchestrator.configmaps.db.db-port="5432" \
>   --set dslorchestrator.configmaps.dslorchestrator.USER="$USER" \
>   --set dslorchestrator.configmaps.dslorchestrator.ENDPOINT="https://$API_INTERNAL_HOST" \
>   --set dslorchestrator.configmaps.dslorchestrator.packetUtilityBaseUrl="$packetUtilityBaseUrl" \
>   --set persistence.nfs.server="$NFS_HOST" \
>   --set persistence.nfs.path="/srv/nfs/mosip/dsl-scenarios/$ENV_NAME" \
>   --set dslorchestrator.configmaps.dslorchestrator.reportExpirationInDays="$reportExpirationInDays" \
>   --set dslorchestrator.configmaps.dslorchestrator.NS="$NS" \
>   --set dslorchestrator.configmaps.dslorchestrator.servicesNotDeployed="esignet" \
>   $ENABLE_INSECURE
> ```
>
> When prompted, provide the following inputs:
> - NFS Host:
> - NFS PEM:
> - User for SSH Login: `ubuntu`
> - Cronjob hour (0–23).
> - Do you have a public domain and valid SSL certificate? (Y/n)
> - Packet Utility Base URL: `https://packetcreator.packetcreator:80/v1/packetcreator`
> - Retention days for old reports (default: 3).

---
