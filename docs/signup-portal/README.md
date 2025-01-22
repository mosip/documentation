# Signup Portal

## Overview <a href="#overview" id="overview"></a>

The Signup portal offers features for creating a user profile and also a way to verify the data used to create it. The dataset in the profile can be used as a credential in eSignet. This enables a country to Fastrack and, at the same time, simplify the digital path of the end user.

The user profile created via the signup portal is stored in an ID registry. The signup portal connects to the ID registry via a runtime plugin, making it completely flexible to use any kind of ID registry. The signup portal comes with an out-of-the-box MOSIP ID repository plugin.

Note: The signup portal can also used with any existing ID registries only leveraging the eKYC verification feature.

1. **Signup Service**: This is the backend component that manages the registration logic. It supports the creation of new user accounts by processing user inputs, performing necessary validations, securely storing user data in the ID registry, and integrating with external systems as needed. The service is built with flexibility in mind, allowing it to connect seamlessly to any external ID registry system through a well-defined [Profile Registry Plugin](integration-guide/profile-registry-plugin.md).
2. **Signup UI**: The Signup UI is the front-end component that provides a web-based interface through which end users can submit their registration know more about Signup UI please refer here.

Together, the Signup Portal streamlines the user registration process, enabling new users to quickly gain access to digital services via eSignet.

Currently, the Signup portal supports below features:

1. Register User
2. Reset password
3. Online video based identity verification workflow integration via plugin

To know more about the components refer [here](components.md).

To know more about the integration of the Signup portal with eSignet please refer [here](integration-guide/integration-with-esignet-portal.md).
