$NOPREFIX
$CONSOLE:ONLY
'$SCREENHIDE
DEST CONSOLE
CONSOLETITLE "WPFMessageBox Test"
TITLE "WPFMessageBox Test"
'$INCLUDE:'New-WPFMessageBox.ps1.bin.bas'
'=============================================
TYPE Params
    Content AS STRING 'mandatory
    Title AS STRING 'not mandatory
    ButtonType AS STRING 'defaults to "OK"
    'Valid ButtonType values are "OK", "OK-Cancel", "Abort-Retry-Ignore", "Yes-No-Cancel", "Yes-No", "Retry-Cancel", "Cancel-TryAgain-Continue", "None" ("None" is used when defining custom buttons. This QB64 program allows for 3)
    ContentFontSize AS STRING 'defaults to "14"
    TitleFontSize AS STRING 'defaults to "14"
    BorderThickness AS STRING 'defaults to "0"
    CornerRadius AS STRING 'defaults to "8"
    ShadowDepth AS STRING 'defaults to "3"
    BlurRadius AS STRING 'defaults to "20"
    'WindowHost AS STRING
    Timeout AS STRING 'not mandatory
    'OnLoaded AS STRING 'not mandatory
    'OnClosed AS STRING 'not mandatory
    ContentBackground AS STRING 'not mandatory, defaults to "White"
    FontFamily AS STRING 'not mandatory, defaults to "Segoe UI"
    TitleFontWeight AS STRING 'not mandatory, defaults to "Normal"
    ContentFontWeight AS STRING 'not mandatory, defaults to "Normal"
    ContentTextForeground AS STRING 'not mandatory, defaults to "Black"
    TitleTextForeground AS STRING 'not mandatory, defaults to "Black"
    BorderBrush AS STRING 'not mandatory, defaults to "Black"
    TitleBackground AS STRING 'not mandatory, defaults to "White"
    ButtonTextForeground AS STRING 'not mandatory, defaults to "Black"
    'Valid colors are listed at https://docs.microsoft.com/en-us/dotnet/api/system.windows.media.colors?view=netframework-4.8
    Sound AS STRING 'not mandatory, defaults to "Windows Notify System Generic"
    'Valid sounds are "Windows Background","Windows Balloon","Windows Battery Critical","Windows Battery Low","Windows Critical Stop","Windows Default","Windows Ding","Windows Error","Windows Exclamation","Windows Feed Discovered","Windows Foreground","Windows Hardware Fail","Windows Hardware Insert","Windows Hardware Remove","Windows Information Bar","Windows Logoff Sound","Windows Logon","Windows Menu Command","Windows Message Nudge","Windows Minimize","Windows Navigation Start","Windows Notify Calendar","Windows Notify Email","Windows Notify Messaging","Windows Notify System Generic","Windows Notify","Windows Pop-up Blocked","Windows Print complete","Windows Proximity Connection","Windows Proximity Notification","Windows Recycle","Windows Restore","Windows Ringin","Windows Ringout","Windows Shutdown","Windows Startup","Windows Unlock","Windows User Account Control"
    CustomButton1 AS STRING 'not mandatory, only used if ButtonType = "None"
    CustomButton2 AS STRING 'not mandatory, only used if ButtonType = "None"
    CustomButton3 AS STRING 'not mandatory, only used if ButtonType = "None"
END TYPE
'DIM SHARED Params AS Params
DIM Params AS Params
'========================================================================
LINE INPUT "Button Type: ", Params.ButtonType
LINE INPUT "Content: ", Params.Content
LINE INPUT "Title: ", Params.Title
LINE INPUT "Title Background: ", Params.TitleBackground
LINE INPUT "Title Font Size: ", Params.TitleFontSize
LINE INPUT "Title Font Weight: ", Params.TitleFontWeight
LINE INPUT "Title Text Foreground: ", Params.TitleTextForeground
LINE INPUT "Content Font Size: ", Params.ContentFontSize
LINE INPUT "Content Font Weight: ", Params.ContentFontWeight
LINE INPUT "Content Text Foreground: ", Params.ContentTextForeground
LINE INPUT "Corner Radius: ", Params.CornerRadius
LINE INPUT "ButtonTextForeground: ", Params.ButtonTextForeground
INPUT "Custom Buttons (Separated by comma): ", Params.CustomButton1, Params.CustomButton2, Params.CustomButton3

a = WPFMessageBox(Params)
ButtonClicked = a
ECHO LTRIM$(STR$(ButtonClicked))
SELECT CASE ButtonClicked
    CASE 1
        ECHO "OK"
    CASE 2
        ECHO "Cancel"
    CASE 3
        ECHO "Abort"
    CASE 4
        ECHO "Retry"
    CASE 5
        ECHO "Ignore"
    CASE 6
        ECHO "Yes"
    CASE 7
        ECHO "No"
    CASE 8
        ECHO "Try Again"
    CASE 9
        ECHO "Continue"
    CASE 10
        ECHO "None"
    CASE ELSE
        ECHO "Exited, perhaps"
END SELECT


FUNCTION WPFMessageBox (Params AS Params)
    SHELL$ = "PowerShell -Command " + CHR$(34) + "&'" + _STARTDIR$ + "\New-WPFMessageBox.ps1'"
    '==============================================================================
    IF Params.Content <> "" AND INSTR(Params.Content, "\" + CHR$(34)) = 0 THEN
        Params.Content = "\" + CHR$(34) + Params.Content + "\" + CHR$(34) '$args[0]
        SHELL$ = SHELL$ + " " + Params.Content
    ELSE
        Params.Content = "null"
        Params.Content = "\" + CHR$(34) + Params.Content + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.Content
    END IF

    IF Params.Title <> "" AND INSTR(Params.Title, "\" + CHR$(34)) = 0 THEN
        Params.Title = "\" + CHR$(34) + Params.Title + "\" + CHR$(34) '$args[1]
        SHELL$ = SHELL$ + " " + Params.Title
    ELSE
        Params.Title = TITLE$
        Params.Title = "\" + CHR$(34) + Params.Title + "\" + CHR$(34) '$args[1]
        SHELL$ = SHELL$ + " " + Params.Title
    END IF

    IF Params.ButtonType <> "" AND INSTR(Params.ButtonType, "\" + CHR$(34)) = 0 THEN
        IF Params.ButtonType <> "OK" AND Params.ButtonType <> "OK-Cancel" AND Params.ButtonType <> "Abort-Retry-Ignore" AND Params.ButtonType <> "Yes-No-Cancel" AND Params.ButtonType <> "Yes-No" AND Params.ButtonType <> "Retry-Cancel" AND Params.ButtonType <> "Cancel-TryAgain-Continue" AND Params.ButtonType <> "None" THEN
            Params.ButtonType = "OK"
            Params.ButtonType = "\" + CHR$(34) + Params.ButtonType + "\" + CHR$(34)
            SHELL$ = SHELL$ + " " + Params.ButtonType
        ELSE
            Params.ButtonType = "\" + CHR$(34) + Params.ButtonType + "\" + CHR$(34) '$args[2]
            SHELL$ = SHELL$ + " " + Params.ButtonType
        END IF
    ELSE
        Params.ButtonType = "OK"
        Params.ButtonType = "\" + CHR$(34) + Params.ButtonType + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.ButtonType
    END IF

    IF Params.ContentFontSize <> "" AND INSTR(Params.ContentFontSize, "\" + CHR$(34)) = 0 THEN
        Params.ContentFontSize = "\" + CHR$(34) + Params.ContentFontSize + "\" + CHR$(34) '$args[3]
        SHELL$ = SHELL$ + " " + Params.ContentFontSize
    ELSE
        Params.ContentFontSize = "14"
        Params.ContentFontSize = "\" + CHR$(34) + Params.ContentFontSize + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.ContentFontSize
    END IF

    IF Params.TitleFontSize <> "" AND INSTR(Params.TitleFontSize, "\" + CHR$(34)) = 0 THEN
        Params.TitleFontSize = "\" + CHR$(34) + Params.TitleFontSize + "\" + CHR$(34) '$args[4]
        SHELL$ = SHELL$ + " " + Params.TitleFontSize
    ELSE
        Params.TitleFontSize = "14"
        Params.TitleFontSize = "\" + CHR$(34) + Params.TitleFontSize + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.TitleFontSize
    END IF

    IF Params.BorderThickness <> "" AND INSTR(Params.BorderThickness, "\" + CHR$(34)) = 0 THEN
        Params.BorderThickness = "\" + CHR$(34) + Params.BorderThickness + "\" + CHR$(34) '$args[5]
        SHELL$ = SHELL$ + " " + Params.BorderThickness
    ELSE
        Params.BorderThickness = "0"
        Params.BorderThickness = "\" + CHR$(34) + Params.BorderThickness + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.BorderThickness
    END IF

    IF Params.CornerRadius <> "" AND INSTR(Params.CornerRadius, "\" + CHR$(34)) = 0 THEN
        Params.CornerRadius = "\" + CHR$(34) + Params.CornerRadius + "\" + CHR$(34) '$args[6]
        SHELL$ = SHELL$ + " " + Params.CornerRadius
    ELSE
        Params.CornerRadius = "5"
        Params.CornerRadius = "\" + CHR$(34) + Params.CornerRadius + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.CornerRadius
    END IF

    IF Params.ShadowDepth <> "" AND INSTR(Params.ShadowDepth, "\" + CHR$(34)) = 0 THEN
        Params.ShadowDepth = "\" + CHR$(34) + Params.ShadowDepth + "\" + CHR$(34) '$args[7]
        SHELL$ = SHELL$ + " " + Params.ShadowDepth
    ELSE
        Params.ShadowDepth = "3"
        Params.ShadowDepth = "\" + CHR$(34) + Params.ShadowDepth + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.ShadowDepth
    END IF

    IF Params.BlurRadius <> "" AND INSTR(Params.BlurRadius, "\" + CHR$(34)) = 0 THEN
        Params.BlurRadius = "\" + CHR$(34) + Params.BlurRadius + "\" + CHR$(34) '$args[8]
        SHELL$ = SHELL$ + " " + Params.BlurRadius
    ELSE
        Params.BlurRadius = "20"
        Params.BlurRadius = "\" + CHR$(34) + Params.BlurRadius + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.BlurRadius
    END IF

    IF Params.Timeout <> "" AND INSTR(Params.Timeout, "\" + CHR$(34)) = 0 THEN
        Params.Timeout = "\" + CHR$(34) + Params.Timeout + "\" + CHR$(34) '$args[9]
        SHELL$ = SHELL$ + " " + Params.Timeout
    ELSE
        Params.Timeout = "999"
        Params.Timeout = "\" + CHR$(34) + Params.Timeout + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.Timeout
    END IF

    IF Params.ContentBackground <> "" AND INSTR(Params.ContentBackground, "\" + CHR$(34)) = 0 THEN
        Params.ContentBackground = "\" + CHR$(34) + Params.ContentBackground + "\" + CHR$(34) '$args[10]
        SHELL$ = SHELL$ + " " + Params.ContentBackground
    ELSE
        Params.ContentBackground = "White"
        Params.ContentBackground = "\" + CHR$(34) + Params.ContentBackground + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.ContentBackground
    END IF

    IF Params.FontFamily <> "" AND INSTR(Params.FontFamily, "\" + CHR$(34)) = 0 THEN
        Params.FontFamily = "\" + CHR$(34) + Params.FontFamily + "\" + CHR$(34) '$args[11]
        SHELL$ = SHELL$ + " " + Params.FontFamily
    ELSE
        Params.FontFamily = "Segoe UI"
        Params.FontFamily = "\" + CHR$(34) + Params.FontFamily + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.FontFamily
    END IF

    IF Params.TitleFontWeight <> "" AND INSTR(Params.TitleFontWeight, "\" + CHR$(34)) = 0 THEN
        Params.TitleFontWeight = "\" + CHR$(34) + Params.TitleFontWeight + "\" + CHR$(34) '$args[12]
        SHELL$ = SHELL$ + " " + Params.TitleFontWeight
    ELSE
        Params.TitleFontWeight = "Normal"
        Params.TitleFontWeight = "\" + CHR$(34) + Params.TitleFontWeight + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.TitleFontWeight
    END IF

    IF Params.ContentFontWeight <> "" AND INSTR(Params.ContentFontWeight, "\" + CHR$(34)) = 0 THEN
        Params.ContentFontWeight = "\" + CHR$(34) + Params.ContentFontWeight + "\" + CHR$(34) '$args[13]
        SHELL$ = SHELL$ + " " + Params.ContentFontWeight
    ELSE
        Params.ContentFontWeight = "Normal"
        Params.ContentFontWeight = "\" + CHR$(34) + Params.ContentFontWeight + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.ContentFontWeight
    END IF

    IF Params.TitleTextForeground <> "" AND INSTR(Params.TitleTextForeground, "\" + CHR$(34)) = 0 THEN
        Params.TitleTextForeground = "\" + CHR$(34) + Params.TitleTextForeground + "\" + CHR$(34) '$args[14]
        SHELL$ = SHELL$ + " " + Params.TitleTextForeground
    ELSE
        Params.TitleTextForeground = "Black"
        Params.TitleTextForeground = "\" + CHR$(34) + Params.TitleTextForeground + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.TitleTextForeground
    END IF

    IF Params.ContentTextForeground <> "" AND INSTR(Params.ContentTextForeground, "\" + CHR$(34)) = 0 THEN
        Params.ContentTextForeground = "\" + CHR$(34) + Params.ContentTextForeground + "\" + CHR$(34) '$args[15]
        SHELL$ = SHELL$ + " " + Params.ContentTextForeground
    ELSE
        Params.ContentTextForeground = "Black"
        Params.ContentTextForeground = "\" + CHR$(34) + Params.ContentTextForeground + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.ContentTextForeground
    END IF

    IF Params.BorderBrush <> "" AND INSTR(Params.BorderBrush, "\" + CHR$(34)) = 0 THEN
        Params.BorderBrush = "\" + CHR$(34) + Params.BorderBrush + "\" + CHR$(34) '$args[16]
        SHELL$ = SHELL$ + " " + Params.BorderBrush
    ELSE
        Params.BorderBrush = "Black"
        Params.BorderBrush = "\" + CHR$(34) + Params.BorderBrush + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.BorderBrush
    END IF

    IF Params.TitleBackground <> "" AND INSTR(Params.TitleBackground, "\" + CHR$(34)) = 0 THEN
        Params.TitleBackground = "\" + CHR$(34) + Params.TitleBackground + "\" + CHR$(34) '$args[17]
        SHELL$ = SHELL$ + " " + Params.TitleBackground
    ELSE
        Params.TitleBackground = "White"
        Params.TitleBackground = "\" + CHR$(34) + Params.TitleBackground + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.TitleBackground
    END IF

    IF Params.ButtonTextForeground <> "" AND INSTR(Params.ButtonTextForeground, "\" + CHR$(34)) = 0 THEN
        Params.ButtonTextForeground = "\" + CHR$(34) + Params.ButtonTextForeground + "\" + CHR$(34) '$args[18]
        SHELL$ = SHELL$ + " " + Params.ButtonTextForeground
    ELSE
        Params.ButtonTextForeground = "Black"
        Params.ButtonTextForeground = "\" + CHR$(34) + Params.ButtonTextForeground + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.ButtonTextForeground
    END IF

    IF Params.Sound <> "" AND INSTR(Params.Sound, "\" + CHR$(34)) = 0 THEN
        Params.Sound = "\" + CHR$(34) + Params.Sound + "\" + CHR$(34) '$args[19]
        SHELL$ = SHELL$ + " " + Params.Sound
    ELSE
        Params.Sound = "Windows Notify System Generic"
        Params.Sound = "\" + CHR$(34) + Params.Sound + "\" + CHR$(34)
        SHELL$ = SHELL$ + " " + Params.Sound
    END IF

    IF Params.CustomButton1 <> "" AND INSTR(Params.CustomButton1, "\" + CHR$(34)) = 0 THEN
        Params.CustomButton1 = "\" + CHR$(34) + Params.CustomButton1 + "\" + CHR$(34) '$args[20]
        SHELL$ = SHELL$ + " " + Params.CustomButton1
    END IF

    IF Params.CustomButton2 <> "" AND INSTR(Params.CustomButton2, "\" + CHR$(34)) = 0 THEN
        Params.CustomButton2 = "\" + CHR$(34) + Params.CustomButton2 + "\" + CHR$(34) '$args[21]
        SHELL$ = SHELL$ + " " + Params.CustomButton2
    END IF

    IF Params.CustomButton3 <> "" AND INSTR(Params.CustomButton3, "\" + CHR$(34)) = 0 THEN
        Params.CustomButton3 = "\" + CHR$(34) + Params.CustomButton3 + "\" + CHR$(34) '$args[22]
        SHELL$ = SHELL$ + " " + Params.CustomButton3
    END IF

    SHELL$ = SHELL$ + ";exit $LASTEXITCODE" + CHR$(34)
    a = _SHELLHIDE(SHELL$)
    _ECHO SHELL$

    WPFMessageBox = a
END FUNCTION

