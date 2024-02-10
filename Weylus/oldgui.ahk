ToolTip, GUI Settings

Gui +OwnDialogs +AlwaysOnTop

ToolTip, Loading GUI.

Gui, Add, Tab3, vCurrentTab, Weylus|Sharing|Plugins|Settings
Gui, Add, StatusBar,, % ScriptName " initalized."

Gui, Add, GroupBox, x20 y30 w220 h130, Server Settings
Gui, Add, Text, x30 y53, Access Code:
Gui, Add, Edit, x120 y50 w100 vAccessCode Limit32767 gSharingUpdate r1, %AccessCode%
Gui, Add, Text, x30 y78, Bind Address:
Gui, Add, Edit, x120 y75 w100 vBindAddress Limit32767 r1, %BindAddress%
Gui, Add, Text, x30 y103, Web Port:
Gui, Add, Edit, x120 y100 w100 vWebPort gSharingUpdate r1 Number
Gui, Add, UpDown, Range0-65535 0x80, %WebPort%
Gui, Add, Text, x30 y128, WebSocket Port:
Gui, Add, Edit, x120 y125 w100 vWebSocketPort r1 Number
Gui, Add, UpDown, Range0-65535 0x80, %WebSocketPort%

Gui, Add, GroupBox, x20 y160 w220 h65, Encoding Settings
Gui, Add, Checkbox, x30 y180 w200 vNVENC Checked%NVENC%, NVENC (Nvidia's GPU Encoding)
Gui, Add, Checkbox, vMediaFoundation Checked%MediaFoundation%, MediaFoundation (HW Acceleration)

Gui, Add, GroupBox, x20 y230 w220 h65, Miscellaneous Settings
Gui, Add, Checkbox, x30 y250 vAutoStart Checked%AutoStart%, Auto Start
Gui, Add, Checkbox, vNoGUI Checked%NoGUI%, No GUI

Gui, Add, GroupBox, x420 y30 w200 h265, Custom Settings
Gui, Add, Text, x430 y50, Custom JS:
Gui, Add, Edit, vCustomLibJS w180 r1 Disabled%NCM%, %CustomLibJS%
Gui, Add, Text,, Custom Index HTML:
Gui, Add, Edit, vCustomIndexHTML w180 r1 Disabled%NCM%, %CustomIndexHTML%
Gui, Add, Text,, Custom Access HTML:
Gui, Add, Edit, vCustomAccessHTML w180 r1, %CustomAccessHTML%
Gui, Add, Text,, Custom CSS:
Gui, Add, Edit, vCustomStyleCSS w180 r1, %CustomStyleCSS%
Gui, Add, Text, x430 y245, Extra:
Gui, Add, Edit,vExtra w180 r1, %Extra%

Gui, Add, GroupBox, x250 y140 w160 h155, App Settings
Gui, Add, Button, x260 y160 w140 gCompleteWeylus, Run Weylus
Gui, Add, Button, gShowMsg w140, Show Message
Gui, Add, Button, gCopyClipboard w140, Copy to Clipboard
;Gui, Add, Checkbox, vHideDefault w100 Checked%HideDefault%, Remove Default
Gui, Add, Button, w140, Save Config
;Gui, Add, Button, w140 gShortcut, Create Shortcut

Gui, Add, GroupBox, x250 y30 w160 h105, Universal Settings
Gui, Add, CheckBox, x260 y50 vHideCMD gHideCMDToggle Checked%HideCMD%, Hide CMD Prompt
Gui, Add, Checkbox, vSetIcon gSetIcon Checked%SetIcon%, Set Custom Icon
/*


Gui, Font, s16, FontIcon

Gui, Add, Button, x500 y40 w32 h32, % ShareButtonText
Gui, Add, Button, w32 h32, % PluginsButtonText
Gui, Add, Button, w32 h32, % SettingsButtonText

Gui, Font
*/
Gui, Tab, 2

Gui, Add, GroupBox, x20 y30 w140 h210, Address
Gui, Add, DDL, x30 y53 w120 AltSubmit hwndHIPList vShareIP gSharingUpdate Choose1, % IPList
Gui, Add, Checkbox, % "vShareAccessCode gSharingUpdate Disabled" !AccessCode, Access Code
Gui, Add, Checkbox, % "vShareWebPort gSharingUpdate Disabled" !WebPort, Web Port
Gui, Add, Button, w120 gAddCustomAddress, Add Custom Address
Gui, Add, Button, w120 gRemoveAddress, Remove Selected
Gui, Add, Button, w120 gAddNetworkAddresses, Add Network IPs
Gui, Add, Button, w120 gResetAddresses, Reset To Default

Gui, Add, GroupBox, x170 y30 w140 h210, QR Code
Gui, Add, DDL, w120 x180 y50 r2 vQRCodeType gGetData Choose1, % GDIAvaliable ? "Built-In Generator|API (Online)" : "API (Online)"
Gui, Add, Text,, Error Correction:
Gui, Add, DDL, vQRCodeECL gGetData r4 Choose%QRCodeECL% AltSubmit, Low|Medium|Quartile|High

Gui, Add, Button, w120 gGenerateQRCode, Generate QR Code
Gui, Add, Button, w120 gSaveQRCode, Save QR Code
Gui, Add, Button, w120 gViewQRCode, View QR Code

Gui, Add, GroupBox, x450 y30 w250 h260, QR Code Preview
Gui, Add, Picture, x460 y50 w230 h230 vQRCodeImage gQRCodeDetails, QR Code unavalible..

Gui, Add, GroupBox, x20 y250 w420 h40, Text Preview
Gui, Add, Edit, x27 y265 w408 h20 vQRCodePreviewText, % QRCodeGen

Gui, Tab, 3

Gui, Add, GroupBox, x20 y30 w220 h155, Norinorin's Active Area
Gui, Add, CheckBox, x30 y50 vNCM gNCMToggle Checked%NCM%, Norinorin's Active Area
Gui, Add, Button, gInstallNCM Disabled%NCMFound%, Install Required Files
Gui, Add, Edit, vNCMLJS w200 r1, %NCMLJS%
Gui, Add, Edit, vNCMIHTML w200 r1, %NCMIHTML%

Gui, Add, GroupBox, x480 y30 w220 h155, ADB
Gui, Add, Link, x620 y280, <a href="%MainHostURL%/%RepoUser%/%RepoName%/wiki/Methods">Other methods...</a>


Gui, Tab, 4
Gui, Add, GroupBox, x250 y10 w220 h210, Directory Settings
Gui, Add, Text, x260 y30, Folder Location:
Gui, Add, Button, w200 gSelectPath, Provide Weylus Path
Gui, Add, Edit, r1 vPath w200, % Path
Gui, Add, Text,, Use Weylus Config..
Gui, Add, Checkbox, , On Startup|Always|Never

Gui, Show, % (QuickMini) ? "Minimize" : "", %ScriptName%