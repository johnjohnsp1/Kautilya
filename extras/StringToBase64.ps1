<#
.SYNOPSIS
A script in Kautilya which could be used with DNS TXT Backdoor and other payloads which encodes a string to base64 string.

.DESCRIPTION
This payload encodes the given string to base64 string.

.PARAMETER Str
The string to be encoded

.EXAMPLE
PS > .\StringToBase64 "start-process calc.exe"

.LINK
http://labofapenetrationtester.blogspot.com/
http://code.google.com/p/kautilya
#>



Param( [Parameter(Position = 0, Mandatory = $True)] [String] $Str)
function StringtoBase64
{

  if($IsString -eq $true)
    {
    
        $utfbytes  = [System.Text.Encoding]::Unicode.GetBytes($Str)
       
    }
  else
    {
        $utfbytes  = [System.Text.Encoding]::Unicode.GetBytes((Get-Content $Str))
    }

  $base64string = [System.Convert]::ToBase64String($utfbytes)
  $base64string 
 }
  StringToBase64
