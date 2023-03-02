#Version 2.0

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)

$SimpleRequest = New-Object system.Windows.Forms.Form
$SimpleRequest.ClientSize = '800,600'
$SimpleRequest.text = "SimpleRequest"
$SimpleRequest.TopMost = $false
$SimpleRequest.ShowIcon = $false

$SimpleRequestResponse = New-Object system.Windows.Forms.Form
$SimpleRequestResponse.ClientSize = '800,600'
$SimpleRequestResponse.text = "Response"
$SimpleRequestResponse.TopMost = $false
$SimpleRequestResponse.ShowIcon = $false

$SimpleRequestConvert = New-Object system.Windows.Forms.Form
$SimpleRequestConvert.ClientSize = '800,600'
$SimpleRequestConvert.text = "ConvertToBase64"
$SimpleRequestConvert.TopMost = $false
$SimpleRequestConvert.ShowIcon = $false

$menu = new-object System.Windows.Forms.MenuStrip
$tools = new-object System.Windows.Forms.ToolStripMenuItem
$exit = new-object System.Windows.Forms.ToolStripMenuItem
$convert = new-object System.Windows.Forms.ToolStripMenuItem

$menu.Items.AddRange(@($tools))

$menu.Name = "MainMenu"
$menu.TabIndex = 0
$menu.Text = "MainMenu"

$tools.DropDownItems.AddRange(@(
      $convert, $exit))
$tools.Name = "toolMenu"
$tools.Text = "Tools"

$exit.Name = "exitMenu"
$exit.Text = "Exit"
function OnClick_exitMenu($Sender, $e) {
   $SimpleRequest.Close()
}
$exit.Add_Click( { OnClick_exitMenu $exit $EventArgs } )

$convert.Name = "convertMenu"
$convert.Text = "ConvertToBase64"
function OnClick_convertMenu($Sender, $e) {
   $SimpleRequestConvert.ShowDialog()
}
$convert.Add_Click( { OnClick_convertMenu $convert $EventArgs } )

$Url = New-Object system.Windows.Forms.TextBox
$Url.multiline = $false
$Url.width = 614
$Url.height = 20
$Url.Anchor = 'top,right,left'
$Url.location = New-Object System.Drawing.Point(116, 22)
$Url.Font = 'Consolas,10'
$Url.text = 'https://localhost/test'

$Go = New-Object system.Windows.Forms.Button
$Go.BackColor = "#7ed321"
$Go.text = "Send"
$Go.width = 57
$Go.height = 25
$Go.Anchor = 'top,right'
$Go.location = New-Object System.Drawing.Point(736, 21)
$Go.Font = 'Consolas,11,style=Bold'
$Go.ForeColor = "#000000"

$Method = New-Object system.Windows.Forms.ComboBox
$Method.width = 101
$Method.height = 20
@('POST', 'PUT', 'GET') | ForEach-Object { [void] $Method.Items.Add($_) }
$Method.SelectedItem = $Method.Items[0]
$Method.location = New-Object System.Drawing.Point(6, 22)
$Method.Font = 'Consolas,10'

$Header1 = New-Object system.Windows.Forms.TextBox
$Header1.multiline = $false
$Header1.width = 785
$Header1.height = 20
$Header1.enabled = $false
$Header1.Anchor = 'top,right,left'
$Header1.location = New-Object System.Drawing.Point(6, 47)
$Header1.Font = 'Consolas,10'
$Header1.text = "Content-Type;application/json"

$Header2 = New-Object system.Windows.Forms.TextBox
$Header2.multiline = $false
$Header2.width = 785
$Header2.height = 20
$Header2.Anchor = 'top,right,left'
$Header2.location = New-Object System.Drawing.Point(6, 72)
$Header2.Font = 'Consolas,10'

$Header3 = New-Object system.Windows.Forms.TextBox
$Header3.multiline = $false
$Header3.width = 785
$Header3.height = 20
$Header3.Anchor = 'top,right,left'
$Header3.location = New-Object System.Drawing.Point(6, 92)
$Header3.Font = 'Consolas,10'

$Header4 = New-Object system.Windows.Forms.TextBox
$Header4.multiline = $false
$Header4.width = 785
$Header4.height = 20
$Header4.Anchor = 'top,right,left'
$Header4.location = New-Object System.Drawing.Point(6, 112)
$Header4.Font = 'Consolas,10'

$Body = New-Object system.Windows.Forms.TextBox
$Body.multiline = $true
$Body.width = 785
$Body.height = 446
$Body.Anchor = 'top,right,bottom,left'
$Body.location = New-Object System.Drawing.Point(6, 140)
$Body.Font = 'Consolas,12'
$Body.text = "{
   'username':'_name_',
   'password':'1234'
}"

$ResponseHeaderTextBox = New-Object system.Windows.Forms.TextBox
$ResponseHeaderTextBox.multiline = $true
$ResponseHeaderTextBox.width = 784
$ResponseHeaderTextBox.height = 200
$ResponseHeaderTextBox.Anchor = 'top,right,left'
$ResponseHeaderTextBox.location = New-Object System.Drawing.Point(8, 8)
$ResponseHeaderTextBox.Font = 'Consolas,12'

$ResponseTextBox = New-Object system.Windows.Forms.TextBox
$ResponseTextBox.multiline = $true
$ResponseTextBox.width = 784
$ResponseTextBox.height = 384
$ResponseTextBox.Anchor = 'top,right,bottom,left'
$ResponseTextBox.location = New-Object System.Drawing.Point(8, 208)
$ResponseTextBox.Font = 'Consolas,12'

$ConvertTextBoxInput = New-Object system.Windows.Forms.TextBox
$ConvertTextBoxInput.multiline = $true
$ConvertTextBoxInput.width = 784
$ConvertTextBoxInput.height = 240
$ConvertTextBoxInput.Anchor = 'top,right,left'
$ConvertTextBoxInput.location = New-Object System.Drawing.Point(8, 8)
$ConvertTextBoxInput.Font = 'Consolas,12'

$ConvertTextBoxOutput = New-Object system.Windows.Forms.TextBox
$ConvertTextBoxOutput.multiline = $true
$ConvertTextBoxOutput.width = 784
$ConvertTextBoxOutput.height = 290
$ConvertTextBoxOutput.Anchor = 'top,right,bottom,left'
$ConvertTextBoxOutput.location = New-Object System.Drawing.Point(8, 280)
$ConvertTextBoxOutput.Font = 'Consolas,12'

$ConvertButton = New-Object system.Windows.Forms.Button
$ConvertButton.text = "Convert"
$ConvertButton.width = 784
$ConvertButton.height = 20
$ConvertButton.Anchor = 'top,right,left'
$ConvertButton.location = New-Object System.Drawing.Point(8, 255)
$ConvertButton.Font = 'Consolas,12'

function ConvertToBase64() {
   $bytes = [System.Text.Encoding]::UTF8.GetBytes($ConvertTextBoxInput.Text)
   $ConvertTextBoxOutput.Text = [System.Convert]::ToBase64String($bytes)
}

$ConvertButton.Add_Click( { ConvertToBase64 })

$SimpleRequest.controls.AddRange(@($Url, $Go, $Method, $Header1, $Header2, $Header3, $Header4, $Body, $menu))

$SimpleRequestResponse.controls.AddRange(@($ResponseTextBox))
$SimpleRequestResponse.controls.AddRange(@($ResponseHeaderTextBox))

$SimpleRequestConvert.controls.AddRange(@($ConvertTextBoxInput, $ConvertTextBoxOutput, $ConvertButton))

function ExecuteRequest() {
   $headers = @{ }

   $headers.Add('Accept', '*/*')

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
      if ($Method.SelectedItem -eq 'GET') {
         $response = Invoke-WebRequest -UseBasicParsing $Url.text -Method $Method.SelectedItem -Headers $headers
      }
      else {
         $response = Invoke-WebRequest -UseBasicParsing $Url.text -Method $Method.SelectedItem -Body $Body.text -Headers $headers -Verbose
      }

      foreach ($key in $response.Headers.Keys) {
         $ResponseHeaderTextBox.text += $key + ' : ' + $response.Headers[$key] + [Environment]::NewLine
      }

      $ResponseTextBox.text = $response.Content
   }
   catch {
      $ResponseTextBox.text = $_.Exception
   }

   $SimpleRequestResponse.ShowDialog()
}

$Go.Add_Click( { ExecuteRequest })

$SimpleRequest.ShowDialog()