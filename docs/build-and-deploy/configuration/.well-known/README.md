# .well-known

The **.well-known** folder is a convention used in web development to provide a standardized location for certain files or resources that need to be publicly accessible and discoverable. It typically resides at the root level of a website or web server. The purpose of this folder is to make it easy for web clients (browsers, applications, or services) to find important files or resources related to web services and security.

### Why does eSignet use the ".well-known" directory?

eSignet uses the ".well-known" directory to serve the following purposes:

* **Standardization**: To provide a standardized location for specific public files and resources related to web services and security. It makes it easier for developers and web clients using eSignet to know where to look for important information.
* **Security**: Security-related files and resources can be placed in the ".well-known" directory, such as the public certificate for encryption and signature verification.
* **Interoperability**: By following the ".well-known" convention, web developers using eSignet can ensure interoperability with various web standards and protocols. For example, eSignet shares the context file, which contains the structure of its verifiable credentials.
* **Ease of Configuration**: Web servers can be configured to serve files from the ".well-known" directory without needing custom configurations for each specific resource. This simplifies the server setup and maintenance process.
* **Transparency**: For matters related to security policies and contact information, such as in the "security.txt" file, placing them in a well-known location makes it transparent and easily accessible to anyone interested in the website's security practices.

### How is ".well-known" directory used in eSignet?

eSignet's ".well-know" directory contains the four files mentioned below:

* [jwks.json](jwks.json.md)
* [oauth-configuration](oauth-configuration.md)
* [openid-configuration](openid-configuration.md)
