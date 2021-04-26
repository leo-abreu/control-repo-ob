#$hostname = get-content env:computername
# For testing purposes, the value for computername will be pulled from an external fact defined
# on the node's agent facts.d directory.  The host value can be changed to simulate test of a use
# when a customer has a host naming convention of classifying their nodes and key off of that to
# to drive data-based actions, configurations.

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

