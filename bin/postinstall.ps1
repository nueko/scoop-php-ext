$php = $app.Split('-')[0];
$extension = $app.Split('-')[1];

$confd = "$persist_dir\..\$php\conf.d"

if ((test-path $confd)) {
    $confd = Convert-Path $confd
    Write-Output "Enabling extension $confd\$extension.ini"
    # create ini file
    Write-Output "extension=$dir\php_$extension.dll" | Set-Content "$confd\$extension.ini"
    # create uninstaller
    Write-Output "Remove-Item -Force -ErrorAction Ignore '$confd\$extension.ini'" | Set-Content "$dir\uninstall.ps1"
}
else {
    Write-Host -f Yellow "PHP was not installed through php bucket"
    Write-Host -f Yellow "Run 'scoop bucket add php https://github.com/nueko/scoop-php' to add the bucket then reinstall this extension"
    Write-Host "You can activate it manually by adding 'extension=$dir\php_$extension.dll' to your php.ini"
}
