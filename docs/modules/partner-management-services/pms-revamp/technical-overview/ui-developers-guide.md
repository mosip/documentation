# UI Developers Guide

This [repository](https://github.com/mosip/partner-management-portal) contains the UI code for Partner Management portal. To know more about the features and functions present on the portal, refer [here](https://docs.mosip.io/1.2.0/modules/partner-management-services/partner-management-portal).

### Build and Deployment

_Note_: The code is written in React JS.

* Install `node.js`- To build the react JS code that runs on node, recommended Node: 21.7.3, Package Manager: npm 5.2+
* Check out the source code from GIT – To download the source code from git, follow the steps below to download source code on your local system.
  * git clone [https://github.com/mosip/partner-management-portal](https://github.com/mosip/partner-management-portal) (to clone the source code repository from git)

### For Production build

*   **Build the code**

    Follow the steps below to build the source code on your system.

    * Navigate to the pmp-reactjs-ui directory inside the cloned repository.
    * Run the command `npm run` build in that directory to build the code.
*   **Build Docker image**

    Follow the steps below to build the docker image on your system.

    * `docker build -t name .` (replace name with the name of the image you want, "." signifies the current directory from where the docker file has to be read.)
    * Example: `docker build -t pmp-reactjs-ui .`
*   **Run the Docker image**

    Follow the steps to build docker image on your system.

    * `docker run –d –p 80:80 --name container-name image-name` (to run the docker image created with the previous step,`-d` signifies to run the container in detached mode, `-p` signifies the port mapping left side of the":" is the external port that will be exposed to the outside world and right side is the internal port of the container that is mapped with the external port. Replace `container-name` with the name of your choice for the container, replace `image-name` with the name of the image specified in the previous step)
    * Example: `docker run -d -p 3000:3000--name nginx pmp-reactjs-ui`
* Now you can access the user interface over the internet via browser.
  * Example: `http://localhost:3000`

#### For Local build

*   Build & deploy the code locally

    Follow the steps below to build the source code on your system.

    * Navigate to the pmp-reactjs-ui directory inside the cloned repository. Then, run the following command in that directory:
      * `npm install`
      * `npm start`
* Now, you can access the user interface via browser.
  * Example: `http://localhost:3000`
