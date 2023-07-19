Overview
---------

*   MOSIP modules are deployed in the form of microservices in a Kubernetes cluster.
    
*   [Wireguard](https://www.wireguard.com/) is used as a trust network extension to access the admin, control, and observation pane
    
*   It is also used for on-the-field registrations.
    
*   MOSIP uses AWS load balancers for:
    
    *   SSL termination
        
    *   Reverse Proxy
        
    *   CDN/Cache management
        
    *   Loadbalancing
        
*   Kubernetes cluster is administered using the [Rancher](https://rancher.com/docs/rancher/v1.3/en/kubernetes/#rancher-ui) and [EKS](https://docs.aws.amazon.com/whitepapers/latest/overview-deployment-options/amazon-elastic-kubernetes-service.html)
    
*   In V3, we have two Kubernetes clusters:
    
    *   Observation Cluster - This cluster is a part of the observation plane and it helps in administrative tasks. By design, this is kept independent of the actual cluster as a good security practice and to ensure clear segregation of roles and responsibilities. As a best practice, this cluster or its services should be internal and should never be exposed to the external world.
        
        *   [Rancher](https://rancher.com/docs/rancher/v1.3/en/kubernetes/#rancher-ui) is used for managing the Mosip cluster.
            
        *   [Keycloak](https://www.keycloak.org/) in this cluster is used for cluster user access management.
            
        *   It is recommended to configure log monitoring and network monitoring in this cluster.
            
        *   In case you have a internal container registry, then it should run here.
            
    *   MOSIP Cluster - This cluster runs all the MOSIP components and certain third party components to secure the cluster, API’s and Data.
        
        *   [MOSIP External Components](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/external/README.md#mosip-external-components)
            
        *   [Mosip Services](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/mosip/README.md#mosip-services)
            

Deployment Repos
-----------------

*   [k8s-infra](https://github.com/mosip/k8s-infra/tree/v1.2.0.1-B1) : contains scripts to install and configure Kubernetes cluster with required monitoring, logging and alerting tools.
    
*   [mosip-infra](https://github.com/mosip/mosip-infra/tree/v1.2.0.1-B1/deployment/v3) : contains deployment scripts to run charts in defined sequence.
    
*   [mosip-config](https://github.com/mosip/mosip-config/tree/v1.2.0.1-B1) : contains all the configuration files required by the MOSIP modules.
    
*   [mosip-helm](https://github.com/mosip/mosip-helm/tree/v1.2.0.1-B1) : contains packaged helm charts for all the MOSIP modules.
    

Pre-requisites:
---------------

### Hardware Requirements

VM’s required have any Operating System and can be selected as per convenience.  
In this installation guide, we are referring to `Ubuntu OS` throughout.

<table data-layout="wide" data-local-id="108428f4-b00b-42ab-91d2-7d64f8ea5be7" class="confluenceTable"><colgroup><col><col style="width: 358.0px;"><col style="width: 78.0px;"><col style="width: 70.0px;"><col style="width: 132.0px;"><col style="width: 140.0px;"><col style="width: 140.0px;"></colgroup><tbody><tr><th class="numberingColumn confluenceTh"></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>Purpose</strong></p></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>vCPU’s</strong></p></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>RAM</strong></p></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>Storage (HDD)</strong></p></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>no. of VM’s</strong></p></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>HA</strong></p></th></tr><tr><td class="numberingColumn confluenceTd">1</td><td class="confluenceTd"><p>Wireguard Bastion Host</p></td><td class="confluenceTd"><p>2</p></td><td class="confluenceTd"><p>4 GB</p></td><td class="confluenceTd"><p>8 GB</p></td><td class="confluenceTd"><p>1</p></td><td class="confluenceTd"><p>(ensure to setup active-passive)</p></td></tr><tr><td class="numberingColumn confluenceTd">2</td><td class="confluenceTd"><p>Rancher Cluster nodes (EKS managed)</p></td><td class="confluenceTd"><p>2</p></td><td class="confluenceTd"><p>8 GB</p></td><td class="confluenceTd"><p>32 GB</p></td><td class="confluenceTd"><p>2</p></td><td class="confluenceTd"><p>2</p></td></tr><tr><td class="numberingColumn confluenceTd">3</td><td class="confluenceTd"><p>Mosip Cluster nodes (EKS managed)</p></td><td class="confluenceTd"><p>8</p></td><td class="confluenceTd"><p>32 GB</p></td><td class="confluenceTd"><p>64 GB</p></td><td class="confluenceTd"><p>6</p></td><td class="confluenceTd"><p>6</p></td></tr></tbody></table>

### Network Requirements

*   All the VM's should be able to communicate with each other.
    
*   Need stable Intra network connectivity between these VM's.
    
*   All the VM's should have stable internet connectivity for docker image download (in case of local setup ensure to have a locally accesible docker registry).
    
*   During the process, we will be creating two loadbalancers as mentioned in the first table below:
    
*   Server Interface requirement as mentioned in the second table:
    

<table data-layout="wide" data-local-id="b1b6584b-363c-4443-a6b5-51f38f8ad1a0" class="confluenceTable"><colgroup><col style="width: 273.0px;"><col style="width: 685.0px;"></colgroup><tbody><tr><th class="confluenceTh"><p><strong>Loadbalancer</strong></p></th><th class="confluenceTh"><p><strong>Purpose</strong></p></th></tr><tr><td class="confluenceTd"><p>Private loadbalancer Observation cluster</p></td><td class="confluenceTd"><p>This will be used to access Rancher dashboard and keycloak of observation cluster.</p><p>Note: access to this will be restricted only with wireguard key holders.</p></td></tr><tr><td class="confluenceTd"><p>Public loadbalancer MOSIP cluster</p></td><td class="confluenceTd"><p>This will be used to access below mentioned services:</p><ul><li><p>Pre-registration</p></li><li><p>Esignet</p></li><li><p>IDA</p></li><li><p>Partner management service api’s</p></li><li><p>Mimoto</p></li><li><p>Mosip file server</p></li><li><p>Resident</p></li></ul></td></tr><tr><td class="confluenceTd"><p>Private loadbalancer MOSIP cluster</p></td><td class="confluenceTd"><p>This will be used to access all the services deployed as part of the setup inclusing external as well as all the MOSIP services.</p><p>Note: access to this will be restricted only with wireguard key holders.</p></td></tr></tbody></table>

<table data-layout="wide" data-local-id="557c067b-15fa-4af3-af2e-fb9080d0dcd6" class="confluenceTable"><colgroup><col><col style="width: 232.0px;"><col style="width: 728.0px;"></colgroup><tbody><tr><th class="numberingColumn confluenceTh"></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>Purpose VM</strong></p></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>Network Interfaces</strong></p></th></tr><tr><td class="numberingColumn confluenceTd">1</td><td class="confluenceTd"><p>Wireguard Bastion Host</p></td><td class="confluenceTd"><ul><li><p>One Private interface: that is on the same network as all the rest of nodes. (Eg: inside local NAT Network )</p></li><li><p>One public interface: Either has a direct public IP, or a firewall NAT (global address) rule that forwards traffic on 51820/udp port to this interface ip.</p></li></ul></td></tr></tbody></table>

### DNS Requirements

<table data-layout="wide" data-local-id="067f0108-de70-41af-a662-2bb21c705bda" class="confluenceTable"><colgroup><col><col style="width: 226.67px;"><col style="width: 226.67px;"><col style="width: 226.67px;"></colgroup><tbody><tr><th class="numberingColumn confluenceTh"></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>Domain name</strong></p></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>Mapping details</strong></p></th><th data-highlight-colour="var(--ds-background-neutral, #F4F5F7)" class="confluenceTh"><p><strong>Purpose</strong></p></th></tr><tr><td class="numberingColumn confluenceTd">1</td><td class="confluenceTd"><p><a href="http://rancher.xyz.net" class="external-link" rel="nofollow">rancher.xyz.net</a></p></td><td class="confluenceTd"><p>Load balancer of Observation cluster</p></td><td class="confluenceTd"><p>Rancher dashboard to monitor and manage the kubernetes cluster. You can share an existing rancher cluser.</p></td></tr><tr><td class="numberingColumn confluenceTd">2</td><td class="confluenceTd"><p><a href="http://keycloak.xyz.net" class="external-link" rel="nofollow">keycloak.xyz.net</a></p></td><td class="confluenceTd"><p>Load balancer of Observation cluster</p></td><td class="confluenceTd"><p>Administrative IAM tool (keycloak). This is for the kubernetes administration.</p></td></tr><tr><td class="numberingColumn confluenceTd">3</td><td class="confluenceTd"><p><a href="http://sandbox.xyx.net" class="external-link" rel="nofollow">sandbox.xyx.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Index page for links to different dashboards of Mosip env. (This is just for reference, Please do not expose this page in a real production or uat environment)</p></td></tr><tr><td class="numberingColumn confluenceTd">4</td><td class="confluenceTd"><p><a href="http://api-internal.sandbox.xyz.net" class="external-link" rel="nofollow">api-internal.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Internal API’s are exposed through this domain. They are accessible privately over wireguard channel</p></td></tr><tr><td class="numberingColumn confluenceTd">5</td><td class="confluenceTd"><p><a href="http://api.sandbox.xyx.net" class="external-link" rel="nofollow">api.sandbox.xyx.net</a></p></td><td class="confluenceTd"><p>Public Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>All the API’s that are publically usable are exposed using this domain.</p></td></tr><tr><td class="numberingColumn confluenceTd">6</td><td class="confluenceTd"><p><a href="http://prereg.sandbox.xyz.net" class="external-link" rel="nofollow">prereg.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Public Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Domain name for Mosip’s pre-registration portal. The portal is accessible publicly.</p></td></tr><tr><td class="numberingColumn confluenceTd">7</td><td class="confluenceTd"><p><a href="http://activemq.sandbox.xyx.net" class="external-link" rel="nofollow">activemq.sandbox.xyx.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Provides direct access to activemq dashboard. Its limited and can be used only over wireguard</p></td></tr><tr><td class="numberingColumn confluenceTd">8</td><td class="confluenceTd"><p><a href="http://kibana.sandbox.xyx.net" class="external-link" rel="nofollow">kibana.sandbox.xyx.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Optional instalation. Used to access kibana dashboard over wireguard</p></td></tr><tr><td class="numberingColumn confluenceTd">9</td><td class="confluenceTd"><p><a href="http://regclient.sandbox.xyz.net" class="external-link" rel="nofollow">regclient.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Regclient can be downloaded from this domain. It should be used over wireguard.</p></td></tr><tr><td class="numberingColumn confluenceTd">10</td><td class="confluenceTd"><p><a href="http://admin.sandbox.xyz.net" class="external-link" rel="nofollow">admin.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Mosip’s admin portal is exposed using this domain. This is an internal domain and is restricted to access over wireguard</p></td></tr><tr><td class="numberingColumn confluenceTd">11</td><td class="confluenceTd"><p><a href="http://object-store.sandbox.xyx.net" class="external-link" rel="nofollow">object-store.sandbox.xyx.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Optional- This domain is used to access the object server. Based on the object server that you choose map this domain accordingly. In our reference implementation Minio is used and this domain lets you access Minio’s Console over wireguard</p></td></tr><tr><td class="numberingColumn confluenceTd">12</td><td class="confluenceTd"><p><a href="http://kafka.sandbox.xyz.net" class="external-link" rel="nofollow">kafka.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Kafka UI is installed as part of the Mosip’s default installation. We can access kafka ui over wireguard. Mostly used for administrative needs.</p></td></tr><tr><td class="numberingColumn confluenceTd">13</td><td class="confluenceTd"><p><a href="http://iam.sandbox.xyz.net" class="external-link" rel="nofollow">iam.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Mosip uses an Openid connect server to limit and manage access across all the services. The default installation comes with Keycloak. This domain is used to access the keycloak server over wireguard</p></td></tr><tr><td class="numberingColumn confluenceTd">14</td><td class="confluenceTd"><p><a href="http://postgres.sandbox.xyz.net" class="external-link" rel="nofollow">postgres.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>This domain points to the postgres server. You can connect to postgres via port forwarding over wireguard</p></td></tr><tr><td class="numberingColumn confluenceTd">15</td><td class="confluenceTd"><p><a href="http://pmp.sandbox.xyz.net" class="external-link" rel="nofollow">pmp.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Public Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Mosip’s partner management portal is used to manage partners accessing partner management portal over wireguard</p></td></tr><tr><td class="numberingColumn confluenceTd">16</td><td class="confluenceTd"><p><a href="http://resident.sandbox.xyz.net" class="external-link" rel="nofollow">resident.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Public Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>accessident resident portal publically</p></td></tr><tr><td class="numberingColumn confluenceTd">17</td><td class="confluenceTd"><p><a href="http://idp.sandbox.xyz.net" class="external-link" rel="nofollow">esignet.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Public Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>accessing IDP over public</p></td></tr><tr><td class="numberingColumn confluenceTd">18</td><td class="confluenceTd"><p><a href="http://smtp.sandbox.xyz.net" class="external-link" rel="nofollow">smtp.sandbox.xyz.net</a></p></td><td class="confluenceTd"><p>Private Load balancer of MOSIP cluster</p></td><td class="confluenceTd"><p>Accessing mock-smtp UI over wireguard</p></td></tr></tbody></table>

**Note:**

*   Only proceed to DNS mapping after the ingressgateways are installed and the load balancer is already configured.
    
*   The above table is just a placeholder for hostnames, the actual name itself varies from organisation to organisation.
    

### Certificate requirements

As only secured `https` connections are allowed via nginx server, you will need the below mentioned valid ssl certificates:

*   One valid wildcard ssl certificate related to domain used for accesing Observation cluster which will be created using ACM (Amazon certificate manager). In above e.g. \*.[org.net](http://org.net/) is the similiar example domain.
    
*   One valid wildcard ssl certificate related to domain used for accessing MOSIP cluster which will be created using ACM (Amazon certificate manager). In above e.g. \*.[sandbox.xyz.net](http://sandbox.xyz.net/) is the similiar example domain.
    

### Prerequisite for complete deployment in Personal Computer

*   [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) client version 1.23.6
    
*   [helm](https://helm.sh/docs/intro/install/) client version 3.8.2 and add below repos as well :
    
    *   ```java
        helm repo add bitnami https://charts.bitnami.com/bitnami
        helm repo add mosip https://mosip.github.io/mosip-helm
        ```
        
*   [istioctl](https://istio.io/latest/docs/setup/getting-started/#download) : version: 1.15.0
    
*   [eksctl](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html) : version: 0.121.0
    
*   AWS account and credentials with permissions to create EKS cluster.
    
*   AWS credentials in `~/.aws/` folder as given [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).
    
*   Save `~/.kube/config` file with another name. _(IMPORTANT. As in this process your existing_ `~/.kube/config` file will be overridden).
    
*   Save `.pem` file from AWS console and store it in `~/.ssh/` folder. (Generate a new one if you do not have this key file).
    
*   Create a directory as mosip in your PC and
    
    *   clone k8’s infra repo with tag : 1.2.0.1-B2 inside mosip directory.  
        `git clone https://github.com/mosip/k8s-infra -b v1.2.0.1-B2`
        
    *   clone mosip-infra with tag : 1.2.0.1-B2 inside mosip directory  
        `git clone https://github.com/mosip/mosip-infra -b v1.2.0.1-B2`
        
    *   Set below mentioned variables in bashrc
        
        *   ```java
            export MOSIP_ROOT=<location of mosip directory>
            export K8_ROOT=$MOSIP_ROOT/k8s-infra
            export INFRA_ROOT=$MOSIP_ROOT/mosip-infra
            ```
            
        *   `source .bashrc`  
            **Note:**  
            Above mentioned environment variables will be used throughout the installation to move between one directory to other to run install scripts.
            

Installation
-------------

### [Wireguard](https://www.wireguard.com/)

A Wireguard bastion host (Wireguard server) provides secure private channel to access MOSIP cluster. The host restricts public access, and enables access to only those clients who have their public key listed in Wireguard server. Wireguard listens on UDP port 51820.

### Architecture diagram

![](\_images/deployment\_architecture.png)

**Setup Wirguard VM and wireguard bastion server:**

*   Create a Wireguard server VM in aws console with above mentioned Hardware and Network requirements.
    
*   Edit the security group and add the following inbound rules in aws console
    
    *   type ‘custom TCP', port range ‘51820’ and source '0.0.0.0/0’
        
    *   type ‘custom UDP', port range ‘51820’ and source '0.0.0.0/0’
        
*   Install docker in the Wireguard machine as given [here](https://docs.docker.com/engine/install/ubuntu/).
    
*   Setup Wireguard server
    
    *   SSH to wireguard VM
        
    *   Create directory for storing wireguard config files.  
        `mkdir -p wireguard/config`
        
    *   Install and start wireguard server using docker as given below:
        
        ```java
        sudo docker run -d \
           --name=wireguard \
           --cap-add=NET_ADMIN \
           --cap-add=SYS_MODULE \
           -e PUID=1000 \
           -e PGID=1000 \
           -e TZ=Asia/Calcutta\
           -e PEERS=30 \
           -p 51820:51820/udp \
           -v /home/ubuntu/wireguard/config:/config \
           -v /lib/modules:/lib/modules \
           --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
           --restart unless-stopped \
           ghcr.io/linuxserver/wireguard
        ```
        
        **Note:**  
        \* Increase the no of peers above in case needed more than 30 wireguard client confs. (`-e PEERS=30`)  
        \* Change the directory to be mounted to wireguard docker in case needed.  
        All your wireguard confs will be generated in the mounted directory. (`-v /home/ubuntu/wireguard/config:/config`)
        

**Setup Wireguard Client in your PC**

*   Install [Wireguard client](https://www.wireguard.com/install/) in your PC.
    
*   Assign `wireguard.conf`:
    
    *   SSH to the wireguard server VM.
        
    *   `cd /home/ubuntu/wireguard/config`
        
    *   assign one of the PR for yourself and use the same from the PC to connect to the server.
        
        *   create `assigned.txt` file to assign the keep track of peer files allocated and update everytime some peer is allocated to someone.
            
            *   ```java
                peer1 :   peername
                peer2 :   xyz
                ```
                
        *   Use `ls` cmd to see the list of peers.
            
        *   get inside your selected peer directory, and add mentioned changes in peer.conf:
            
            *   `cd peer1`
                
            *   `nano peer1.conf`
                
                *   Delete the DNS IP.
                    
                *   Update the allowed IP's to subnets CIDR ip . e.g. 10.10.20.0/23
                    
            *   Share the updated `peer.conf` with respective peer to connect to wireguard server from Personel PC.
                
*   add `peer.conf` in your PC’s `/etc/wireguard` directory as `wg0.conf`.
    
*   start the wireguard client and check the status:
    
    *   ```java
        sudo systemctl start wg-quick@wg0
        sudo systemctl status wg-quick@wg0
        ```
        
*   Once Connected to wireguard you should be now able to login using private ip’s.
    

### Observation K8s Cluster setup and configuration

**Observation K8s Cluster setup**

*   Setup rancher cluster,
    
    *   `cd $K8_ROOT/rancher/aws`
        
    *   Copy `rancher.cluster.config.sample` to `rancher.cluster.config`.
        
    *   Review and update the below mentioned parameters of `rancher.cluster.config` carefully.
        
        *   name
            
        *   region
            
        *   version: “1.24“
            
        *   instance related details
            
            *   instanceName
                
            *   instanceType
                
            *   desiredcapacity
                
            *   volumeSize
                
            *   volumeType
                
            *   publicKeyName.
                
        *   update the details of the subnets to be used from vpc
            
    *   Install
        
        *   `eksctl create cluster -f rancher.cluster.config`
            
    *   Wait for the cluster creation to complete, generally it takes around 30 minutes to create or update cluster.
        
    *   Once EKS K8 cluster is ready below mentioned output will be displayed in the console screen.  
        `EKS cluster "my-cluster" in "region-code" region is ready`
        
    *   The config file for the new cluster will be created on `~/.kube/config`
        
    *   Make sure to backup and store the `~/.kube/config` with new name. e.g. `~/.kube/obs-cluster.config`.
        
    *   Change file permission using below command:  
        `chmod 400 ~/.kube/obs-cluster.config`
        
    *   Set the `KUBECONFIG` properly so that you can access the cluster.  
        `export KUBECONFIG=~/.kube/obs-cluster.config`
        
    *   Test cluster access:
        
        *   `kubect get nodes`
            
            *   Command will result in details of the nodes of the rancher cluster.
                

### Observation K8s Cluster’s Ingress and Storage class setup

Once the rancher cluster is ready we need ingress and storage class to be set for other applications to be installed.

*   [Nginx Ingress Controller](https://kubernetes.github.io/ingress-nginx/deploy/) : used for ingress in rancher cluster.
    
    *   ```java
        cd $K8_ROOT/rancher/aws
        helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
        helm repo update
        helm install \                               
          ingress-nginx ingress-nginx/ingress-nginx \
          --namespace ingress-nginx \
          --create-namespace  \
        -f nginx.values.yaml
        ```
        
        The above will automatically spawn an [Internal AWS Network Load Balancer (L4)](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-network-load-balancer.html).
        
*   Check the following on AWS console:
    
    *   An NLB has been created. You may also see the DNS of NLB with
        
        ```java
        kubectl -n ingress-nginx get svc
        ```
        
    *   Obtain AWS TLS certificate as given [here](https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html)
        
    *   Edit listner "443". Select "TLS".
        
    *   Note, the target group name of listner 80. Set target group of 443 to target group of 80. Basically, we want TLS termination at the LB and it must forward HTTP traffic (not HTTPS) to port 80 of ingress controller. So
        
        *   Input of LB: HTTPS
            
        *   Output of LB: HTTP --> port 80 of ingress nginx controller
            
    *   Enable "Proxy Protocol v2" in the target group settings
        
    *   Make sure all subnets are selected in LB -->Description-->Edit subnets.
        
    *   Check health check of target groups.
        
    *   Remove listner 80 from LB as we will receive traffic only on 443.
        
*   Storage class setup:
    
    *   Default storage class on EKS is `gp2` . `GP2` by default is in `Delete` mode which means if PVC is deleted, the underlying storage PV is also deleted.
        
    *   To enable volume expansion for the existing `gp2` storage class, modify the YAML configuration by adding `allowVolumeExpansion: true` to the `gp2` storage class configuration.
        
        *   `kubectl edit sc gp2` : to edit the yaml configuration.
            
    *   Create storage class `gp2-retain` by running `sc.yaml` for PV in Retain mode. Set the storage class as gp2-retain in case you want to retain PV.
        
        *   ```java
            cd $K8_ROOT/utils/misc/
            kubectl apply -f sc.yaml
            ```
            
    *   In case of performance setup use EBS storage as give [here](https://www.stacksimplify.com/aws-eks/kubernetes-storage/install-aws-ebs-csi-driver-on-aws-eks-for-persistent-storage/).
        

Domain name
-----------

Create the following domain names:

*   Rancher: `rancher.xyz.net`
    
*   Keycloak: `keycloak.xyz.net`
    

Point the above to **internal** ip address of the NLB. This assumes that you have a [Wireguard Bastion Host](https://docs.mosip.io/1.2.0/deployment/wireguard/wireguard-bastion) has been installed. On AWS this is done on Route 53 console.

### Rancher K8s Cluster Apps Installation

*   **Rancher UI** : Rancher provides full CRUD capability of creating and managing kubernetes cluster.
    
    *   Install rancher using Helm, update `hostname` in `rancher-values.yaml` and run the following command to install.
        
        *   ```java
            cd $K8_ROOT/rancher/rancher-ui
            helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
            helm repo update
            helm install rancher rancher-latest/rancher \
              --namespace cattle-system \
              --create-namespace \
              -f rancher-values.yaml
            ```
            
    *   Login:
        
        *   Open Rancher page `https://rancher.org.net`.
            
        *   Get Bootstrap password using
            
            ```java
            kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{ .data.bootstrapPassword|base64decode}}{{ "\n" }}'
            ```
            
        *   Assign a password. IMPORTANT: makes sure this password is securely saved and retrievable by Admin.
            
*   [**Keycloak**](https://www.keycloak.org/) : Keycloak is an OAuth 2.0 compliant Identity Access Management (IAM) system used to manage the access to Rancher for cluster controls.
    
    *   ```java
        cd $K8_ROOT/rancher/keycloak
        ./install.sh <iam.host.name>
        ```
        
    *   `keycloak_client.json`: Used to create SAML client on Keycloak for Rancher integration.
        
*   **Keycloak - Rancher Integration**
    
    *   Login as `admin` user in Keycloak and make sure an email id, and first name field is populated for `admin` user. This is important for Rancher authentication as given below.
        
    *   Enable authentication with Keycloak using the steps given [here](https://rancher.com/docs/rancher/v2.6/en/admin-settings/authentication/keycloak-saml/).
        
    *   In Keycloak add another Mapper for the rancher client (in Master realm) with following fields:
        
        *   Protocol: saml
            
        *   Name: username
            
        *   Mapper Type: User Property
            
        *   Property: username
            
        *   Friendly Name: username
            
        *   SAML Attribute Name: username
            
        *   SAML Attribute NameFormat: Basic
            
    *   Specify the following mappings in Rancher's Authentication Keycloak form:
        
        *   Display Name Field: givenName
            
        *   User Name Field: email
            
        *   UID Field: username
            
        *   Entity ID Field: [https://your-rancher-domain/v1-saml/keycloak/saml/metadata](https://your-rancher-domain/v1-saml/keycloak/saml/metadata)
            
        *   Rancher API Host: [https://your-rancher-domain](https://your-rancher-domain/)
            
        *   Groups Field: member
            
*   **RBAC :**
    
    *   For users in Keycloak assign roles in Rancher - **cluster** and **project** roles. Under `default` project add all the namespaces. Then, to a non-admin user you may provide Read-Only role (under projects).
        
    *   If you want to create custom roles, you can follow the steps given [here](https://github.com/mosip/k8s-infra/blob/main/docs/create-custom-role.md).
        
    *   Add a member to cluster/project in Rancher:
        
        *   Give member name exactly as `username` in Keycloak
            
        *   Assign appropriate role like Cluster Owner, Cluster Viewer etc.
            
        *   You may create new role with fine grained acccess control.
            
*   **Certificates expiry**
    
    *   In case you see certificate expiry message while adding users, on **local** cluster run these commands:
        
        [https://rancher.com/docs/rancher/v2.6/en/troubleshooting/expired-webhook-certificates/](https://rancher.com/docs/rancher/v2.6/en/troubleshooting/expired-webhook-certificates/)
        

### MOSIP K8s Cluster setup

*   Setup mosip cluster
    
    *   `cd $K8_ROOT/mosip/aws`
        
    *   Copy `cluster.config.sample` to `mosip.cluster.config`.
        
    *   Review and update the below mentioned parameters of `cluster.config.sample` carefully.
        
        *   name
            
        *   region
            
        *   version: “1.24“
            
        *   instance related details
            
            *   instanceName
                
            *   instanceType
                
            *   desiredcapacity
                
            *   volumeSize
                
            *   volumeType
                
            *   publicKeyName.
                
        *   update the details of the subnets to be used from vpc
            
    *   Install
        
    
    `eksctl create cluster -f mosip.cluster.config`
    
    *   Wait for the cluster creation to complete, generally it takes around 30 minutes to create or update cluster.
        
    *   Once EKS K8 cluster is ready below mentioned output will be displayed in the console screen.  
        `EKS cluster "my-cluster" in "region-code" region is ready`
        
    *   The config file for the new cluster will be created on `~/.kube/config`
        
    *   Make sure to backup and store the `~/.kube/config` with new name. e.g. `~/.kube/mosip-cluster.config`.
        
    *   Change file permission using below command:  
        `chmod 400 ~/.kube/mosip-cluster.config`
        
    *   Set the `KUBECONFIG` properly so that you can access the cluster.  
        `export KUBECONFIG=~/.kube/mosip-cluster.config`
        
    *   Test cluster access:
        
        *   `kubect get nodes`
            
            *   Command will result in details of the nodes of the MOSIP cluster.
                

### Import Mosip Cluster into Rancher UI

*   Login as admin in Rancher console
    
*   Select `Import Existing` for cluster addition.
    
*   Select the `Generic` as cluster type to add.
    
*   Fill the `Cluster Name` field with unique cluster name and select `Create`.
    
*   You will get the kubectl commands to be executed in the kubernetes cluster. Copy the command and execute from your PC. (make sure your kube-config file is correctly set to Mosip cluster)
    

```java
eg.
kubectl apply -f https://rancher.e2e.mosip.net/v3/import/pdmkx6b4xxtpcd699gzwdtt5bckwf4ctdgr7xkmmtwg8dfjk4hmbpk_c-m-db8kcj4r.yaml
```

*   Wait for few seconds after executing the command for the cluster to get verified.
    
*   Your cluster is now added to the rancher management server.
    

### MOSIP K8 Cluster Global configmap, Ingress and Storage Class setup

*   **Global configmap**: Global configmap contains list of necesary details to be used throughout the namespaces of the cluster for common details.
    
    *   `cd $K8_ROOT/mosip`
        
    *   Copy `global_configmap.yaml.sample` to `global_configmap.yaml.`
        
    *   Update the domain names in `global_configmap.yaml` and run.
        
    *   `kubectl apply -f global_configmap.yaml`
        
*   Storage class setup:
    
    *   Default storage class on EKS is `gp2` . `GP2` by default is in `Delete` mode which means if PVC is deleted, the underlying storage PV is also deleted.
        
    *   To enable volume expansion for the existing `gp2` storage class, modify the YAML configuration by adding `allowVolumeExpansion: true` to the `gp2` storage class configuration.
        
        *   `kubectl edit sc gp2` : to edit the yaml configuration.
            
    *   Create storage class `gp2-retain` by running `sc.yaml` for PV in Retain mode. Set the storage class as gp2-retain in case you want to retain PV.
        
        *   ```java
            cd $K8_ROOT/utils/misc/
            kubectl apply -f sc.yaml
            ```
            
    *   In case of performance setup use EBS storage as give [here](https://www.stacksimplify.com/aws-eks/kubernetes-storage/install-aws-ebs-csi-driver-on-aws-eks-for-persistent-storage/).
        
*   Ingress and load balancer (LB) :
    
    *   Ingress is not installed by default on EKS. We use Istio ingress gateway controller to allow traffic in the cluster. Two channels are created - public and internal. See [architecture](https://github.com/mosip/k8s-infra/blob/1.2.0.1-B1/README.md).
        
    *   Install [istioctl](https://istio.io/latest/docs/ops/diagnostic-tools/istioctl/#install-hahahugoshortcode-s2-hbhb) as given here in your system.
        
    *   Install ingresses as given here:
        
    *   ```java
        cd $K8_ROOT/istio
        ./install.sh
        ```
        
*   Load Balancers setup for istio-ingress.
    
    *   The above istio installation will automatically spawn an [Internal AWS Network Load Balancer (L4)](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-network-load-balancer.html).
        
    *   These may be also seen with
        
    
    ```java
    kubectl -n istio-system get svc
    ```
    
    *   You may view them on AWS console in Loadbalancer section.
        
    *   TLS termination is supposed to be on LB. So all our traffic coming to ingress controller shall be HTTP.
        
    *   Obtain AWS TLS certificate as given [here](https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html)
        
    *   Add the certificates and 443 access to the LB listener.
        
    *   Update listener TCP->443 to **TLS->443** and point to the certificate of domain name that belongs to your cluster.
        
    *   Forward TLS->443 listner traffic to target group that corresponds to listener on port 80 of respective Loadbalancers. This is because after TLS termination the protocol is HTTP so we must point LB to HTTP port of ingress controller.
        
    *   Update health check ports of LB target groups to node port corresponding to port 15021. You can see the node ports with
        
*   ```java
    kubectl -n istio-system get svc
    ```
    
    *   Enable Proxy Protocol v2 on target groups.
        
    *   Make sure all subnets are included in Availability Zones for the LB. Description --> Availability Zones --> Edit Subnets
        
    *   Make sure to delete the listeners for port 80 and 15021 from each of the loadbalancers as we restrict unsecured port 80 access over http.
        
*   DNS mapping:
    
    *   Initially all the services will be accesible only over the internal channel.
        
    *   Point all your domain names to internal LoadBalancers DNS/IP intially till testing is done.
        
    *   On AWS this may be done on Route 53 console.
        
    *   After Go live decision enable [public access](https://github.com/mosip/k8s-infra/blob/main/docs/public-access.md).
        
*   Check Overall if nginx and istio wiring is set correctly
    
    *   Install httpbin: This utility docker returns http headers received inside the cluster. You may use it for general debugging - to check ingress, headers etc.
        
        *   ```java
            cd $K8_ROOT/utils/httpbin
            ./install.sh
            ```
            
        *   To see what's reaching httpbin (example, replace with your domain name):
            
            ```java
            curl https://api-internal.sandbox.xyz.net/httpbin/get?show_env=true
            Once public access is enabled also check this:
            curl https://api.sandbox.xyz.net/httpbin/get?show_env=true
            ```
            

### Monitoring Module deployment

Prometheus and Grafana and Alertmanager tools are used for cluster monitoring.

*   Select 'Monitoring' App from Rancher console -> _Apps & Marketplaces_.
    
*   In Helm options, open the YAML file and disable Nginx Ingress.
    
    *   ```java
        ingressNginx:
        enabled: false
        ```
        
*   Click on `Install`.
    

### Alerting Setup

Alerting is part of cluster monitoring, where alert notifications are sent to the configured email or slack channel.

*   Monitoring should be deployed which includes deployment of prometheus, grafana and alertmanager.
    
*   Create [slack incoming webhook](https://api.slack.com/messaging/webhooks).
    
*   After setting slack incoming webhook update `slack_api_url` and `slack_channel_name` in `alertmanager.yml`.
    
    *   `cd $K8_ROOT/monitoring/alerting/`
        
    *   `nano alertmanager.yml`
        
    *   Update
        
        ```java
        global:
          resolve_timeout: 5m
          slack_api_url: <YOUR-SLACK-API-URL>
        ...
          slack_configs:
          - channel: '<YOUR-CHANNEL-HERE>'
            send_resolved: true
        ```
        
*   Update `Cluster_name` in `patch-cluster-name.yaml`.
    
    *   `cd $K8_ROOT/monitoring/alerting/`
        
    *   `nano patch-cluster-name.yaml`
        
    *   Update
        
        ```java
        spec:
          externalLabels:
            cluster: <YOUR-CLUSTER-NAME-HERE>
        ```
        
*   Install Default alerts along some of the defined custom alerts:
    
    *   ```java
        cd $K8_ROOT/monitoring/alerting/
        ./install.sh
        ```
        
*   Alerting is Installed.
    

### Logging Module Setup and Installation

Mosip uses Rancher Fluentd and elasticsearch to collect logs from all services and reflect the same in Kibana Dashboard.

*   Install Rancher FluentD system : for screpping logs outs of all the microservices from Mosip k8 cluster.
    
    *   Install Logging from Apps and marketplace within the Rancher UI.
        
    *   Select Chart Version `100.1.3+up3.17.7` from Rancher console -> _Apps & Marketplaces_.
        
*   Configure Rancher FluentD
    
    *   Create `clusteroutput` :
        
        *   `kubectl apply -f clusteroutput-elasticsearch.yaml`
            
    *   start `clusterFlow`
        
        *   `kubectl apply -f clusterflow-elasticsearch.yaml`
            
*   Install elasticsearch, kibana and Istio addons
    
    *   `cd $K8_ROOT/logging`
        
    *   `./intall.sh`
        
*   set `min_age` in `elasticsearch-ilm-script.sh` and execute the same. `min_age` : is the min no. of days for which indices will be stored in elasticsearch.
    
    *   `cd $K8_ROOT/logging`
        
    *   `./elasticsearch-ilm-script.sh`
        
*   Mosip provides set of Kibana Dashboards for checking logs and throughputs .
    
    *   Brief description of these dashboards are as follows:
        
        *   [01-logstash.ndjson](https://github.com/mosip/k8s-infra/blob/main/logging/dashboards/01-logstash.ndjson) contains the `logstash` _Index Pattern_ required by the rest of the dashboards.
            
        *   [02-error-only-logs.ndjson](https://github.com/mosip/k8s-infra/blob/main/logging/dashboards/02-error-only-logs.ndjson) contains a _Search_ dashboard which shows only the error logs of the services, called `MOSIP Error Logs` dashboard.
            
        *   [03-service-logs.ndjson](https://github.com/mosip/k8s-infra/blob/main/logging/dashboards/03-service-logs.ndjson) contains a _Search_ dashboard which show all logs of a particular service, called `MOSIP Service Logs` dashboard.
            
        *   [04-insight.ndjson](https://github.com/mosip/k8s-infra/blob/main/logging/dashboards/04-insight.ndjson) contains dashboards which show insights into MOSIP processes, like the number of UINs generated (total and per hr), the number of Biometric deduplications processed, number of packets uploaded etc, called `MOSIP Insight` dashboard.
            
        *   [05-response-time.ndjson](https://github.com/mosip/k8s-infra/blob/main/logging/dashboards/05-response-time.ndjson) contains dashboards which show how quickly different MOSIP Services are responding to different APIs, over time, called `Response Time` dashboard.
            
    *   Import dashboards:
        
        *   `cd K8_ROOT/logging/dashboard`
            
        *   `./load_kibana_dashboards.sh ./dashboards <cluster-kube-config-file>`
            
    *   View dashbords
        
        *   Open kibana dashboard from: `https://kibana.sandbox.xyz.net`.
            
        *   _Kibana_ --> _Menu_ (on top left) --> _Dashboard_ --> Select the dashboard.
            

### Mosip External Dependencies setup

*   External Dependencies: are set of external requirements needed for funtioning of MOSIP’s core services like DB, object store, hsm etc.
    
*   ```java
    cd $INFRA_ROOT/deployment/v3/external/all
    ./install-all.sh
    ```
    
*   Check detailed installation instruction of all the [external componets](https://mosip.atlassian.net/wiki/spaces/DevOps/pages/edit-v2/1046020129?draftShareId=26bfe209-411a-4a21-bd10-a2c65009721c)
    

### MOSIP Modules Deployment

*   Now that all the Kubernetes cluster and external dependencies are already installed, you can continue with MOSIP service deployment.
    
    *   ```java
        cd $INFRA_ROOT/deployment/v3/mosip/all
        ./install-all.sh
        ```
        
*   Check the detailed MOSIP Modules Deployment [MOSIP Modular installation](https://mosip.atlassian.net/wiki/spaces/DevOps/pages/1036386394/MOSIP+Modules+Deployment) steps.
    

### API Testrig

*   MOSIP’s successfull deployment can be verified by comparing the results of api testrig with testrig benchmark.
    
    *   ```java
        cd $INFRA_ROOT/deployment/v3/apitestrig
        ./install.sh
        ```
        
        *   When prompted input the hour of the day to execute the api-testrig.
            
        *   Daily api testrig cron jon will be executed at the very opted hour of the day.
