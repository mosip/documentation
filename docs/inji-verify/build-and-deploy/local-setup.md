# Local Setup

## Inji Verify Local Setup

This guide is designed to help users set up Inji Verify in their local environment, providing detailed instructions to replicate the platform's functionality on their machine for development or testing purposes.

#### **Repositories**

Clone the repositories in the local to bring up your setup. Repository information can be fetched from [**here**](https://github.com/mosip/inji-verify/blob/release-0.12.x/README.md#inji-verify)

#### **Installations**

Prerequisites: Node 18 - Can be installed using [**nvm**](https://github.com/nvm-sh/nvm)**.** Run the following commands to install the node

```
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
$ nvm install 18
```

*   **JAVA 21**

    Can be installed using [sdkman](https://sdkman.io/). Run following commands to install node

    ```
    $ curl -s "https://get.sdkman.io" | bash
    $ sdk install java 21.0.5-tem
    ```
* [Maven](https://maven.apache.org/install.html)

#### **Folder Structure**

* **Helm:** The folder contains helm charts required to deploy on K8S
* **verify-ui:** This folder contains the source code for Inji Verify UI
* **verify-service:** This folder contains the source code for Inji Verify Backend Service
* **inji-verify-sdk :** This folder contains source code for Inji Verify SDK - which provided react components for Inji Verify UI integration.

Click on the [**ReadMe file**](https://github.com/mosip/inji-verify/blob/release-0.12.x/README.md#inji-verify) to explore more!

#### **Docker Compose**

Docker Compose provides two types of setup options: one for **developer setup**, enabling full-featured access for development and testing, and another for **demo setup**, optimized for showcasing specific use cases with simplified configuration.

**Developer Setup**

* To set it up for the developer, follow the steps outlined in the [**README**](https://github.com/mosip/inji-verify/blob/release-0.11.x/README.md#developer-setup) file for configuring Docker Compose for development, including necessary dependencies and configurations.

**Demo Setup**

* To set up the application on your local system for specific use cases or demo purposes, follow the steps provided in the [**README**](https://github.com/mosip/inji-verify/blob/release-0.11.x/README.md#demo-setup) file. The [**README**](https://github.com/mosip/inji-verify/blob/release-0.11.x/README.md#demo-setup) contains detailed instructions tailored to your requirements for easy setup and deployment.
* **Refer to the README for Docker Compose Instructions**
  * Inside the Inji Verify project directory, you will find a [**README**](https://github.com/mosip/inji-verify?tab=readme-ov-file#installations) file. This file contains detailed steps for setting up the project using Docker Compose.
  * Review the steps under the "Docker Compose" section for instructions on how to build and run the containers.
* **Run Docker Compose**
  * Use Docker Compose to build and deploy the application.
* **Access the Application**
  * Once the build is complete, the application will be available to access via the configured endpoint.
