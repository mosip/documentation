# Profile Registry Plugin

### What is Profile Registry Plugin? <a href="#what-is-profile-registry-plugin-only-heading-update" id="what-is-profile-registry-plugin-only-heading-update"></a>

ID registry plugin enables eSignet's Signup service to integrate with any Id registry system. This essentially means that eSignet now does away with tight integration with MOSIP ID-repository and makes way for any ID Repository system to be integrated with eSignet.

{% hint style="success" %}
The dependency on the MOSIP ID repository has been removed in eSignet Sign Up Service versions 1.1.0 and above.
{% endhint %}

### Sequence Diagram <a href="#sequence-diagram-only-heading-update" id="sequence-diagram-only-heading-update"></a>

Please refer to the sequence diagram below for the detailed working flow of the profile registry plugin.

<figure><img src="../../../.gitbook/assets/Profile_refgistry.png" alt=""><figcaption><p>Profile Registry Plugin</p></figcaption></figure>

### Profile Registry Plugin Interface <a href="#profile-registry-plugin-interface-only-heading-update" id="profile-registry-plugin-interface-only-heading-update"></a>

Please [refer here](https://github.com/mosip/esignet-signup/blob/master/signup-integration-api/src/main/java/io/mosip/signup/api/spi/ProfileRegistryPlugin.java) for the Profile Registry Plugin interface.
