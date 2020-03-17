Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$SimpleRequest = New-Object system.Windows.Forms.Form
$SimpleRequest.ClientSize = '800,600'
$SimpleRequest.text = "SimpleRequest"
$SimpleRequest.TopMost = $false

$SimpleRequestResponse = New-Object system.Windows.Forms.Form
$SimpleRequestResponse.ClientSize = '800,600'
$SimpleRequestResponse.text = "Response"
$SimpleRequestResponse.TopMost = $false

$Url = New-Object system.Windows.Forms.TextBox
$Url.multiline = $false
$Url.width = 614
$Url.height = 20
$Url.Anchor = 'top,right,left'
$Url.location = New-Object System.Drawing.Point(116, 20)
$Url.Font = 'Consolas,10'
$Url.text = 'https://localhost/test'

$Go = New-Object system.Windows.Forms.Button
$Go.BackColor = "#7ed321"
$Go.text = "Go"
$Go.width = 57
$Go.height = 20
$Go.Anchor = 'top,right'
$Go.location = New-Object System.Drawing.Point(736, 20)
$Go.Font = 'Comic Sans MS,11,style=Bold'
$Go.ForeColor = "#000000"

$Method = New-Object system.Windows.Forms.ComboBox
$Method.width = 101
$Method.height = 20
@('POST', 'PUT', 'GET') | ForEach-Object { [void] $Method.Items.Add($_) }
$Method.SelectedItem = $Method.Items[0]
$Method.location = New-Object System.Drawing.Point(8, 20)
$Method.Font = 'Consolas,10'

$Header1 = New-Object system.Windows.Forms.TextBox
$Header1.multiline = $false
$Header1.width = 785
$Header1.height = 20
$Header1.enabled = $false
$Header1.Anchor = 'top,right,left'
$Header1.location = New-Object System.Drawing.Point(8, 45)
$Header1.Font = 'Consolas,10'
$Header1.text = "ContentType;application/json"

$Header2 = New-Object system.Windows.Forms.TextBox
$Header2.multiline = $false
$Header2.width = 785
$Header2.height = 20
$Header2.Anchor = 'top,right,left'
$Header2.location = New-Object System.Drawing.Point(8, 70)
$Header2.Font = 'Consolas,10'

$Header3 = New-Object system.Windows.Forms.TextBox
$Header3.multiline = $false
$Header3.width = 785
$Header3.height = 20
$Header3.Anchor = 'top,right,left'
$Header3.location = New-Object System.Drawing.Point(8, 90)
$Header3.Font = 'Consolas,10'

$Header4 = New-Object system.Windows.Forms.TextBox
$Header4.multiline = $false
$Header4.width = 785
$Header4.height = 20
$Header4.Anchor = 'top,right,left'
$Header4.location = New-Object System.Drawing.Point(8, 110)
$Header4.Font = 'Consolas,10'

$Body = New-Object system.Windows.Forms.TextBox
$Body.multiline = $true
$Body.width = 783
$Body.height = 446
$Body.Anchor = 'top,right,bottom,left'
$Body.location = New-Object System.Drawing.Point(8, 140)
$Body.Font = 'Consolas,12'
$Body.text = "{
   'username':'_name_',
   'password':'1234'
}"

$ResponseTextBox = New-Object system.Windows.Forms.TextBox
$ResponseTextBox.multiline = $true
$ResponseTextBox.width = 784
$ResponseTextBox.height = 584
$ResponseTextBox.Anchor = 'top,right,bottom,left'
$ResponseTextBox.location = New-Object System.Drawing.Point(8, 8)
$ResponseTextBox.Font = 'Consolas,12'

$iconBase64 = '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'

$iconBytes = [Convert]::FromBase64String($iconBase64)
$stream = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);

$SimpleRequest.Icon = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())
$SimpleRequest.controls.AddRange(@($Url, $Go, $Method, $Header1, $Header2, $Header3, $Header4, $Body))

$SimpleRequestResponse.Icon = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())
$SimpleRequestResponse.controls.AddRange(@($ResponseTextBox))

function ExecuteRequest() {
   $headers = @{ }

   $header1Values = $Header1.text.split(';')

   $headers.Add($header1Values[0], $header1Values[1])

   if ($Header2.text) {
      $header2Values = $Header2.text.split(';')

      $headers.Add($header2Values[0], $header2Values[1])
   }

   if ($Header3.text) {
      $header3Values = $Header3.text.split(';')

      $headers.Add($header3Values[0], $header3Values[1])
   }

   if ($Header4.text) {
      $header4Values = $Header4.text.split(';')

      $headers.Add($header4Values[0], $header4Values[1])
   }

   try {
      $response = Invoke-WebRequest -UseBasicParsing $Url.text -Method $Method.SelectedItem -Body $Body.text -Headers $headers
   }
   catch {
      $response = $_.Exception
   }

   $ResponseTextBox.text = $response
   $SimpleRequestResponse.ShowDialog();
}

$Go.Add_Click( { ExecuteRequest })

$SimpleRequest.ShowDialog();


#[System.Windows.Forms.Messagebox]::Show($response)
#$response = Invoke-WebRequest -UseBasicParsing $url -Method $method -Body "{ 'ItemID':3661515, 'Name':'test'}" -Headers @{'ContentType' = 'application/json'; 'X-My-Header' = 'Hello World'}; 