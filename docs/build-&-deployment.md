# Build & Deployment

The developer guide for building and running various components of e-Signet is available in their respective repositories as mentioned below.

## Command to build

### Building [IdP-service](https://github.com/mosip/idp/tree/0.9.0)

**Prerequisite**

    * Java 11
    * Apache Maven 3.8.6
    
* Run the command `mvn clean install -Dgpg.skip=true` to build the project, skipping the build signing.

* After successful build, the below artifacts will be available under target folder of each module:

    * idp-core/target
    * idp-service/target
    * authentication-wrapper/target

> Note: `authentication-wrapper` is a runtime dependency and it must be available in the classpath when running the `idp-service`.

### Building [IdP-UI](https://github.com/mosip/idp-ui/tree/0.9.0)
    
**Prerequisite**

     * npm 8.1.2 or higher  
     * node v16.13.2 or higher

* Run command `npm run build` to build the project.
* After successful build, the complete JS bundle with public files will be available under `idp-ui/build` folder

### Building [Mock OIDC client](https://github.com/mosip/oidc-demo-portal/tree/0.9.0)

**Prerequisite**
    * npm 8.1.2 or higher
    * node v16.13.2 or higher

* Run command `npm run build` to build the project.
* After successful build, the complete JS bundle with public files will be available under oidc-demo-portal/build folder
    
### Published artifacts

* mosipid/idp:0.9.0
* mosipid/idp-ui:0.9.0
* mosipid/oidc-ui:0.9.0
* mosipid/oidc-server:0.9.0


## Deployment [TODO]

Prerequisite

Can I use the dockers directly?

How can I run it on my development machine?

How to deploy?

How to scale

How to configure

How to test
