$Path = "c:\DC4CU\dc4cu.ini"
$values = Get-Content $Path | Out-String | ConvertFrom-StringData
$subnet = $values.subnet
Add-DnsServerPrimaryZone -NetworkID $subnet -ReplicationScope "Forest"