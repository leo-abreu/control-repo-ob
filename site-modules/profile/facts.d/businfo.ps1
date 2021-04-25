#$hostname = get-content env:computername
$Path = "C:\ProgramData\PuppetLabs\facter\facts.d\buildinfo.txt"
$values = [pscustomobject](Get-Content $Path -Raw | ConvertFrom-StringData)
$hostname = $values.host
#Write-Host -foregroundcolor Yellow "Computername is $hostname"
if ($hostname.StartsWith('r', "CurrentCultureIgnoreCase")) {
    Write-Host "bu=retail"
}
elseif ($hostname.StartsWith('b', "CurrentCultureIgnoreCase")) {
    Write-Host "bu=banking"
}
elseif ($hostname.StartsWith('l', "CurrentCultureIgnoreCase")) {
    Write-Host "bu=legal"
}
else {
    Write-Host "bu=it"
}

