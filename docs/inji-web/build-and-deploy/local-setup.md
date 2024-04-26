# Local setup

This document aims to assist users in setting up Inji Web on their local environment, offering step-by-step instructions to replicate the platform's functionality on their machine for development or testing purposes.

### Repositories:

Clone the repositories in the local to bring up your own setup. Repository information can be fetched from [here](https://docs.mosip.io/inji/inji-web/inji-web/version-0.8.0#repository-released).

**Pre-requisite:**

In order to run Inji Web locally, Node 18 is required. Please follow the below step to install node.

Node 18 - Can be installed using [nvm](https://github.com/nvm-sh/nvm). Run following commands to install node

```
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
$ nvm install 18
```

#### Folder Structure:

* **helm:** folder contains helm charts required to deploy on K8S
* **inji-web:** contains the source code and Dockerfile
* [README link](https://github.com/mosip/inji-web/blob/release-0.8.0/README.md)

***

## Run Inji Web in local:

Let's explore how to initiate Inji Web locally after completing the setup on your local environment.

* Run following commands to start the application:

```
$ cd ./inji-web
$ npm install
$ npm start
```

Run npm test to run tests

* Build and run Docker for a service:

```
$ cd ./inji-web
$ docker build -t <dockerImageName>:<tag> .
$ docker run -it -d -p 3000:3000 <dockerImageName>:<tag>
```

* Open URL [http://localhost:3000](http://localhost:3000/)
