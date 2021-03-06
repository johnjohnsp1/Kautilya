<#
.SYNOPSIS
A script with Kautilya which could be used with DNS TXT Backdoor and others which decodes a base64 string to readable.

.DESCRIPTION
This payload decodes a base64 string to readable.

.PARAMETER Base64Strfile
The filename which contains base64 string to be decoded.
Use the parameter -IsString while using a string instead of file.

.EXAMPLE
PS > .\Base64ToString base64.txt

.EXAMPLE
PS > .\Base64ToString dGVzdGVzdA== -IsString

.LINK
http://labofapenetrationtester.blogspot.com/
http://code.google.com/p/kautilya
#>



Param( [Parameter(Position = 0, Mandatory = $True)] [String] $Base64Strfile, [Switch] $IsString)
function Base64ToString
{
  if($IsString -eq $true)
    {
    
        $base64string  = [System.Convert]::FromBase64String($Base64Strfile)
       
    }
  else
    {
        $base64string  = [System.Convert]::FromBase64String((Get-Content $Base64Strfile))
    }
    
  $decodedstring = [System.Text.Encoding]::Unicode.GetString($base64string)
  $decodedstring
  }
Base64ToString
