function Set-ConnectorRelay {
    ### New Connector for Printers and Webformular
    ### By Emil Kraft Mathiasen
    ### V. 1.0
    ### test
    
    
    param (
            [Parameter(Mandatory = $true, HelpMessage = "Please put in the fallbackdomain eg '.onmicrosoft.com'")]
            [string]$DelegatedOrg,
            [Parameter(Mandatory = $true, HelpMessage = "Insert the Wan IPadress")]
            [string]$IPaddress,
            [Parameter(Mandatory = $true, HelpMessage = "Give the connector a name")]
            [string]$NameOFConnector
  
      )
      Write-host "Connecting in Exchange Online"
    #Delegated 
      Connect-ExchangeOnline -DelegatedOrganization "$DelegatedOrg"
    Write-host "Checking for OrganizationCustomization - Enables it, if possible"
    # OrganizationCustomization is necessary in order to apply a connector
    $orgconf = Get-OrganizationConfig
    if ($orgconf.IsDehydrated) {
            Enable-OrganizationCustomization
            Write-Host "Microsoft services are taking longer than expected. Please try again later"
            return 
      }

      Write-Host "Setting up the connector"

    #
      
    New-InboundConnector -Name "$NameOFConnector" -ConnectorType 'OnPremises' -SenderDomains * -SenderIPAddresses $IPaddress -RestrictDomainsToIPAddresses $true


    #Now giving the info
    

    $Getdomain = Get-AcceptedDomain | Where-Object { $_.Default -eq $true }
    $mxRecords = Resolve-DnsName -Name $Getdomain.name -Type MX      
    $Mxdomain = $MxRecords.NameExchange 

    Start-Sleep -Seconds 3

    Write-host "This SMTP information you should use:"
    Write-host "Servername: $Mxdomain"
    Write-host "Port: 25"
    Write-host "Kryptering: StartTLS"
    Write-host "Intet Brugernavn/Password"

    Write-host "Remember to include the following in the spf record: ip4:$IPaddress"

    
}
set-ConnectorRelay