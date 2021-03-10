# TPM for Reg Client

By default, the sandbox installs a disabled Trusted Platform Module \(TPM\) Reg Client Downloader.

**Reg Client Downloader**:

```text
    #Playbook
    to install
    reg-client
    downloader
        #Inputs:
        #kube_config
        #prepare folder on nfs
        -hosts:console
        gather facts:true
        vars:
            reg_prop: '{{reg_client}}'
        roles:
        -{role: reg-client-prep}
```

Convert helm template to helm values:

```text
    - hosts: console
        vars:
        kube_config: '{{clusters.dmz.kube_config}}'
        install_name: 'reg-client-downloader' 
        helm_chart: '{{charts_root}}/reg-client-downloader'
        is_template: true
        helm_namespace: 'default'
        helm_values: '{{charts_root}}/reg-client-downloader/values.template.j2'
        helm_strings: ''
        roles:
            - {role:  helm}
```

To enable TPM to use trusted private/public Reg client machine private/public keys, do the following:

1. Update the registered client downloader TPM environment variable:

   ```text
    File: helm/charts/reg-client-downloader/values.template.j2
    Change:
    tpm: "Y"
   ```

2. If, before installing the sandbox, you have done the above, then you may skip this step. Otherwise, if the downloader reg client is already running on your sandbox, delete it and restart as follows:

   ```text
   $ helm2 delete reg-client-downloader
   ```

   \(Wait for all resources to get terminated\)

```text
    $ sb
    $ an playbooks/reg-client-downloader.yml
```

1. Add the name and public key in MOSIP-master/machine-master and MOSIP-master/machine-master table of the registered client machine in DB. Using TPM Utility, you can get your machine's public key

```text
    **TPM Utility**:
```

Utility to obtain public TPM keys along with the name of the computer

**Prerequisites:**

```text
Requires Java 11
```

**Build:**

```text
    $ mvn clean install
```

**Run:**

```text
    $ java -jar tpmutility-0.0.1.jar
```

\(Use jar-with-dependencies to run under target folder\)

```text
    Sample Output:
    {"machineName" : "S540-14IWL", "publicKey" : "AAEACwACAHIAIINxl2dEhLP4GpDMjUal1yT9UtduBlILZPKh2hszFGmqABAAFwALCAAAAQABAQDiSa_AdVmDrj-ypFywexe_eSaSsrIoO5Ns0jp7niMu4hiFIwsFT7yWx2aQUQcdX5OjyXjv_XJctGxFcphLXke5fwAoW6BsbeM__1Mlhq9YvdMKlwMjhKcd-7MHHAXPUKGVmMjIJe6kWwUWh7FaZyu5hDymM5MJyYZRxz5fRos_N9ykiBxjWKZK06ZpIYI6Tj9rUNZ6HAdbJH2RmBHuO0knpbXdB-lnnVhvArAt3KWoyH3YzodHeOLJRe_Y8a-p8zRZb5h1tqlcLgshpNAqb-WJgyq2xDb0RJwzuyjjHPmJrDqlBMXHestz-ADRwXQL44iVb84LcuMbQTQ1hGcawtBj", "signingPublicKey": "AAEABAAEAHIAAAAQABQACwgAAAEAAQEAw6CuS_sekZ02Z9_N3zz1fK_V3wm01PBcFM0nURerczjO2wqIxfmXpQQql3_S819nj_MwtkZ8K2ja0MRUJzJrmmbgBreFIGTa7Zhl9uAdzKghAA5hEaXV1YcxIl8m72vZpVX_dgqYzU8dccfRChsA-FxkVe5DCr_aXjVOUHjeXZRhQ1k-d7LzpBPVz-S69rx6W3bbxaZfV25HM93Hfm5P4aarYy0Wt0fJvv-Lmbyt0SIZFOQkYS8coW0-u8OiXm3Jur2Q8pu16q4F-Qpxqym-ACBFIsbkSCngQ_y4zGniK7WnS-dCSVhC-x1NscCq3PyXhoJOjSOdNqUkDX606Ic3SQ", "keyIndex": "BD:11:54:33:44:F9:5A:0B:B5:A6:B3:C1:F7:A8:28:47:0E:AA:20:21:01:16:37:89:D1:9C:8D:EC:96:5D:F5:A6", "signingKeyIndex": "41:EB:7E:7F:4F:A9:24:55:4C:5F:AB:3A:94:81:CF:75:C2:0B:92:DF:9B:89:47:D1:AD:B0:84:7A:F7:65:6A:88"}
```

**Machine Master Table:**

The publicKey, signingPublicKey, keyIndex and _signingKeyIndex_ - all of them to be populated in the _`machine_master`_ table of _`mosip_master` DB_.

1. Download the registered client from [https://{{sandbox](https://{{sandbox) domain name}}/registration-client/1.1.3/reg-client.zip

