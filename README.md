# WPFMessageBoxQB64
Create custom MessageBoxes for your QB64 programs using WPF (Windows Presentation Foundation)!
Uses a PowerShell function class written by Trevor Jones from:
https://smsagent.blog/2017/08/24/a-customisable-wpf-messagebox-for-powershell/

Colors for the Color Properties:
https://docs.microsoft.com/en-us/dotnet/api/system.windows.media.colors?view=netframework-4.8

I've edited the PowerShell code to work alongside QB64. It will allow you to create beautiful, custom Message Boxes (dialog boxes) for QB64 programs with custom colors, fonts, and even custom buttons!

To use the new error handling feature I added into the box, paste this in the main module of your program near the top:
ON ERROR GOTO ERRHANDLE
ERRHANDLE:
IF ERR THEN
    CriticalError ERR
    RESUME NEXT
END IF
