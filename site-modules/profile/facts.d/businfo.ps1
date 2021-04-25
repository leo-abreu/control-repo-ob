$hostname = get-content env:computername
$hostname = 'RA-WIN1'
Write-Host -foregroundcolor Yellow "Computername is $hostname"
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

