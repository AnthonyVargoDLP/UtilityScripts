# Usage:
#
# > SplitTunnel -ConnectionName [VPN-Connection-Name] -Subnet [VPN-Subnet]
#
# Note: You'll need to enclose multi-word parameters in quotes.
# Another note: You may need to run Set-ExecutionPolicy Unrestricted before running this.

[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$ConnectionName,
    
    [Parameter(Mandatory=$True,Position=2)]
    [string]$Subnet
)
$routeTable = [string](route print)

If ($routeTable -match "$Subnet")
{
    Write-Output "Route to $ConnectionName ($Subnet) already exists. No changes made."
}
ElseIf ($routeTable -match '(\d+)\.+' + "$ConnectionName")
{
    Write-Output "Route to $ConnectionName ($Subnet) does not exist. Adding..."
    $interfaceNumber = $matches[1]
    $command = 'route -p add ' + "$Subnet" + ' mask 255.255.255.0 0.0.0.0 IF ' + "$interfaceNumber"
    Invoke-Expression $command
}
