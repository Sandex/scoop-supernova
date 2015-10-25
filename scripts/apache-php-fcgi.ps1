write-host "checking..."

# check for apache
$apache = scoop which httpd
if($lastexitcode -ne 0) { 'Apache isn''t installed. run ''scoop install apache'''; return }

# check for php
$php = scoop which php
if($lastexitcode -ne 0) { 'PHP isn''t installed. run ''scoop install php'''; return }

$conf = "$(split-path $apache)/../conf/httpd.conf"

'enabling PHP handler...'
$phpfcgi = "$(split-path $php -resolve)\php-cgi.exe"
if(test-path $phpfcgi) {
	$phpfcgi = $phpfcgi -replace '\\', '/'
	"
# php setup handler via FastCGI
<IfModule fcgid_module>
  <Files ~ `".php`$`">
    AddHandler fcgid-script .php
    FcgidWrapper `"$phpfcgi`" .php
  </Files>
  
  FcgidMaxRequestLen 104857600
  FcgidIOTimeout 1200
</IfModule>

	" | out-file $conf -append -encoding utf8
} else {
	"error: couldn't find $phpmodule"; return
}

"done"
