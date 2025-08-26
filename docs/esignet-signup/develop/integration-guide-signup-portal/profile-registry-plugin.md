# Profile Registry Plugin

ID registry plugin enables eSignet's Signup service to integrate with any Id registry system. This essentially means that eSignet now does away with tight integration with MOSIP ID-repository and makes way for any ID Repository system to be integrated with eSignet.

The dependency on the MOSIP ID repository has been removed in eSignet Sign Up Service versions 1.1.0 and above.

Please refer to the sequence diagram below for the detailed working flow of the profile registry plugin.

<figure><img src="../../../.gitbook/assets/Profile_refgistry.png" alt=""><figcaption><p>Profile Registry Plugin</p></figcaption></figure>

Please refer below for the Profile Registry Plugin interface:

https://github.com/mosip/esignet-signup/blob/master/signup-integration-api/src/main/java/io/mosip/signup/api/spi/ProfileRegistryPlugin.java