# DNS Configurations

DNS translates human readable domain names to machine readable IP addresses. A private DNS _\(CoreDNS\)_ is mounted on the console machine by default, and **`/etc/resolv.conf`** refers to this DNS on all machines.

However, if you want to use DNS cloud providers \(like Route53 on AWS\), disable the installation of a private DNS by setting the following flag:

```text
group_vars/all.yml:
    coredns:
      enabled: false  # Disable to use Cloud provided DNS
```

Ensure your DNS routing is taken care of by your cloud deployment. Uncomment the Route53 code for AWS in the scripts given in the:

```text
terraform/aws/sandbox
```

The **`corends.yml`** ``playbook configures the CoreDNS and updates the **`/etc/resolv.conf`** file for all devices. If a system needs to be restarted, re-run the playbook to restore **`/etc/resolv.conf`**.

