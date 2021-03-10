# Sandbox Access

When installing the default Sandbox, you must have a public domain name, so that the domain name refers to the console computer. However, if you want to access your internal network's Sandbox \(for example via VPN\), set the following in **`group_vars/all.yml`**:

```text
    sandbox_domain_name: '{{inventory_hostname}}'
    site:
      sandbox_public_url: 'https://{{sandbox_domain_name}}'
      ssl:
        ca: 'selfsigned'   # The ca to be used in this deployment.
```

A self-signed certificate is created and the sandbox access URL is [https://{{inventory](https://{{inventory) hostname}}'

