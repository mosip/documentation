As a an SI,\
I want to validate the deployment of the eSignet module,\
So that we can ensure the system works correctly and securely after the
deployment and provide a seamless experience for users.

**Assumptions:**

1.  It is assumed that the user/SI is deploying eSignet for first time.
    No previous installation of eSignet exists.

2.  To run the installation in case there is already a eSigent
    installed, appropriate delete scripts are to be run first.

### Fresh Deployment:

**Steps for eSignet installation:**

1.  Please follow the deployment steps (Step1 to Step 12) for cluster
    set up in the [MOSIP deployment
    guide](https://mosip.atlassian.net/wiki/spaces/DevOps/pages/1526497300/Complete+Guide+to+Deploy+Esignet+1.5.x).

2.  Clone the eSignet repo from the mentioned github link -
    <https://github.com/mosip/esignet/tree/release-1.6.x> . Please
    follow the below command for cloning the repo:

    1.  {{git clone -b release-1.6.x
        <https://github.com/mosip/esignet.git> }}

    2.  Alternatively, zip file for the repo can be downloaded from
        github

3.  Once the repo is cloned user should navigate to the deploy folder
    and run install-prereq.sh file to install the pre-requisites for the
    eSignet. User should follow below commands:

    1.  ./install-prereq.sh

4.  Once the install file is run in above steps, user should be prompted
    to answer the below questions. User should be able to reply with
    'y\' or 'n' as per the need of the environment. If the services are
    already running then user should be able to to skip the installation
    by replying as \'n' for below questions.

    1.  \[\"hsm\"\]=\"Do you want to deploy hsm for esignet service ?
        Please opt for \'n\' if you already have hsm installed :(s - for
        softhsm, e - external, p - for pkcs12 based key management from
        mounted file) "

        1.  **\## The below question\[ii\] should be prompted only when
            the answer to the above is \'e\'.**

        2.  \["externalhsm"\] = "Do you have external hsm setup to which
            you want to connect eSignet ? Please opt for 'y\' if you
            have external hsm otherwise opt \'n' : "

        3.  **\## The below set of questions\[iv-vi\] should be prompted
            only when the answer to the above question \[ii\] is 'y\'.If
            the answer is \'n\' hsm installation should be skipped**

        4.  \["externalhsmclient"\] = "Please provide the url where
            externalhsm client zip is located : "

        5.  \["externalhsmhosturl"\] = "Please provide the hosturl for
            externalhsm : "

        6.  \["externalhsmpassword"\] = "Please provide the password for
            the externalhsm : "

    2.  \["apiaccesscontrol"\] = "Do you want to access control the
        esignet client management APIs: Please opt for \'n\' if not
        required. Press enter for default y"

        1.  Below warning message to be displayed if user enters n

        2.  "Warning! You have chosen to skip the keycloak
            initialization. The internal API's of eSignet will run with
            out access control. "

        3.  **\## The below question\[iv-vi\] should be prompted only
            when the answer to the above question is \'y\'.**

        4.  \["iamserverurl"\] = "Please provide the IAM server URL:
            Press enter to install default keycloak for access control "

        5.  \["adminuser"\] = "Please provide admin user for
            initialisation"

        6.  \["adminpassword"\] = "please provide admin password for
            initialisation"

5.  \[\"kafka\"\]=\"Do you want to deploy Kafka in the kafka namespace?
    Please opt for \'n\' if you already have a kafka deployed: Press
    enter for default y "

    1.  **\## The below question \[b\] should be prompted only when the
        answer to the above is \'n\'.**

    2.  \["kafkaurl"\] = Please provide the kafka url: "
        spring.kafka.bootstrap-servers

6.  \[\"postgres\"\]=\"Do you want to deploy postgres in the postgres
    namespace? Please opt for \'n\' if you already have a postgres
    server deployed : Press enter for default y "

    1.  **\## The below set of questions\[b-e\] should be prompted only
        when the answer to the above is 'n\'.**

    2.  \["postgreshostname"\] = "Please provide the hostname for the
        postgres server: "

    3.  \["postgresport"\] = "Please provide the port number for the
        postgres server: "

    4.  \["postgresusername"\] = "Please provide the username for the
        postgres server: "

    5.  \["postgrespassword"\] = "Please provide the password for the
        postgres server: "

7.  \[\"redis\"\]=\"Do you want to deploy redis in the redis namespace?
    : Press enter for default y "

    1.  **\## The below set questions\[b-d\] should be prompted only
        when the answer to the above is 'n\'.**

    2.  \["redishostname"\] = "Please provide the hostname for the redis
        server : "

    3.  \["redisport"\] = "Please provide the port number for the redis
        server : "

    4.  \["redispassword"\] = "Please provide the password for the redis
        server : "

8.  The installations should begin as per user requirement based on the
    above set of questions. Once the installation is completed, user
    should be asked to enter the below details to complete the setup for
    captcha validation service.

    1.  \["captchavalidationservice"\] = "Do you want to install captcha
        validation service : Press enter for default y"\
        \#**Warning message to be shown:** "It is not recommended to use
        the eSignet without captcha site key and captcha secret key in
        production env. Press enter to proceed"

    2.  **\## The below set questions\[c-d\] should be prompted only
        when the answer to the above is 'y\'.**

    3.  \["captchasitekey"\] = "Please provide the captcha site key "

    4.  \["captchasecretkey"\] = "Please provide the captcha secret key
        "

    5.  If opted n what needs to be done

9.  Pre requisite installation should be completed for the eSignet.

10. After the completion of the pre-requisite installation , user should
    run the initialise script located in deploy folder.Please use below
    command:

    1.  ./initialise-prereq.sh

11. User should be prompted to answer below questions based on whether
    the eSignet database is present or not in the postgres server url
    provided above.

    1.  \["postgres"\] = "eSignet database was not found. Running the db
        scripts to create and initialize the eSignet database : "

    2.  Information to be added in the guide for the IAM scope in the
        deployment guide

    3.  In the deployment script, certificate endpoint, binding endpoint
        and client management endpoint are to configured as internal

12. User should be able to choose whether eSignet installation is
    required with or without plugins.

13. If user wants to install eSignet with plugins, user should navigate
    the folder \'**esignet-with-plugins**\' and run below command:

    1.  ./install.sh

    2.  User should be prompted with below question to choose from the
        list of available plugins and install eSignet with only chosen
        plugin.

        1.  \["esignetplugin"\] = "Please choose the required plugin to
            proceed with installation.

            1.  esignet-mock-plugin

            2.  mosip-identity-plugin

            3.  sunbird-rc-plugin : "

            4.  "custom-plugin:"

        2.  The answer to the above question is option number - for ex
            '1\' or '2' or \'3'.

        3.  if the user chooses **\'esignet-mock-plugin\'**, user is not
            prompted any questions and the installation for mock plugin
            is completed automatically.

        4.  if the user chooses **\'esignet-with-mosip-id\'**, user is
            prompted with below questions with default url mentioned:

            1.  \["mosip.esignet.authenticator.ida.cert-url"\]="Default
                url :
                (<http://mosip-file-server.mosip-file-server/mosip-certs/ida-partner.cer>)
                Please provide custom value(if applicable) to override
                the default url: "

            2.  \["mosip.esignet.authenticator.ida.kyc-auth-url"\] =
                "Default url :
                (\[http://ida-auth.ida/idauthentication/v1/kyc-auth/delegated/\$
                {mosip.esignet.authenticator.ida.misp-license-key}/\|http://ida-auth.ida/idauthentication/v1/kyc-auth/delegated/\$%7Bmosip.esignet.authenticator.ida.misp-license-key%7D/\])
                Please provide custom url (if applicable) to override
                the default url: "\
                \####
                \["mosip.esignet.authenticator.ida.kyc-exchange-url"\] =
                "Default url :
                (\[http://ida-auth.ida/idauthentication/v1/kyc-exchange/delegated/\${mosip.esignet.authenticator.ida.misp-license-key}

> /\|http://ida-auth.ida/idauthentication/v1/kyc-exchange/delegated/\$%7Bmosip.esignet.authenticator.ida.misp-license-key%7D/\])
> Please provide custom url (if applicable) to override the default url
> : "

3.  \["mosip.esignet.authenticator.ida.send-otp-url"\] = "Default url :
    (\[http://ida-otp.ida/idauthentication/v1/otp/\$
    {mosip.esignet.authenticator.ida.misp-license-key}/\|http://ida-otp.ida/idauthentication/v1/otp/\$%7Bmosip.esignet.authenticator.ida.misp-license-key%7D/\])
    Please provide the custom url (if applicable) to override the
    default url : "\
    \#### \["mosip.esignet.binder.ida.key-binding-url"\] = "Default url
    :
    (\[http://ida-auth.ida/idauthentication/v1/identity-key-binding/delegated/\${mosip.esignet.authenticator.ida.misp-license-key}

> /\|http://ida-auth.ida/idauthentication/v1/identity-key-binding/delegated/\$%7Bmosip.esignet.authenticator.ida.misp-license-key%7D/\])
> Please provide the custom url (if applicable) to override the default
> url : "

4.  \["mosip.esignet.authenticator.ida.get-certificates-url"\] =
    "Default url :
    (<http://ida-internal.ida/idauthentication/v1/internal/getAllCertificates>)
    Please provide the custom url (if applicable) to override the
    default url : "

5.  \["mosip.esignet.authenticator.ida.auth-token-url"\] = "Default url
    (<http://authmanager.kernel/v1/authmanager/authenticate/clientidsecretkey>)
    Please provide the custom url (if applicable) to override the
    default url : "

6.  \["mosip.esignet.authenticator.ida.audit-manager-url"\] = "Default
    url (<http://auditmanager.kernel/v1/auditmanager/audits>) Please
    provide the custom url (if applicable) to override the default url :
    "

7.  \["mosip.esignet.authenticator.ida.otp-channels"\] = "Default
    channels (email,phone) Please add required channels to override the
    default channels : "

<!-- -->

5.  if the user chooses **\'eSignet-with-sunbird\'**, user is prompted
    with below questions with default url mentioned:

    1.  \["mosip.esignet.sunbird-rc.registry-get-url"\]= "Please provide
        the url for sunbird registry : "

<!-- -->

3.  Once the above input are taken from the user, eSignet installation
    should be initialized and completed successfully.

4.  If any error occurs during eSignet installation, user should be able
    to start the eSignet installation again after deleting the existing
    chart or fix the issue.

5.  If user choses, eSignet installation without plugin, below question
    is prompted:

    1.  \["custompluginurl"\] = "Please provide the url for the custom
        plugin you want to use : "

        1.  Above url can be zip file or jar file, so both zip url and
            jar file url should be supported for above variable

6.  Once the above input are taken from the user, eSignet installation
    should be initialised and completed successfully.

7.  If any error occurs during eSignet installation, we should be able
    to start the eSignet installation again after deleting the existing
    helm chart using delete.sh or debug the issue further.

<!-- -->

14. Once eSignet installation is completed, user should be prompted to
    provide relevant inputs for completing oidc ui deployment:

    1.  \["esignetthemes"\] = "Please provide the theme for the eSignet
        UI. Please choose between 'blue\' or \'orange' for esignet
        default theme : Press enter for the default theme. Please
        provide URL for the custom theme"

    2.  \["defaultlang"\] = "Please chose the default lang for esignet
        Please press enter for en : "

        1.  \* We should provide the existing list.

    3.  \["idprovidername"\] = "Please provide the name for eSignet :
        Note: This name would be used instead of eSignet on the login
        page and in other places"

15. Once OIDC UI installation should be initiated and completed
    successfully.

16. MISP onboarding should be initiated and completed successfully, if
    user have has chosen to install esignet with mosip ID, otherwise if
    user chooses to continue with mock or custom plugin no MISP
    onboarding is required, and this step should be skipped.

17. esignet installation should be completed at this step.

18. Informational message - Please refer deployment guide to know more
    about the mock replying party portal installation, having mock
    relying party portal installed will be helpful to verify the
    complete eSignet flow.

19. To verify the eSignet flow, user should be able install the api test
    suites and run it. Below steps are to be followed:(To check with
    [Sivanand](https://mosip.atlassian.net/secure/ViewProfile.jspa?accountId=60522eea60d39e006f6e9672)
    if this can be simplified)

    1.  Create a directory for api test suites on the NFS server at
        /srv/nfs/mosip/\<sandbox\>/apitestrig/:

        1.  mkdir -p /srv/nfs/mosip/\<sandbox\>/apitestrig/

    2.  Ensure the directory has 777 permissions:

        1.  chmod 777 /srv/nfs/mosip/\<sandbox\>/apitestrig

    3.  Add the following entry to the /etc/exports file:

        1.  /srv/nfs/mosip/\<sandbox\>/apitestrig
            \*(ro,sync,no_root_squash,no_all_squash,insecure,subtree_check)

    4.  If user has chosen to install esignet with mosip id plugin, user
        should be prompted to provide the below inputs

        1.  \["iamadminuserformasterrealm"\] = "Please provide the key
            cloak admin user for master realm : "

        2.  \["iamadminpasswordformasterrealm"\] = "Please provide the
            key cloak admin password for master realm : "

    5.  Navigate to the folder \'**esignet-apitestrig**\' and run the
        install.sh file with below command:

        1.  ./install.sh

    6.  After the installation of the api test suites , user should
        refer the below readme file to follow the steps to run the API
        test rig:

        1.  <https://github.com/mosip/esignet/blob/release-1.5.x/deploy/esignet-apitestrig/README.md>

    7.  To confirm the test report matches the bench mark user should
        refer the latest release test report present under release
        section in the eSignet docs:

        1.  Link to the automation report -
            <https://docs.esignet.io/versions>

### Upgrade Deployment(upgrading eSignet to new version):

This is out of scope for this story.

Steps to be followed if the user is trying to upgrade the eSignet to the
newer version:

**Steps to upgrade:**

1.  Run upgrade-all.sh file to upgrade eSignet version:

    1.  ./upgrade-all.sh (We should check if we can only deploy folder
        to be downloaded and cloning and other things script takes care
        [[Chandra Keshav
        Mishra]{.underline}](https://mosip.atlassian.net/secure/ViewProfile.jspa?accountId=5d4159ed4125b20c3159b1ed)
        )

    2.  Upgrade script should be able to identify the version user is
        using and upgrade to the version from where the they are using
        the upgrade script

        1.  \["eSignetbackup"\] = "Please confirm with \'y\' to start
            the back up process: "(Check if this can be done with the
            script)

            1.  If user chooses to reply with \'n\' and do not confirm
                to start the back up process, then the upgrade script
                should throw an error and upgrade should be halted

            2.  Once user confirms the process to start the back up,
                user should be displayed with the information on what is
                getting backed up in form of running comments and total
                progress

        2.  Upgrade process should start, if in any case the upgrade is
            halted for any unseen circumstances, script should be able
            to start the rollback

        3.  If user halts the upgrade process then user should have
            option to manually initiate the rollback process to the
            current version of the eSignet that user has

    3.  Once the upgrade is completed to verify the eSignet flow, user
        should be able install the api test suites and run it. Below
        steps are to be followed:

        1.  Create a directory for api test suites on the NFS server at
            /srv/nfs/mosip/\<sandbox\>/apitestrig/:

            1.  mkdir -p /srv/nfs/mosip/\<sandbox\>/apitestrig/

        2.  Ensure the directory has 777 permissions:

            1.  chmod 777 /srv/nfs/mosip/\<sandbox\>/apitestrig

        3.  Add the following entry to the /etc/exports file:

        4.  /srv/nfs/mosip/\<sandbox\>/apitestrig
            \*(ro,sync,no_root_squash,no_all_squash,insecure,subtree_check)

        5.  Navigate to the folder \'**esignet-apitestrig**\' and run
            the install.sh file with below command:

            1.  ./install.sh

        6.  After the installation of the api test suites , user should
            refer the below readme file to follow the steps to run the
            API test rig:

            1.  <https://github.com/mosip/esignet/blob/release-1.5.x/deploy/esignet-apitestrig/README.md>

        7.  To confirm the test report matches the bench mark user
            should refer the latest release test report present under
            release section in the eSignet docs:

            1.  Link to the automation report -
                <https://docs.esignet.io/versions>
