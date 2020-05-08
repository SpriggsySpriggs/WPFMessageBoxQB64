'$INCLUDE:'WPFMessageBox.BI'
'$CONSOLE:ONLY
'_DEST _CONSOLE
_TITLE "WPFMessageBox Select Case Test"
ON ERROR GOTO ERRHANDLE
ERRHANDLE:
IF ERR THEN
    IF _INCLERRORLINE THEN
        CriticalError ERR, _INCLERRORLINE, _INCLERRORFILE$
        RESUME NEXT
    ELSE
        CriticalError ERR, _ERRORLINE, ""
        RESUME NEXT
    END IF
END IF

OPEN "123.txt" FOR INPUT AS #1
PRINT "Resumed"
i = _LOADIMAGE("blarg.png")
PRINT "Resumed"
LINE INPUT #1, blargh$
PRINT "Resumed"
Params.Title = ""
Params.Content = "Choose an option, please"
Params.TitleFontSize = 20
Params.ContentFontSize = 18
Params.ContentBackground = Hue.Thistle
Params.ContentTextForeground = Hue.Purple
Params.ButtonTextForeground = Hue.Indigo
Params.TitleTextForeground = Hue.Indigo
Params.TitleBackground = Hue.Transparent
Params.ShadowDepth = 10
Params.CornerRadius = 30
Params.FontFamily = "Arial Black"
Params.Sound = ""
Params.ButtonType = Button.Cancel_TryAgain_Continue

SELECT CASE WPFMessageBox(Params)
    CASE ButtonClicked.OK
        PRINT "OK"
    CASE ButtonClicked.Cancel
        PRINT "Cancel"
    CASE ButtonClicked.Abort
        PRINT "Abort"
    CASE ButtonClicked.Retry
        PRINT "Retry"
    CASE ButtonClicked.Ignore
        PRINT "Ignore"
    CASE ButtonClicked.Yes
        PRINT "Yes"
    CASE ButtonClicked.No
        PRINT "No"
    CASE ButtonClicked.TryAgain
        PRINT "TryAgain"
    CASE ButtonClicked.Continue
        PRINT "Continue"
    CASE ELSE
        PRINT "Didn't exit with an expected code or exited prematurely"
END SELECT

'$INCLUDE:'WPFMessageBox.BM'
