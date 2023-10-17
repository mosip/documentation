# Registration Client Setup Guide

Welcome to the [Registration Client](https://docs.mosip.io/1.2.0/modules/registration-client) Setup Guide tailored specifically for our Collab Environment!

The Registration Client setup guide for the MOSIP Collab environment offers a detailed and user-friendly walkthrough to assist you in configuring and accessing the Registration Client module. This module is specifically designed to provide Operators/Supervisors with a wide range of functionalities, including onboarding, data synchronization, packet management, and more.

The primary goal of this guide is to ensure that you can efficiently set up the Registration Client in the MOSIP Collab environment with minimal effort. Whether you are new to the module and just starting to explore its features or an experienced operator seeking a streamlined setup process, this document will guide you through the essential steps to ensure that you have all the necessary tools  available at your disposal.

With the implementation of this Registration Client Demo Setup, you are now on track to demonstrate the remarkable capabilities of MOSIP's Registration system. Let us proceed with the next steps to commence the process.

## Pre-requisites 

### Hardware

   * Workstation

   * Windows 10/11 laptop or desktop 

   * Minimum 16 GB RAM 

   * 50 GB of free space on the hard disk 

   * The workstation should be TPM 2.0 enabled. To access the guidelines on how to verify the TPM compatibility of your workstation, 
     click [here](https://www.howtogeek.com/287737/how-to-check-if-your-computer-has-a-trusted-platform-module-tpm-chip/#:~:text=To%20open%20it%2C%20press%20Windows,PC%20does%20have%20a%20TPM).
  
     _Note_: It is important that your workstation is TPM 2.0 enabled and does not operate on any older version of TPM.  In the event 
     that your workstation currently utilizes an older iteration such as TPM 1.2, it may be necessary to upgrade your BIOS firmware to 
     enable TPM 2.0. Should you require assistance in carrying out this upgrade, please reach out to your vendor for guidance.


### Software

  * **JAVA** - Ensure JAVA 11 is installed and `JAVA_HOME` is in the PATH. To download JAVA 11 in your system, click [here](https://www.oracle.com/in/java/technologies/javase/jdk11-archive-downloads.html).
    
    * Download the JDK installer

        * Access the Java SE Downloads page and click `Accept License Agreement`. Under the Download menu, click the download link that 
          corresponds to the `.exe` for your version of Windows 10.
        * Download the file `jdk-11.interim.update.patch_windows-x64_bin.exe`.
        
    * Run the JDK installer
       * You must have administrator privilege to install the JDK on Microsoft Windows. 
       * To run the JDK installer, start the JDK 11 installer by double-clicking the installer's icon or file name in the download 
         location.
       * Follow the instructions provided by the installer.
       * After the installation is complete, delete the downloaded file to recover the disk space.
   
* **Download and run the TPM Utility** 

  * This is used for registering the workstation on which the Registration Client would be executed. 

  * To access and set up the utility, click [here](https://drive.google.com/file/d/1pY4388ER4KKBonyPCZni-VMoDYAV2bRj/view?usp=sharing).

  * Steps to download and extract the TPM utility

      * Open the README.txt file for supporting information.

      * Download and extract the TPM utility (using the command prompt).

      * Run the following command from the folder where the TPM jar is located (The location of the folder is necessary while running 
      the command) - `java -jar tpmutility-0.0.2.jar  > tpmdetails.txt`

      * Make note of the details within **tpmdetails.txt** for the next step.

* **Share TPM Details**

   * Once the TPM utility is extracted and run in your system, fill out the details in this form [here](https://docs.google.com/forms/d/e/1FAIpQLSfqx6K8uZI-AxakNJiJLj4Vh5lSr7Lb1rqZaX_05MoyR2aXsQ/viewform?fbzx=-6425171175964917239) to get your machine registered with MOSIP.

  * Make sure you share **tpmdetails.txt** with us according to the form fields. 

  * Once the details are received, we at MOSIP, will register your machine for usage of Registration Client in the Collab environment.

* **Credentials**: Once the TPM request is received via the [form](https://docs.google.com/forms/d/e/1FAIpQLSfqx6K8uZI-AxakNJiJLj4Vh5lSr7Lb1rqZaX_05MoyR2aXsQ/viewform?fbzx=-6425171175964917239), and your machine is registered with us, we will provide you with the necessary credentials to access the Registration Client and share the details with you via your email ID provided in the form. 

* **Mock MDS**: Click [here](https://drive.google.com/drive/folders/14q7E5pZtfj0eimF3JGzlVfU4eV-MRPCQ) to download the Mock MDS in your system folder, which will enable you to simulate biometric capture (without real biometric devices).

  **Steps to run Mock MDS**

    * Download the Mock MDS zip provided [here](https://drive.google.com/drive/folders/14q7E5pZtfj0eimF3JGzlVfU4eV-MRPCQ).

    * Click on the folder where the Mock MDS is downloaded and double-click on the folder name **mock**.

    * You will be able to see the `run.bat` file in the **mock** folder.

    * Double-click on `run.bat` and extract the file in your system where you can name the folder **Collab-mock-mds-reg**.

    * Click on the **Collab-mock-mds-reg** folder where you will find the sub-folder called **Target** and then you can click on the     
      **Target** folder to find the required files to run in the system to activate mock mds.

    * You can click and explore `collab-mock-mds-reg › target › Profile › Default › Registration` to see the demo biometrics already 
      updated for finger, iris and face which will be used while testing the Registration Client, so you won’t be required to do any 
      additional work here.

    * Click on `run_reg.bat` to run the mock MDS for the Registration Client.
 
## Step-by-Step Process

To effectively experience the Registration Client features in the Collab environment, follow the steps given below:

**Step 1: Access the Registration Client Portal**

Visit the following URL to access the Registration Client portal in the Collab environment: [Registration Client](https://regclient.collab.mosip.net/) Portal

Click on **Registration Client- Windows 10** and [download](https://regclient-api.collab.mosip.net/registration-client/1.2.0.1-B1/reg-client.zip) it to your local system.

**Step 2: Login**

Login to the portal with the username and password that you should have received, on completion of the above pre-requisites.

**Step 3: Explore the features on the Registration Client Portal**

To start running the Registration Client, refer to our [Registration Client Installation Guide](https://docs.mosip.io/1.2.0/modules/registration-client/registration-client-installation-guide).

To access all the features of the Registration Client portal and explore the registration process in MOSIP, refer [Registration Client User Guide](https://docs.mosip.io/1.2.0/modules/registration-client/registration-client-user-guide).

_Note_: For Supervisor Authentication and Packet Approval Authentication, please provide the same username and password that was provided during login.

### Get in Touch

If you require any assistance or encounter any issues during the testing and integration process, kindly reach out to us through the support mechanism provided below.

* Navigate to [Community](https://community.mosip.io/).
* Provide a detailed description about the support you require or provide detailed information about the issue you have encountered, including steps to reproduce, error messages, logs and any other relevant details.

_Thank you. Wishing you a pleasant experience!_
 
  
