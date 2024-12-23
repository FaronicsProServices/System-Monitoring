# Retrieves and displays detailed information about the software license, including the product key and license status
$lic = Get-WmiObject -Class SoftwareLicensingProduct | Where-Object {$_.PartialProductKey -ne $null} 
$id  = (Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
echo "License Name: $($lic.Name)" 
echo "Descriptions: $($lic.Description)" 
echo "Application ID: $($lic.ApplicationId)" 
echo "Product Key Channel: $($lic.ProductKeyChannel)" 
echo "Use License URL: $($lic.UseLicenseURL)" 
echo "Validation URL: $($lic.ValidationURL)" 
echo "PartialProductKey: $($lic.PartialProductKey)" 
echo "ProductKey ID: $($lic.ProductKeyID)" 
echo "License Status: $($lic.LicenseStatus)" 
echo "Product Key: $id"
