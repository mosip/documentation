# Pre-Requisites

## Hardware requirements

* VM’s required can be with any OS as per convenience.
* Here, we are referting to __Ubuntu OS (22.0.4)__ throughout this installation guide.
* Ensure to create Ubuntu user with its directory `/home/ubuntu` as the same user is referenced throughout the document. Else, change the user related commands as and when needed throughout the installation.

<table><thead><tr><th width="74.77560424804688">Sl no.</th><th>Purpose</th><th width="68.37286376953125">vCPU's</th><th width="88.87359619140625">RAM</th><th width="93.69598388671875">Storage (HDD)</th><th width="81.78265380859375">no. ofVM's</th><th>HA</th></tr></thead><tbody><tr><td>1.</td><td>Wireguard Bastion Host</td><td>2</td><td>4 GB</td><td>8 GB</td><td>1</td><td>(ensure to setup active-passive)</td></tr><tr><td>2.</td><td>Observation Cluster nodes</td><td>2</td><td>8 GB</td><td>32 GB</td><td>2</td><td>2</td></tr><tr><td>3.</td><td>Observation Nginx server (use Loadbalancer if required)</td><td>2</td><td>4 GB</td><td>16 GB</td><td>1</td><td>Nginx+</td></tr><tr><td>4.</td><td>MOSIP Cluster nodes</td><td>12</td><td>32 GB</td><td>128 GB</td><td>6</td><td>6</td></tr><tr><td>5.</td><td>MOSIP Nginx server ( use Loadbalancer if required)</td><td>2</td><td>4 GB</td><td>16 GB</td><td>1</td><td>Nginx+</td></tr></tbody></table>

## Network requirements

* All the VM's should be able to communicate with each other.
* Need stable Intra network connectivity between these VM's.
* All the VM's should have stable internet connectivity for docker image download (in case of local setup ensure to have a locally accessible docker registry).
* Server Interface requirement as mentioned in below table:

<table><thead><tr><th width="68.62356567382812">Sl no.</th><th width="158.7308349609375">Purpose</th><th>Network Interfaces</th></tr></thead><tbody><tr><td>1.</td><td>Wireguard Bastion Host</td><td><em>One Private interface</em> : that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).<br><br><em>One public interface</em> : Either has a direct public IP, or a firewall NAT (global address) rule that forwards traffic on 51820/udp port to this interface IP.</td></tr><tr><td>2.</td><td>K8 Cluster nodes</td><td>One internal interface: with internet access and that is on the same network as all the rest of nodes (e.g.: inside local NAT Network )</td></tr><tr><td>3.</td><td>Observation Nginx server</td><td>One internal interface: with internet access and that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).</td></tr><tr><td>4.</td><td>Mosip Nginx server</td><td><em>One internal interface</em> : that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).<br><br><em>One public interface</em> : Either has a direct public IP, or a firewall NAT (global address) rule that forwards traffic on 443/tcp port to this interface IP.</td></tr></tbody></table>

## DNS requirements
* Incase not using public DNS system please ignore this as the same mapping needs to be performed at node level and is mentioned in the deployment document. 

<table><thead><tr><th width="60.8885498046875"></th><th width="163.96307373046875">Domain Name</th><th width="236.553955078125">Mapping details</th><th>Purpose</th></tr></thead><tbody><tr><td>1.</td><td>rancher.xyz.net</td><td>Private IP of Nginx server or load balancer for Observation cluster</td><td>Rancher dashboard to monitor and manage the kubernetes cluster.</td></tr><tr><td>2.</td><td>keycloak.xyz.net</td><td>Private IP of Nginx server for Observation cluster</td><td>Administrative IAM tool (keycloak). This is for the kubernetes administration.</td></tr><tr><td>3.</td><td>sandbox.xyx.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>Index page for links to different dashboards of MOSIP env. (This is just for reference, please do not expose this page in a real production or UAT environment)</td></tr><tr><td>4.</td><td>api-internal.sandbox.xyz.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>Internal API’s are exposed through this domain. They are accessible privately over wireguard channel</td></tr><tr><td>5.</td><td>api.sandbox.xyx.net</td><td>Public IP of Nginx server for MOSIP cluster</td><td>All the API’s that are publically usable are exposed using this domain.</td></tr><tr><td>6.</td><td>prereg.sandbox.xyz.net</td><td>Public IP of Nginx server for MOSIP cluster</td><td>Domain name for MOSIP's pre-registration portal. The portal is accessible publicly.</td></tr><tr><td>7.</td><td>activemq.sandbox.xyx.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>Provides direct access to <code>activemq</code> dashboard. It is limited and can be used only over wireguard.</td></tr><tr><td>8.</td><td>kibana.sandbox.xyx.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>Optional installation. Used to access kibana dashboard over wireguard.</td></tr><tr><td>9.</td><td>regclient.sandbox.xyz.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>Registration Client can be downloaded from this domain. It should be used over wireguard.</td></tr><tr><td>10.</td><td>admin.sandbox.xyz.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>MOSIP's admin portal is exposed using this domain. This is an internal domain and is restricted to access over wireguard</td></tr><tr><td>11.</td><td>object-store.sandbox.xyx.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>Optional- This domain is used to access the object server. Based on the object server that you choose map this domain accordingly. In our reference implementation, MinIO is used and this domain let's you access MinIO’s Console over wireguard</td></tr><tr><td>12.</td><td>kafka.sandbox.xyz.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>Kafka UI is installed as part of the MOSIP’s default installation. We can access kafka UI over wireguard. Mostly used for administrative needs.</td></tr><tr><td>13.</td><td>iam.sandbox.xyz.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>MOSIP uses an OpenID Connect server to limit and manage access across all the services. The default installation comes with Keycloak. This domain is used to access the keycloak server over wireguard</td></tr><tr><td>14.</td><td>postgres.sandbox.xyz.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>This domain points to the postgres server. You can connect to postgres via port forwarding over wireguard</td></tr><tr><td>15.</td><td>pmp.sandbox.xyz.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>MOSIP’s partner management portal is used to manage partners accessing partner management portal over wireguard</td></tr><tr><td>16.</td><td>onboarder.sandbox.xyz.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>Accessing reports of MOSIP partner onboarding over wireguard</td></tr><tr><td>17.</td><td>resident.sandbox.xyz.net</td><td>Public IP of Nginx server for MOSIP cluster</td><td>Accessing resident portal publically</td></tr><tr><td>18.</td><td>idp.sandbox.xyz.net</td><td>Public IP of Nginx server for MOSIP cluster</td><td>Accessing IDP over public</td></tr><tr><td>19.</td><td>smtp.sandbox.xyz.net</td><td>Private IP of Nginx server for MOSIP cluster</td><td>Accessing mock-smtp UI over wireguard</td></tr></tbody></table>

## Certificate requirements

As only secured https connections are allowed via nginx server will need below mentioned valid ssl certificates:

* One valid wildcard ssl certificate related to domain used for accessing Observation cluster, this needs to be stored inside the nginx server VM for Observation cluster. In above e.g.: \*.org.net is the similar example domain.
* One valid wildcard ssl certificate related to domain used for accessing Mosip cluster, this needs to be stored inside the nginx server VM for mosip cluster. In above e.g.: \*.sandbox.xyz.net is the similar example domain.

## Personal computer requirements
> Note:
> * In case unfamiliar with below mentioned tools and trying deployment from personel computer having Windows OS, suggestion is to use WSL for easy proceedings.
> * Please ensure the following tools with the specified versions are installed on your personal computer.

* [git](https://github.com/git-guides/install-git) - version 2.25.1 or higher.
* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)- version 2.12.4 or higher
* [helm](https://helm.sh/docs/intro/install/)- any client version above 3.0.0 and add below repos as well:

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add mosip https://mosip.github.io/mosip-helm
```

* [Istioctl](https://istio.io/latest/docs/setup/getting-started/#download) : version: 1.15.0
* [rke](https://rancher.com/docs/rke/latest/en/installation/) : version: [1.3.10](https://github.com/rancher/rke/releases/tag/v1.3.10)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html) -  version > 2.12.4
* Openssl Need openssl version 1.1.1 specifically for regclient installation.
  * Check the current OpenSSL version:
    ```
    openssl version
    ```
   * If it's not OpenSSL 1.1.1f, remove the existing OpenSSL
     ```
     sudo apt remove openssl 
     ```
   * Manually install OpenSSL 1.1.1f by following this [guide](https://learnubuntu.com/install-openssl/#install-openssl-manually-in-ubuntu): 
     > Note :
     > * While following the guide:
     >   * Replace all instances of openssl-1.1.1s with openssl-1.1.1f.
     >   * Skip the commands that create backups of binaries:
     >     ```
     >     sudo mv /usr/bin/c_rehash /usr/bin/c_rehash.backup   sudo mv /usr/bin/openssl /usr/bin/openssl.backup
     >     ```
     >   * After completing the installation, verify the OpenSSL version again:
     >     ```
     >     openssl version
     >     ```
     >      * It should show: OpenSSL 1.1.1f

* Once the above tools are installed, create a directory named `mosip` on your PC and follow the steps below:

    * clone k8’s infra repo with tag : 1.2.0.2 (**whichever is the latest version**) inside mosip directory. `git clone https://github.com/mosip/k8s-infra -b v1.2.0.2`
    * clone mosip-infra with tag : 1.2.0.2 (**whichever is the latest version**) inside mosip directory. `git clone https://github.com/mosip/mosip-infra -b v1.2.0.2`
    * Set below mentioned variables in bashrc

    ```
    export MOSIP_ROOT=<location of mosip directory>
    export K8_ROOT=$MOSIP_ROOT/k8s-infra
    export INFRA_ROOT=$MOSIP_ROOT/mosip-infra
    ```

    `source ~/.bashrc`

    > Note: Above mentioned environment variables will be used throughout the installation to move between one directory to other to run install scripts.
