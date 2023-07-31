# Resident Services UI Developers Guide

This [repository](https://github.com/mosip/resident-ui) contains the UI code for Resident portal. To know more about the functions that a resident can perform via this portal, refer [here](https://docs.mosip.io/1.2.0/modules/resident-services).

## Build and Deployment

_Note_: The code is written in Angular JS.

* Install `node.js`- To build the angular code using angular cli that runs on node, recommended Node: 14.17.3, Package Manager: npm 6.14.13

* Install `angular cli` – To install angular cli for building the code into deployable artifacts. Follow the following steps to install angular cli on your system.

    * `npm install -g @angular/cli` (to install angular cli)

    * `ng --version` (to verify angular is installed in system) We recommend Angular CLI: 13.3.2

* Check out the source code from GIT – To download the source code from git, follow the steps below to download source code on your local system.

    * git clone https://github.com/mosip/resident-ui.git (to clone the source code repository from git)
 
### For Production build:

* Build the code – Follow the steps below to build the source code on your system.

      * Navigate to the resident-ui directory inside the cloned repository. 

      * Run the command  `ng build "--prod" "--base-href" "." "--output-path=dist"` in that directory to build the code.

* Build Docker Image – Follow the steps below to build the docker image on your system.

      * `docker build -t name .` (to build the docker image, replace `name` with the name of the image you want, "." signifies the current directory from where the docker file has to be read.)

      * Example: `docker build -t residentui .`

* Run the docker image – Follow the steps to build docker image on your system.

      * `docker run –d –p 80:80 --name container-name image-name` (to run the docker image created with the previous step,`-d` signifies to run the container in detached mode, `-p` signifies the port mapping left side of the":" is the external port that will be exposed to the outside world and right side is the internal port of the container that is mapped with the external port. Replace `container-name` with the name of your choice for the container, replace `image-name` with the name of the image specified in the previous step)

      * Example: `docker run -d -p 8080:8080 --name nginx residentui`

* Now you can access the user interface over the internet via browser.

      * Example: `http://localhost:8080/#/dashboard`

### For Local build:

* Build & deploy the code locally – Follow the steps below to build the source code on your system.

      * Navigate to the resident-ui directory inside the cloned repository. Then, run the following command in that directory:

      * `npm install`

      * `ng serve`

* Now, you can access the user interface via browser.

  Example: `http://localhost:4200`
