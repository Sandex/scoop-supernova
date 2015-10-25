# scoop-supernova

The "supernova" another bucket for [Scoop](http://scoop.sh).
Scoop is a command-line installer for Windows, like homebrew.


How to start use scoop
=====

Requirements:

* [PowerShell 3](http://www.microsoft.com/en-us/download/details.aspx?id=34595)
* PowerShell must be enabled for your user account e.g. `set-executionpolicy unrestricted -s cu`


On Windows 8 and 10 Power Shell already installed.
For run just type in cmd:

    powershell

To install scoop (run in powershell console):

    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

Once installed, run `scoop help` for instructions.


How to add this bucket
=====

To make it easy to install apps from this bucket, run
    `scoop bucket add scoop-supernova https://github.com/Sandex/scoop-supernova.git`
    
Check that it works:

    scoop bucket list

For update run:

    scoop update
    
For example, search all avialable PHP packages:
    
    scoop search php
    
For example, install PHP7:

    scoop install php7
    
For example install 32bit version:

    scoop install php7 -a 32bit

    
    
How to install PHP7
---

To install:

    scoop install php7

Сheck that it works:

    php -v

You can find path to php use command:

    scoop which php

    
NOTE: PHP7 (also as and Apache VC14) builded with the latest Windows Visual Studio C++ 2015.
Depending on the VC14 specified in a package as `"depends": "ms-vc14"`. When the scoop will do the installation, it will automatically check for dependencies, download and make their installation.    
    

How to install Apache
---

To install:

    scoop install apache-vc14

To find the location use:

    scoop which httpd

Now just run for test `httpd`, and open http://localhost/ in browser.


    
How to run Apache as Windows service
---

At first you need install sudo:

    scoop install sudo
    
The run:

    sudo httpd -k install -n apache
    sudo net start apache
    
It's done!

    
    
PHP7 with Apache
---

Now you have two ways to connect PHP to the Apache.


1. Connect PHP to Apache via FCGI (recommended)

At first install fcgi module:

    scoop install apache-mod-fcgi

And then add PHP handler fcgi to httpd.conf:

    iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/Sandex/scoop-supernova/master/scripts/apache-php-fcgi.ps1')
    
Now restart Apache:

    httpd -k restart -n apache
    
Done!    


2. Load PHP as Apache module

iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/Sandex/scoop-supernova/master/scripts/apache-php-module.ps1')

Done!
