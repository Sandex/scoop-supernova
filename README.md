# scoop-supernova
Scoop bucket

The "supernova" another bucket for [Scoop](http://scoop.sh).

Scoop is a command-line installer for Windows, like homebrew.


How to add bucket
=====

To make it easy to install apps from this bucket, run
    `scoop bucket add scoop-supernova https://github.com/Sandex/scoop-supernova.git`
    
Check that it works:
    `scoop bucket list`

For update run:
    `scoop update`
    
Search for example php7:
    `scoop search php`
    
For example install:
    `scoop install php7`
    
For example install 32bit version:
    `scoop install php7 -a 32bit`    


How to start use scoop
=====

Requirements:

* [PowerShell 3](http://www.microsoft.com/en-us/download/details.aspx?id=34595)
* PowerShell must be enabled for your user account e.g. `set-executionpolicy unrestricted -s cu`

To install:

    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

Once installed, run `scoop help` for instructions.
