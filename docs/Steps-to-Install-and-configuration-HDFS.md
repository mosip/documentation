## 1. Setup HDFS version 2.8.1
**documentation for setting up hdfs cluster with one namenode and one datanode**
### Before you begin
1. Create 2 VMs. They’ll be referred to throughout this guide as 
```
node-master.example.com
node-slave1.example.com
```
2. Install java (java-8-openjdk) to all the machines in the cluster and setup the JAVA_HOME environment variable for the same.
```
sudo yum install java-1.8.0-openjdk-devel
``` 
Get your Java installation path.
```
update-alternatives --display java
```

**NOTE :** Take the value of the current link and remove the trailing /bin/java. <br/>
For example on RHEL 7, the link is /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/jre/bin/java, <br/>
so JAVA_HOME should be /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/jre.

#### Edit ~/bashrc.sh:
export JAVA_HOME={path-tojava} <br/>
with your actual java installation path. For example on a Debian with open-jdk-8:
```
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/jre
```

Note: in the further steps when u login to the hadoop account set the java path in ~/hadoop/etc/hadoop/hadoop-env.sh also.

3. Get the IP of master and slave nodes using:
```
ifconfig
```
Adjust /etc/hosts on all nodes according to your configuration:<br/>
NOTE: while adding same machine ip to /etc/hosts , use private ip that machine instead of public ip. for other machine in the cluster use public ip.

```text
NOTE : Editing the Master node VM /etc/hosts file  use private IP of Master node and public IP of the Slave node
         Editing the Slave node  VM /etc/hosts file use private IP of Slave node and Public IP of Master node 
```
example:

```
10.0.22.11 node-master.example.com
10.0.3.12 node-slave1.example.com
```
### Creating Hadoop User
**create a hadoop user** in every machine in the cluster to followup the documentation <br/> 
or **replace the hadoop user** in the documentation with your own user.

Log in to the system as the root user.
```
sudo su -
```
Create a hadoop user account using the **useradd** command.
```
adduser hadoop

```
Set a password for the new hadoop user using the **passwd** command.
```
passwd hadoop
Changing password for user hadoop.
New password: 
Retype new password: 
passwd: all authentication tokens updated successfully.
```
Add the haddop user to the wheel group using the **usermod** command.
```
usermod -aG wheel hadoop
```
Test that the updated configuration allows the user you created to run commands using sudo.
Use the **su** to switch to the new user account that you created.
```
su hadoop
```
Use the groups to verify that the user is in the wheel group.
```
groups
```
Use the sudo command to run the **whoami** command. As this is the first time you have run a command using sudo from hadoop user account the banner message will be displayed. You will be also be prompted to enter the password for the hadoop account.
```
sudo whoami
We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for hadoop:
root
```
The last line of the output is the user name returned by the **whoami** command. If sudo is configured correctly this value will be **root**.

**You have successfully configured a hadoop user with sudo access**. You can now log in to this hadoop account and use sudo to run commands as if you were logged in to the account of the root user.

### Distribute Authentication Key-pairs for the Hadoop User
The master node will use an ssh-connection to connect to other nodes with key-pair authentication, to manage the cluster.<br/>
1. Login to node-master as the hadoop user, and generate an ssh-key:
```
ssh-keygen -t rsa
```
id_rsa.pub will contains the generated public key

2. Copy the public key to all the other nodes.
```
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hadoop@node-master.example.com
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hadoop@node-slave1.example.com
```
 or

update the $HOME/.ssh/id_rsa.pub file contents of slave node to Master node $HOME/.ssh/authorized_keys file <br/> and also
update $HOME/.ssh/id_rsa.pub file contents of Master node to Slave node $HOME/.ssh/authorized_keys manually.<br/>

### Verify ssh from Master node to slave node and vice versa.
 
```
ssh hadoop@node-slave1.example.com
```
NOTE: if ssh fails, try setting up again the authorized_keys to the machine.

### Download and Unpack Hadoop Binaries
Login to node-master as the hadoop user, download the Hadoop tarball from Hadoop project page, and unzip it:
```
cd

wget https://archive.apache.org/dist/hadoop/core/hadoop-2.8.1/hadoop-2.8.1.tar.gz

tar -xzf hadoop-2.8.1.tar.gz

mv hadoop-2.8.1 hadoop
```
### Set Environment Variables in each machine in the cluster
Add Hadoop binaries to your PATH. Edit ``/home/hadoop/.bashrc`` or ``/home/hadoop/.bash_profile`` and add the following line:
```
export HADOOP_HOME=$HOME/hadoop
export HADOOP_CONF_DIR=$HOME/hadoop/etc/hadoop
export HADOOP_MAPRED_HOME=$HOME/hadoop
export HADOOP_COMMON_HOME=$HOME/hadoop
export HADOOP_HDFS_HOME=$HOME/hadoop
export YARN_HOME=$HOME/hadoop
export PATH=$PATH:$HOME/hadoop/bin
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64/jre
```
run following command to apply environment variable changes, using source command
```
source /home/hadoop/.bashrc
or
source /home/hadoop/.bash_profile
```
### Configure the Master Node
Configuration will be done on node-master and replicated to other slave nodes.

#### Set NameNode
Update ~/hadoop/etc/hadoop/core-site.xml :
```
<configuration>
     <property>
            <name>fs.defaultFS</name>
            <value>hdfs://node-master.example:51000</value>
     </property>
</configuration>
```
#### Set path for HDFS
Edit ~/hadoop/etc/hadoop/hdfs-site.xml :
```
<configuration>
    	<property>
                <name>dfs.namenode.name.dir</name>
                <value>/home/hadoop/data/nameNode</value>
        </property>
        <property>
                <name>dfs.datanode.data.dir</name>
                <value>/home/hadoop/data/dataNode</value>
        </property>
        <property>
                <name>dfs.replication</name>
                <value>1</value>
        </property>
	<property>
		<name>dfs.permissions</name>
		<value>true</value>
	</property>
        <property>
                <name>dfs.namenode.secondary.http-address</name>
                <value>0.0.0.0:51090</value>
        </property>
        <property>
                <name>dfs.namenode.secondary.https-address</name>
                <value>0.0.0.0:51091</value>
        </property>
        <property>
                <name>dfs.datanode.address</name>
                <value>0.0.0.0:51010</value>
        </property>
        <property>
                <name>dfs.datanode.http.address</name>
                <value>0.0.0.0:51075</value>
        </property>
        <property>
                <name>dfs.datanode.ipc.address</name>
                <value>0.0.0.0:51020</value>
        </property>
        <property>
                <name>dfs.namenode.http-address</name>
                <value>0.0.0.0:51070</value>
        </property>
        <property>
                <name>dfs.namenode.https-address</name>
                <value>0.0.0.0:51470</value>
        </property>
        <property>
                <name>dfs.namenode.backup.address</name>
                <value>0.0.0.0:51100</value>
        </property>
        <property>
                <name>dfs.namenode.backup.http-address</name>
                <value>0.0.0.0:51105</value>
        </property>
</configuration>
```

create directories
```
mkdir -p /home/hadoop/data/nameNode [where on the filesystem the DFS name node should store the name table(fsimage)]
mkdir -p /home/hadoop/data/dataNode  [where data node should store its blocks.]
```
#### Configure Master
Edit ~/hadoop/etc/hadoop/masters to be:
````
node-master.example.com
````
#### Configure Slaves
Edit ~/hadoop/etc/hadoop/slaves to be:<br/>
this slaves file will specifies the datanode to be setup in which machine
````
node-slave1.example.com
````
### Duplicate Config Files on Each Node 
1. Copy the hadoop binaries to slave nodes:
```
cd /home/hadoop/
scp hadoop-*.tar.gz node-slave1.example.com:/home/hadoop
```

or copy each configured files to other nodes

2. Connect to node1 via ssh. A password isn’t required, thanks to the ssh keys copied above:
```
ssh node-slave1.example.com
```
3. Unzip the binaries, rename the directory, and exit node-slave1.example.com to get back on the node-master.example.com:
```
tar -xzf hadoop-2.8.1.tar.gz
mv hadoop-2.8.1 hadoop
exit
```
4. Copy the Hadoop configuration files to the slave nodes:
``` 
for node in node-slave1.example.com; do
    scp ~/hadoop/etc/hadoop/* $node:/home/hadoop/hadoop/etc/hadoop/;
done
```
### Format HDFS
HDFS needs to be formatted like any classical file system. On node-master, run the following command:
```
hdfs namenode -format
```
Your Hadoop installation is now configured and ready to run.

### Start HDFS
1. Start the HDFS by running the following script from node-master:
start-dfs.sh , stop-dfs.sh script files will be present in hadoop_Installation_Dir/sbin/start.dfs.sg
```
hadoop/sbin/start-dfs.sh
```
It’ll start NameNode and SecondaryNameNode on node-master.example.com, and DataNode on node-slave1.example.com, according to the configuration in the slaves config file.<br/>
2. Check that every process is running with the jps command on each node. You should get on node-master.example.com (PID will be different):
```
21922 Jps
21603 NameNode
21787 SecondaryNameNode
```
and on node-slave1.example.com:
```
19728 DataNode
19819 Jps
```
Hdfs has been Configured Successfully
<br/>
<br/>
**NOTE :** if datanode and namenode has not started.
look into hdfs logs to debug: $HOME/hadoop/logs/

### Create hdfs users
1. To create users for hdfs (regprocessor, prereg, idrepo), run this command:
```
sudo useradd  regprocessor
sudo useradd  prereg
sudo useradd  idrepo

```

**NOTE : Configure the user in module specific properties file (ex- pre-registration-qa.properties) as mosip.kernel.fsadapter.hdfs.user-name=prereg**

2. Create a directory and give permission for each user
```
hdfs dfs -mkdir /user/regprocessor
hdfs dfs -chown -R regprocessor:regprocessor  /user/regprocessor
hdfs dfs -mkdir /user/prereg
hdfs dfs -chown -R prereg:prereg  /user/prereg
hdfs dfs -mkdir /user/idrepo
hdfs dfs -chown -R idrepo:idrepo  /user/idrepo
``` 
#### enabling configured port through firewall in each machine in cluster
```ssh
sudo firewall-cmd --zone=public --add-port=51000/tcp --permanent
sudo firewall-cmd --zone=public --add-port=51090/tcp --permanent
sudo firewall-cmd --zone=public --add-port=51010/tcp --permanent
sudo firewall-cmd --zone=public --add-port=51075/tcp --permanent
sudo firewall-cmd --zone=public --add-port=51020/tcp --permanent
sudo firewall-cmd --zone=public --add-port=51070/tcp --permanent
sudo firewall-cmd --zone=public --add-port=51470/tcp --permanent
sudo firewall-cmd --zone=public --add-port=51100/tcp --permanent
sudo firewall-cmd --zone=public --add-port=51105/tcp --permanent
sudo firewall-cmd --reload
```
##### NOTE: 
if different port has been configured , enable those port.

## 2. Securing HDFS

Following configuration is required to run HDFS in secure mode.
Read more about kerberos here:
[**link**](//access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/managing_smart_cards/using_Kerberos)
### Install Kerberos
###  Before Installing Kerberos Install the JCE Policy File
Install Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy File on all cluster and Hadoop user machines.
Follow this [**link**](//dzone.com/articles/install-java-cryptography-extension-jce-unlimited)

### Kerberos

Kerberos server(KDC) and the client needs to be installed. Install the client on both master and slave nodes. KDC server will be installed on the master node.
1. To install packages for a Kerberos server:
```
yum install krb5-server krb5-libs krb5-auth-dialog
```
2. To install packages for a Kerberos client:
```
yum install krb5-workstation krb5-libs krb5-auth-dialog
```
### Configuring the Master KDC Server

1. Edit the /etc/krb5.conf:
<pre>
# Configuration snippets may be placed in this directory as well
includedir /etc/krb5.conf.d/

[logging]
 default = FILE:/var/log/krb5libs.log
 kdc = FILE:/var/log/krb5kdc.log
 admin_server = FILE:/var/log/kadmind.log

[libdefaults]
 <b>udp_preference_limit = 1</b>
 dns_lookup_realm = false
 ticket_lifetime = 365d
 renew_lifetime = 365d
 forwardable = true
 rdns = false
 pkinit_anchors = /etc/pki/tls/certs/ca-bundle.crt
 default_realm =  <b>NODE-MASTER.EXAMPLE.COM</b>
 #default_ccache_name = KEYRING:persistent:%{uid}

[realms]
   <b>NODE-MASTER.EXAMPLE.COM</b> = {
   kdc = <b>node-master.example.com:51088</b>
   admin_server = <b>node-master.example.com</b>
 }

[domain_realm]
   <b>.node-master.example.com = NODE-MASTER.EXAMPLE.COM
   node-master.example.com = NODE-MASTER.EXAMPLE.COM</b>
</pre>


**NOTE: Place this krb5.conf /kernel/kernel-fsadapter-hdfs/src/main/resources**

```
mosip.kernel.fsadapter.hdfs.krb-file=classpath:krb5.conf 
```
OR If Kept outside resource then give absolute path 
```
mosip.kernel.fsadapter.hdfs.krb-file=file:/opt/kdc/krb5.conf 
```


2. Edit /var/kerberos/krb5kdc/kdc.conf
<pre>
[kdcdefaults]
 kdc_ports = <b>51088</b>
 kdc_tcp_ports = <b>51088</b>

[realms]
 <b>NODE-MASTER.EXAMPLE.COM</b> = {
  #master_key_type = aes256-cts
  acl_file = /var/kerberos/krb5kdc/kadm5.acl
  dict_file = /usr/share/dict/words
  admin_keytab = /var/kerberos/krb5kdc/kadm5.keytab
  supported_enctypes = aes256-cts:normal aes128-cts:normal des3-hmac-sha1:normal arcfour-hmac:normal camellia256-cts:normal camellia128-cts:normal des-hmac-sha1:normal des-cbc-md5:normal des-cbc-crc:normal
 }
</pre>
3. Create the database using the kdb5_util utility.
```
/usr/sbin/kdb5_util create -s
```
4. Edit the /var/kerberos/krb5kdc/kadm5.acl
```
*/admin@NODE-MASTER.EXAMPLE.COM	*
```
5. Create the first principal using kadmin.local at the KDC terminal:
```
/usr/sbin/kadmin.local -q "addprinc root/admin"
```
6. Start Kerberos using the following commands:
```
/sbin/service krb5kdc start
/sbin/service kadmin start
```
to set up the KDC server to auto-start on boot.

```
RHEL/CentOS/Oracle Linux 6

chkconfig krb5kdc on

chkconfig kadmin on

RHEL/CentOS/Oracle Linux 7

systemctl enable krb5kdc

systemctl enable kadmin
```

7. Verify that the KDC is issuing tickets. 
First, run kinit to obtain a ticket and store it in a credential cache file.
```
kinit root/admin
```
Next, use klist to view the list of credentials in the cache.
```
klist
```
Use kdestroy to destroy the cache and the credentials it contains.
```
kdestroy -A
```
### Create and Deploy the Kerberos Principals and Keytab Files
For more information, check here:
[**link**](//cloudera.com/documentation/enterprise/5-16-x/topics/cdh_sg_kerberos_prin_keytab_deploy.html)

If you have root access to the KDC machine, use kadmin.local, else use kadmin.
To start kadmin.local (on the KDC machine), run this command:
```
sudo kadmin.local
```
#### To create the Kerberos principals
Do the following steps for masternode.
1. In the kadmin.local or kadmin shell, create the hadoop principal. This principal is used for the NameNode, Secondary NameNode, and DataNodes.
```
kadmin:  addprinc hadoop/admin@NODE-MASTER.EXAMPLE.COM
```
2. Create the HTTP principal.
```
kadmin:  addprinc HTTP/admin@NODE-MASTER.EXAMPLE.COM
```
3. Create principal for all user of hdfs (regprocessor, prereg, idrepo)
```
kadmin:  addprinc regprocessor@NODE-MASTER.EXAMPLE.COM
kadmin:  addprinc prereg@NODE-MASTER.EXAMPLE.COM
kadmin:  addprinc idrepo@NODE-MASTER.EXAMPLE.COM
```
#### To create the Kerberos keytab files
Create the hdfs keytab file that will contain the hdfs principal and HTTP principal. This keytab file is used for the NameNode, Secondary NameNode, and DataNodes.
```
kadmin:  xst -norandkey -k hadoop.keytab hadoop/admin HTTP/admin
```
Use klist to display the keytab file entries; a correctly-created hdfs keytab file should look something like this:
```
$ klist -k -e -t hadoop.keytab
Keytab name: FILE:hadoop.keytab
KVNO Timestamp           Principal
---- ------------------- ------------------------------------------------------
   1 02/11/2019 08:53:51 hadoop/admin@NODE-MASTER.EXAMPLE.COM (aes256-cts-hmac-sha1-96)
   1 02/11/2019 08:53:51 hadoop/admin@NODE-MASTER.EXAMPLE.COM (aes128-cts-hmac-sha1-96)
   1 02/11/2019 08:53:51 hadoop/admin@NODE-MASTER.EXAMPLE.COM (des3-cbc-sha1)
   1 02/11/2019 08:53:51 hadoop/admin@NODE-MASTER.EXAMPLE.COM (arcfour-hmac)
   1 02/11/2019 08:53:51 hadoop/admin@NODE-MASTER.EXAMPLE.COM (camellia256-cts-cmac)
   1 02/11/2019 08:53:51 hadoop/admin@NODE-MASTER.EXAMPLE.COM (camellia128-cts-cmac)
   1 02/11/2019 08:53:51 hadoop/admin@NODE-MASTER.EXAMPLE.COM (des-hmac-sha1)
   1 02/11/2019 08:53:51 hadoop/admin@NODE-MASTER.EXAMPLE.COM (des-cbc-md5)
   1 02/11/2019 08:53:51 HTTP/admin@NODE-MASTER.EXAMPLE.COM (aes256-cts-hmac-sha1-96)
   1 02/11/2019 08:53:51 HTTP/admin@NODE-MASTER.EXAMPLE.COM (aes128-cts-hmac-sha1-96)
   1 02/11/2019 08:53:51 HTTP/admin@NODE-MASTER.EXAMPLE.COM (des3-cbc-sha1)
   1 02/11/2019 08:53:51 HTTP/admin@NODE-MASTER.EXAMPLE.COM (arcfour-hmac)
   1 02/11/2019 08:53:51 HTTP/admin@NODE-MASTER.EXAMPLE.COM (camellia256-cts-cmac)
   1 02/11/2019 08:53:51 HTTP/admin@NODE-MASTER.EXAMPLE.COM (camellia128-cts-cmac)
   1 02/11/2019 08:53:51 HTTP/admin@NODE-MASTER.EXAMPLE.COM (des-hmac-sha1)
   1 02/11/2019 08:53:51 HTTP/admin@NODE-MASTER.EXAMPLE.COM (des-cbc-md5)
```
##### Creating keytab [mosip.keytab] file for application to authenticate  with hdfs cluster
``` 
$sudo kadmin
   kadmin: xst -norandkey -k mosip.keytab {user1}
   kadmin: xst -norandkey -k mosip.keytab {user2} 
```
    replace {user} with username.

##### to view the principals in keytab
```
 klist -k -e -t mosip.keytab
```
and so on add all the users to keytab. if you want create the separate keytab file for each application and distribute them


#### To deploy the Kerberos keytab file
On every node in the cluster, copy or move the keytab file to a directory that Hadoop can access, such as /home/hadoop/hadoop/etc/hadoop/hadoop.keytab.

### To configure Kernel HDFS Adapter
Place this mosip.keytab file in /kernel/kernel-fsadapter-hdfs/src/main/resources and update the application properties for

```
mosip.kernel.fsadapter.hdfs.keytab-file=classpath:mosip.keytab
mosip.kernel.fsadapter.hdfs.authentication-enabled=true
mosip.kernel.fsadapter.hdfs.kdc-domain=NODE-MASTER.EXAMPLE.COM
mosip.kernel.fsadapter.hdfs.name-node-url=hdfs://host-ip:port
```

**NOTE : Configure the user in module specific properties file (ex- pre-registration-qa.properties) as mosip.kernel.fsadapter.hdfs.user-name=prereg**

### Enable security in hdfs
To enable security in hdfs, you must stop all Hadoop daemons in your cluster and then change some configuration properties. 

```
sh hadoop/sbin/stop-dfs.sh
```
### Enable Hadoop Security
1. To enable Hadoop security, add the following properties to the ~/hadoop/etc/hadoop/core-site.xml file on every machine in the cluster:
```
<property>
  <name>hadoop.security.authentication</name>
  <value>kerberos</value> 
</property>

<property>
  <name>hadoop.security.authorization</name>
  <value>true</value>
</property>
 
<property>
  <name>hadoop.http.filter.initializers</name>
  <value>org.apache.hadoop.security.AuthenticationFilterInitializer</value>
</property>

<property>
  <name>hadoop.http.authentication.type</name>
  <value>kerberos</value>
</property>

<property>
  <name>hadoop.http.authentication.simple.anonymous.allowed</name>
  <value>true</value>
</property>

<property>
  <name>hadoop.http.authentication.kerberos.principal</name>
  <value>HTTP/admin@NODE-MASTER.EXAMPLE.COM</value>
</property>

<property>
  <name>hadoop.http.authentication.kerberos.keytab</name>
  <value>/home/hadoop/hadoop/etc/hadoop/hadoop.keytab</value>
</property>

```
2. Add the following properties to the ~/hadoop/etc/hadoop/hdfs-site.xml file on every machine in the cluster.
```
<property>
  <name>dfs.block.access.token.enable</name>
  <value>true</value>
</property>

<!-- NameNode security config -->
<property>
  <name>dfs.namenode.keytab.file</name>
  `<value>/home/hadoop/hadoop/etc/hadoop/hadoop.keytab</value> <!-- path to the HDFS keytab -->
</property>
<property>
  <name>dfs.namenode.kerberos.principal</name>
  <value>hadoop/admin@NODE-MASTER.EXAMPLE.COM</value>
</property>
<property>
  <name>dfs.namenode.kerberos.internal.spnego.principal</name>
  <value>HTTP/admin@NODE-MASTER.EXAMPLE.COM</value>
</property>

<!-- Secondary NameNode security config -->
<property>
  <name>dfs.secondary.namenode.keytab.file</name>
  <value>/home/hadoop/hadoop/etc/hadoop/hadoop.keytab</value> <!-- path to the HDFS keytab -->
</property>
<property>
  <name>dfs.secondary.namenode.kerberos.principal</name>
    <value>hadoop/admin@NODE-MASTER.EXAMPLE.COM</value>
</property>
<property>
  <name>dfs.secondary.namenode.kerberos.internal.spnego.principal</name>
  <value>HTTP/admin@NODE-MASTER.EXAMPLE.COM</value>
</property>

<!-- DataNode security config -->
<property>
  <name>dfs.datanode.data.dir.perm</name>
  <value>700</value> 
</property>
<property>
  <name>dfs.datanode.keytab.file</name>
  <value>/home/hadoop/hadoop/etc/hadoop/hadoop.keytab</value><!-- path to the HDFS keytab -->
</property>
<property>
  <name>dfs.datanode.kerberos.principal</name>
  <value>hadoop/admin@NODE-MASTER.EXAMPLE.COM</value>
</property>

<!-- Web Authentication config -->
<property>
  <name>dfs.web.authentication.kerberos.principal</name>
  <value>HTTP/admin@NODE-MASTER.EXAMPLE.COM</value>
 </property>

<property>
  <name>dfs.data.transfer.protection</name>
  <value>authentication</value>
 </property>

<property>
  <name>dfs.http.policy</name>
  <value>HTTPS_ONLY</value>
 </property>
```
### Configuring https in hdfs
#### Generating the key and certificate
The first step of deploying HTTPS is to generate the key and the certificate for each machine in the cluster. You can use Java’s keytool utility to accomplish this task:
Ensure that firstname/lastname OR common name (CN) matches exactly with the fully qualified domain name (e.g. node-master.example.com) of the server. 
```
keytool -genkey -alias localhost  -keyalg RSA -keysize 2048 -keystore keystore.jks
```
####  Creating your own CA
We use openssl to generate a new CA certificate:
```
openssl req -new -x509 -keyout ca-key.cer -out ca-cert.cer -days 365
```
The next step is to add the generated CA to the clients’ truststore so that the clients can trust this CA:
```
keytool -keystore truststore.jks -alias CARoot -import -file ca-cert.cer
```
#### Signing the certificate:
The next step is to sign all certificates generated  with the CA. First, you need to export the certificate from the keystore:
```
keytool -keystore keystore.jks -alias localhost -certreq -file cert-file.cer
```
Then sign it with the CA:
```
openssl x509 -req -CA ca-cert.cer -CAkey ca-key.cer -in cert-file.cer -out cert-signed.cer -days 365 -CAcreateserial -passin pass:12345678
```
Finally, you need to import both the certificate of the CA and the signed certificate into the keystore
```
keytool -keystore keystore.jks -alias CARoot -import -file ca-cert.cer
keytool -keystore keystore.jks -alias localhost -import -file cert-signed.cer
```
#### Configuring Hdfs
Change the ssl-server.xml and ssl-client.xml on all nodes to tell HDFS about the keystore and the truststore
1. Edit ~/hadoop/etc/hadoop/ssl-server.xml
```
<configuration>

<property>
  <name>ssl.server.truststore.location</name>
  <value>/home/hadoop/truststore.jks</value>
  <description>Truststore to be used by NN and DN. Must be specified.
  </description>
</property>

<property>
  <name>ssl.server.truststore.password</name>
  <value>12345678</value>
  <description>Optional. Default value is "".
  </description>
</property>

<property>
  <name>ssl.server.truststore.type</name>
  <value>jks</value>
  <description>Optional. The keystore file format, default value is "jks".
  </description>
</property>

<property>
  <name>ssl.server.truststore.reload.interval</name>
  <value>10000</value>
  <description>Truststore reload check interval, in milliseconds.
  Default value is 10000 (10 seconds).
  </description>
</property>

<property>
  <name>ssl.server.keystore.location</name>
  <value>/home/hadoop/keystore.jks</value>
  <description>Keystore to be used by NN and DN. Must be specified.
  </description>
</property>

<property>
  <name>ssl.server.keystore.password</name>
  <value>12345678</value>
  <description>Must be specified.
  </description>
</property>

<property>
  <name>ssl.server.keystore.keypassword</name>
  <value>12345678</value>
  <description>Must be specified.
  </description>
</property>

<property>
  <name>ssl.server.keystore.type</name>
  <value>jks</value>
  <description>Optional. The keystore file format, default value is "jks".
  </description>
</property>

<property>
  <name>ssl.server.exclude.cipher.list</name>
  <value>TLS_ECDHE_RSA_WITH_RC4_128_SHA,SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA,
  SSL_RSA_WITH_DES_CBC_SHA,SSL_DHE_RSA_WITH_DES_CBC_SHA,
  SSL_RSA_EXPORT_WITH_RC4_40_MD5,SSL_RSA_EXPORT_WITH_DES40_CBC_SHA,
  SSL_RSA_WITH_RC4_128_MD5</value>
  <description>Optional. The weak security cipher suites that you want excluded
  from SSL communication.</description>
</property>

</configuration>
```
2. Edit ~/hadoop/etc/hadoop/ssl-client.xml
```
<configuration>

<property>
  <name>ssl.client.truststore.location</name>
  <value>/home/hadoop/truststore.jks</value>
  <description>Truststore to be used by clients like distcp. Must be
  specified.
  </description>
</property>

<property>
  <name>ssl.client.truststore.password</name>
  <value>12345678</value>
  <description>Optional. Default value is "".
  </description>
</property>

<property>
  <name>ssl.client.truststore.type</name>
  <value>jks</value>
  <description>Optional. The keystore file format, default value is "jks".
  </description>
</property>

<property>
  <name>ssl.client.truststore.reload.interval</name>
  <value>10000</value>
  <description>Truststore reload check interval, in milliseconds.
  Default value is 10000 (10 seconds).
  </description>
</property>

<property>
  <name>ssl.client.keystore.location</name>
  <value>/home/hadoop/keystore.jks</value>
  <description>Keystore to be used by clients like distcp. Must be
  specified.
  </description>
</property>

<property>
  <name>ssl.client.keystore.password</name>
  <value>12345678</value>
  <description>Optional. Default value is "".
  </description>
</property>

<property>
  <name>ssl.client.keystore.keypassword</name>
  <value>12345678</value>
  <description>Optional. Default value is "".
  </description>
</property>

<property>
  <name>ssl.client.keystore.type</name>
  <value>jks</value>
  <description>Optional. The keystore file format, default value is "jks".
  </description>
</property>

</configuration>
```
After restarting the HDFS daemons (NameNode, DataNode and JournalNode), you should have successfully deployed HTTPS in your HDFS cluster.

For you face error during kerberos, check this:
[**link**](//steveloughran.gitbooks.io/kerberos_and_hadoop/content/sections/errors.html)