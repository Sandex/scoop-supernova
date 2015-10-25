write-host "checking..."

# check for apache
$apache = scoop which httpd
if($lastexitcode -ne 0) { 'Apache isn''t installed. run ''scoop install apache'''; return }

# check for php
$php = scoop which php
if($lastexitcode -ne 0) { 'PHP isn''t installed. run ''scoop install php'''; return }

$conf = "$(split-path $apache)/../conf/httpd.conf"

'enabling PHP handler...'
$phpmodule = "$(split-path $php -resolve)\php7apache2_4.dll"
if(test-path $phpmodule) {
	$lines = gc $conf
	$phpmodule = $phpmodule -replace '\\', '/'
	"
  # php setup
	LoadModule php5_module '$phpmodule'
	AddHandler application/x-httpd-php .php
	PHPIniDir `"$(split-path $phpmodule)`"
	" | out-file $conf -append -encoding utf8
} else {
	"error: couldn't find $phpmodule"; return
}

"done"
