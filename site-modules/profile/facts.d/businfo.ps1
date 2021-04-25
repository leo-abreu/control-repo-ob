$hostname = get-content env:computername
Write-Host -foregroundcolor Yellow "Computername is $hostname"
if ($hostname.StartsWith('r')){
    Write-Host "bu=retail"
}elseif ($hostname.StartsWith('b')){
    Write-Host "bu=banking"
}else {
    Write-Host "bu=it"
}

