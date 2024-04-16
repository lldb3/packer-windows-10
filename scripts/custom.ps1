ReAgentc.exe /disable
cmd.exe /c "del /a /f "C:\Windows\System32\Recovery\Winre.wim""
# remove allow ACL on C:\
icacls.exe C:\ /remove:g "*S-1-5-11"
# disable last access on fs, good for fs performance
fsutil.exe behavior set disableLastAccess 1

# debugging
#auditpol.exe /set /subcategory:"Process Creation" /success:enable /failure:enable
#reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" /v ProcessCreationIncludeCmdLine_Enabled /t REG_DWORD /d 1 /f

# debloat etc
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.Microsoft3DViewer"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.WindowsCamera"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.549981C3F5F10"
#
#reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\DevHomeUpdate" /f
#
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.WindowsFeedbackHub"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.GetHelp"
#cmd.exe /c ">>"%TEMP%\remove-caps.txt" echo Browser.InternetExplorer"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.WindowsMaps"
#cmd.exe /c ">>"%TEMP%\remove-caps.txt" echo MathRecognizer"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.ZuneVideo"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.BingNews"
#cmd.exe /c ">>"%TEMP%\remove-caps.txt" echo Microsoft.Windows.Notepad"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.MicrosoftOfficeHub"
#
#cmd.exe /c "del "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk""
#cmd.exe /c "del "C:\Windows\System32\OneDriveSetup.exe""
#cmd.exe /c "del "C:\Windows\SysWOW64\OneDriveSetup.exe""
#
#reg.exe load "HKU\mount" "C:\Users\Default\NTUSER.DAT"
#reg.exe delete "HKU\mount\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f
#reg.exe unload "HKU\mount"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.Office.OneNote"
#reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate" /f
#cmd.exe /c ">>"%TEMP%\remove-caps.txt" echo Microsoft.Windows.MSPaint"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.Paint"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.People"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.SkypeApp"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.MicrosoftSolitaireCollection"
#cmd.exe /c ">>"%TEMP%\remove-caps.txt" echo App.StepsRecorder"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.MicrosoftStickyNotes"
#reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications" /v ConfigureChatAutoInstall /t REG_DWORD /d 0 /f
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.Getstarted"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.WindowsSoundRecorder"
#cmd.exe /c ">>"%TEMP%\remove-caps.txt" echo Media.WindowsMediaPlayer"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.Xbox.TCUI"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.XboxApp"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.XboxGameOverlay"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.XboxGamingOverlay"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.XboxIdentityProvider"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.XboxSpeechToTextOverlay"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.GamingApp"
#cmd.exe /c ">>"%TEMP%\remove-packages.txt" echo Microsoft.YourPhone"
#powershell.exe -NoProfile -Command "Get-AppxProvisionedPackage -Online | where DisplayName -In (Get-Content $env:TEMP\remove-packages.txt ) | Remove-AppxProvisionedPackage -AllUsers -Online *>&amp;1 >> $env:TEMP\remove-packages.log;"
#powershell.exe -NoProfile -Command "Get-WindowsCapability -Online | where {($_.Name -split '~')[0] -in (Get-Content $env:TEMP\remove-caps.txt ) } | Remove-WindowsCapability -Online *>&amp;1 >> $env:TEMP\remove-caps.log;"
#
#cmd.exe /c ">>"C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" echo ^<LayoutModificationTemplate Version="1" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"^>"
#cmd.exe /c ">>"C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" echo ^<LayoutOptions StartTileGroupCellWidth="6" /^>"
#cmd.exe /c ">>"C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" echo ^<DefaultLayoutOverride^>"
#cmd.exe /c ">>"C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" echo ^<StartLayoutCollection^>"
#cmd.exe /c ">>"C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" echo ^<StartLayout GroupCellWidth="6" xmlns="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" /^>"
#cmd.exe /c ">>"C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" echo ^</StartLayoutCollection^>"
#cmd.exe /c ">>"C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" echo ^</DefaultLayoutOverride^>"
#cmd.exe /c ">>"C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" echo ^</LayoutModificationTemplate^>"
#
#reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Start" /v ConfigureStartPins /t REG_SZ /d "{ \"pinnedList\": [] }" /f
#reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Start" /v ConfigureStartPins_ProviderSet /t REG_DWORD /d 1 /f
#reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Start" /v ConfigureStartPins_WinningProvider /t REG_SZ /d B5292708-1619-419B-9923-E5D9F3925E71 /f
#reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\providers\B5292708-1619-419B-9923-E5D9F3925E71\default\Device\Start" /v ConfigureStartPins /t REG_SZ /d "{ \"pinnedList\": [] }" /f
#reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\providers\B5292708-1619-419B-9923-E5D9F3925E71\default\Device\Start" /v ConfigureStartPins_LastWrite /t REG_DWORD /d 1 /f
#
#
#reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 1 /f
#netsh.exe advfirewall firewall set rule group="Remote Desktop" new enable=Yes
#reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
#
#
#reg.exe unload "HKU\mount"
#reg.exe load "HKU\mount" "C:\Users\Default\NTUSER.DAT"
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OEMPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d 0 /f
#reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
#reg.exe unload "HKU\mount"
#
#reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 0 /f
