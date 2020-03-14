# ApacheDs Installation and Config

The below documentation is for linux machines.

## Install Java
```
sudo yum install java-1.8.0-openjdk-devel
```

## Download ApacheDs
Use one of the three methods below to download the binary file of ApacheDs.

* Execute the below command in the terminal.
    ```shell
    wget http://mirrors.estointernet.in/apache//directory/apacheds/dist/2.0.0.AM25/apacheds-2.0.0.AM25-64bit.bin
    ```

* Click [here](https://mirrors.estointernet.in/apache//directory/apacheds/dist/2.0.0.AM25/apacheds-2.0.0.AM25-64bit.bin) to download ApacheDs binary file in your system and move it to the VM using tools like [WINSCP](https://winscp.net/eng/download.php), scp command in linux terminals etc.

* If the download link above doesnot work, visit [ApacheDs downloads](https://directory.apache.org/apacheds/downloads.html) page and select Linux binary installer to download file to your system. Then move it to the VM using tools like [WINSCP](//winscp.net/eng/download.php), scp command in linux terminals etc.

## Install ApacheDs

* Navigate to the directory where you downloaded the ApacheDs binary file and run the follwing command.
    ```shell
    bash apacheds-2.0.0.AM25-64bit.bin
    ```
**Note:** apacheds-2.0.0.AM25-64bit.bin is the name of the binary file we downloaded. Change it if your file name differs.

* Now you will see a Apache License agreement as shown in the screenshot below.

![](_images/apache_directory_studio_user_guide/apacheds-installation-1.png)

Press Enter key to read through the license agreement untill you are prompted to agree with terms with yes as shown in the screen shot below.

![](_images/apache_directory_studio_user_guide/apacheds-installation-2.png)

* Once you accept the license terms, you are asked to enter the installation paths as shown below.

![](_images/apache_directory_studio_user_guide/apacheds-installation-3.png)

**Note:** All the paths provided in the above screenshot are set to defaults in current implementation where as the instance name, user name and group name are provided as shown in the diagram.

* After providing all the paths, successful installation message is displayed as shown in the below screenshot.

![](_images/apache_directory_studio_user_guide/apacheds-installation-4.png)


## Go to the location (cd /etc/init.d) Start, Stop and check status ApacheDs server.

* To run ApacheDs server, run the below command       
    ```shell
    ./apacheds-2.0.0.AM25-mosip start
    ```
* To check status of ApacheDs server, run the below command
    ```shell
    ./apacheds-2.0.0.AM25-mosip status
    ```
* To stop ApacheDs server, run the below command
    ```shell
    ./apacheds-2.0.0.AM25-mosip stop
    ```

![](_images/apache_directory_studio_user_guide/apacheds-installation-7.png)