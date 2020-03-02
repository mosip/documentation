ClamAV is a free, cross-platform and open-source antivirus software toolkit able to detect many types of malicious software, including viruses.

**Steps to install ClamAV in RHEL-7.5** 

To install clamAV first we need to install EPEL Repository:

    $ sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
After that we need to install ClamAV and its related tools.

    $ yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd
After completion of above steps, we need to configure installed ClamAV. This can be done via editing /etc/clamd.d/scan.conf. In this file we have to remove Example lines. So that ClamAV can use this file's configurations. We can easily do it via running following command -

    $ sed -i '/^Example/d' /etc/clamd.d/scan.conf
Another thing we need to do in this file is to define our TCP server type. Open this file using -

    $ vim /etc/clamd.d/scan.conf
here this we need to uncomment line with #LocalSocket /var/run/clamd.scan/clamd.sock. Just remove # symbol from the beginning of the line.

Now we need to configure FreshClam so that it can update ClamAV db automatically. For doing that follow below steps -

First create a backup of original FreshClam Configuration file -

    $ cp /etc/freshclam.conf /etc/freshclam.conf.bak
In this freshclam.conf file, Here also we need to remove Example line from the file. Run following command to delete all Example lines-

    $ sed -i '/^Example/d' /etc/freshclam.conf
Test freshclam via running-

    $ freshclam
After running above command you should see an output similar to this -

    ClamAV update process started at Thu May 23 07:25:44 2019
    .
    .
    .
    .
    main.cvd is up to date (version: 58, sigs: 4566249, f-level: 60, builder: sigmgr)
    Downloading daily-25584.cdiff [100%]
    daily.cld updated (version: 25584, sigs: 1779512, f-level: 63, builder: raynman)
    bytecode.cld is up to date (version: 331, sigs: 94, f-level: 63, builder: anvilleg)
    Database updated (6345855 signatures) from database.clamav.net (IP: 104.16.218.84)
We will create a service of freshclam so that freshclam will run in the daemon mode and periodically check for updates throughout the day. To do that we will create a service file for freshclam -

    $ vim /usr/lib/systemd/system/clam-freshclam.service

And add below content -
```
[Unit]
Description = freshclam scanner
After = network.target

[Service]
Type = forking
ExecStart = /usr/bin/freshclam -d -c 4
Restart = on-failure
PrivateTmp = true
RestartSec = 20sec

[Install]
WantedBy=multi-user.target
```
Now save and quit. Also reload the systemd daemon to refresh the changes -

    $ systemctl daemon-reload
Next start and enable the freshclam service -

    $ systemctl start clam-freshclam.service

    $ systemctl enable clam-freshclam.service
Now freshclam setup is complete and our ClamAV db is upto date. We can continue setting up ClamAV. Now we will copy ClamAV service file to system service folder.

    $ mv /usr/lib/systemd/system/clamd@.service /usr/lib/systemd/system/clamd.service
Since we have changed the name, we need to change it at the file that uses this service as well -

    $ vim /usr/lib/systemd/system/clamd@scan.service
Remove @ symbol from .include /lib/systemd/system/clamd@.service line and save the file.

We will edit Clamd service file now -

    $ vim /usr/lib/systemd/system/clamd.service
Add following lines at the end of clamd.service file.

    [Install]
    WantedBy=multi-user.target
And also remove %i symbol from various locations (ex: Description and ExecStart options). Note that at the end of the editing the service file should look something like this -

    [Unit]
    Description = clamd scanner daemon
    Documentation=man:clamd(8) man:clamd.conf(5) https://www.clamav.net/documents/
    # Check for database existence
    # ConditionPathExistsGlob=@DBDIR@/main.{c[vl]d,inc}
    # ConditionPathExistsGlob=@DBDIR@/daily.{c[vl]d,inc}
    After = syslog.target nss-lookup.target network.target

    [Service]
    Type = forking
    ExecStart = /usr/sbin/clamd -c /etc/clamd.d/scan.conf
    Restart = on-failure

    [Install]
    WantedBy=multi-user.target
Now finally start the ClamAV service.

    $ systemctl start clamd.service
If it works fine, then enable this service and test the status of ClamAV service -

    $ systemctl enable clamd.service

    $ systemctl status clamd.service
Now in MOSIP we require ClamAV to be available on Port 3310. To expose ClamAV service on Port 3310, edit scan.conf

    $ vi /etc/clamd.d/scan.conf
and Uncomment #TCPSocket 3310 by removing #. After that restart the clamd@scan service -

    $ systemctl restart clamd@scan.service
Since we are exposing ClamAV on 3310 port, we need to allow incoming traffic through this port. In RHEL 7 run below command to add firewall rule -

    $ sudo firewall-cmd --zone=public --add-port=3310/tcp --permanent 
    $ sudo firewall-cmd --reload
Reference link: [link](https://www.golinuxcloud.com/steps-install-configure-clamav-antivirus-centos-linux</div>)