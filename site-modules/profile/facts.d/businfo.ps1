$hostname = get-content env:computername
Write-Host -foregroundcolor Yellow "Computername is $hostname"
if ($hostname.StartsWith('r')){
    Write-Host "business_unit=retail"
}elseif ($hostname.StartsWith('b')){
    Write-Host "business_unit=banking"
}else {
    Write-Host "business_unit=it"
}

