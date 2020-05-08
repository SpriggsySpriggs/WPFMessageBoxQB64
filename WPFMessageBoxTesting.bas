'$INCLUDE:'WPFMessageBox.BI'
$CONSOLE:ONLY
_CONSOLETITLE "WPFMessageBox Select Case Test"
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
LINE INPUT #1, blargh$
_ECHO "RESUMED"
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
        _ECHO "OK"
    CASE ButtonClicked.Cancel
        _ECHO "Cancel"
    CASE ButtonClicked.Abort
        _ECHO "Abort"
    CASE ButtonClicked.Retry
        _ECHO "Retry"
    CASE ButtonClicked.Ignore
        _ECHO "Ignore"
    CASE ButtonClicked.Yes
        _ECHO "Yes"
    CASE ButtonClicked.No
        _ECHO "No"
    CASE ButtonClicked.TryAgain
        _ECHO "TryAgain"
    CASE ButtonClicked.Continue
        _ECHO "Continue"
    CASE ELSE
        _ECHO "Didn't exit with an expected code or exited prematurely"
END SELECT

'$INCLUDE:'WPFMessageBox.BM'
