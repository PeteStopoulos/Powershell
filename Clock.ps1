Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object 'System.Windows.Forms.Form' # Creates a GUI stores in variable $Form
$Form.Text = "Pete's Digital Clock" # Sets the title to 'Pete's Digital Clock'
$Form.BackColor = "#000000" # Sets background color to black
$Form.TopMost = $True
$Form.Width = 300 # 300 pixel width
$Form.Height = 100 # 100 pixel height
$Form.MaximizeBox = $False # Makes window non-resizable
$Form.FormBorderStyle = 'Fixed3D'

$clockLbl = New-Object 'System.Windows.Forms.Label' # creates label inside the gui where time will be displayed
$clockLbl.Text = (Get-Date).ToString("HH:mm:ss:ff") # Transfers date into a string of hours, minutes, seconds & ticks
$clockLbl.AutoSize = $True 
$clockLbl.ForeColor = "#ff0000" # Makes text of clockbl.text red
$clockLbl.Location = New-Object System.Drawing.Point(0,0) # Place label in the upper left
$clockLbl.Font = "DS-Digital,32,style=Bold" # Changes the font to "Digital", 32 pixel size, bold
$Form.Controls.Add($clockLbl) # Places label onto the form

$timer1 = New-Object 'System.Windows.Forms.Timer' # 
$timer1_Tick={
    $clockLbl.Text = (Get-Date).ToString("HH:mm:ss:ff")
}

$timer1.Enabled = $True
$timer1.Interval = 1
$timer1.add_Tick($timer1_Tick) # adds tick to the timer

[void]$Form.ShowDialog()
$Form.Dispose()
