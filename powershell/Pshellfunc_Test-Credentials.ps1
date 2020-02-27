function Test-Cred{

    Param(
        $Username = $null,
        $Password = $null
    )
    $Domain = $null
    $Root = $null
      
    Try
    {
        # Split username and password
        #$Username = $credentials.username
        #$Password = $credentials.GetNetworkCredential().password
  
        # Get Domain
        $Root = "LDAP://" + ([ADSI]'').distinguishedName
        $Domain = New-Object System.DirectoryServices.DirectoryEntry($Root,$UserName,$Password)
    }
    Catch
    {
        $_.Exception.Message
        Continue
    }
  
    If(!$domain)
    {
        Write-Warning "Something went wrong"
    }
    Else
    {
        If ($domain.name -ne $null)
        {
            return "Valid password for:  $Username"
        }
        Else
        {
            return "Invalid password for:  $Username"
        }
     }
}