# Deploying Monster UI
This page discusses how to deploy Monster UI so that it is able to run on a given server, and be accessed by a user.

## Apache on Windows 10
Download Apache from: http://www.apachehaus.com/cgi-bin/download.plx
Extract the downloaded zip file to C:\Apache24.
Open a command prompt at C:\Apache24\bin as administrator
Type httpd.exe and press Enter
You may get the following error:
(OS 10013)An attempt was made to access a socket in a way forbidden by its acces
s permissions.  : AH00072: make_sock: could not bind to address [::]:80
(OS 10013)An attempt was made to access a socket in a way forbidden by its acces
s permissions.  : AH00072: make_sock: could not bind to address 0.0.0.0:80
AH00451: no listening sockets available, shutting down
AH00015: Unable to open logs

This means that another process is using port 80, which is necessary for Apache.
To check what is using port 80, type netstat -ao into a command prompt. This shows you a list of process using ports. Check which process is using port 80 and find its PID. Then, open Task Manager and find the process by PID. NOTE: the process might be important, do not stop it until you are sure it will not cause issues.
The process using port 80 could be W3C Logging Service. To check if this is the case, open Administrative Tools > Services and see if W3C Logging Service is running. If so, right click it, click Properties, click stop, set the startup type to manual and apply the changes. Then try executing httpd.exe again.

If it is set up correctly, opening a browser and typing http://localhost:80/ should show a page titled "Apache Haus Readme First".

## Installing MUI
To install MUI, follow the instructions [here](https://bitbucket.org/conversantltd/monster-ui-3.20) or use the script and instructions located [here](https://bitbucket.org/conversantltd/kazoo_scripts/src/fab89de93245df5d75f503461c95f650fbce10ca/get_monster/?at=master) to perform these operations automatically. Ignore the section about adding the app to the appstore - this is not necessary.

Generally, MUI is installed in a descriptive folder name under /var/www/html.

To change the API used by MUI, alter the /path/to/mui/js/config.js file's api.default entry to read:

* For Landsdale: http://119.9.42.223:8000/v2/
* For Arefu: http://119.9.24.149:8000/v2/

## Deploying MUI
To deploy MUI, add a the following to /etc/httpd/conf/httpd.conf (or /etc/apache2/extra/httpd-vhosts.conf for a Mac):

```
#!

<VirtualHost *:80>
    ServerAdmin your-email@conversant.co.nz
    DocumentRoot /path/to/monster-folder-name
    ServerName descriptive-name.server.conversant.co.nz
    <Directory "/path/to/monster-folder-name">
        Options FollowSymLinks
        AllowOverride None
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>
```
Ensure your httpd.conf has the 'include vhosts' line uncommented. Then run the following command:

```
#!

sudo service httpd restart
```

## Accessing Deployed MUI
To access this instance of MUI, add the following to your hosts file (Generally /etc/hosts):

```
#!

serverIP descriptive-name.server.conversant.co.nz
```

Finally, enter this URL in your browser to access MUI!