# Local Setup

## Inji Verify Local Setup

This guide is designed to help users set up Inji Verify in their local environment, providing detailed instructions to replicate the platform's functionality on their machine for development or testing purposes.

#### **Repositories:**

Clone the repositories in the local to bring up your setup. Repository information can be fetched from [**here**](https://github.com/mosip/inji-verify/tree/v0.8.0)**.**

#### **Installations:**

Prerequisites: Node 18 - Can be installed using [**nvm**](https://github.com/nvm-sh/nvm)**.** Run the following commands to install the node

```
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
$ nvm install 18
```

#### **Folder Structure:**

* **Helm:** The folder contains helm charts required to deploy on K8S
* **Inji Verify:** This contains the source code and Dockerfile

Click on the [**ReadMe file**](https://github.com/mosip/inji-verify/blob/v0.8.0/README.md) to explore more!

### **Running the application:**

Let's explore how to initiate Inji Verify locally after completing the setup in your local environment.

* Run the following commands to start the application:

```
$ cd ./inji-verify
$ npm install
$ npm start
```

* Build and run Docker for a service:

```
$ docker build -t <dockerImageName>:<tag> .
$ docker run -it -d -p 3000:3000 <dockerImageName>:<tag>
```

* Open URL:  [http://localhost:3000](http://localhost:3000/)
