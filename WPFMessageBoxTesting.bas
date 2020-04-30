'$INCLUDE:'WPFMessageBox.BI'
$CONSOLE:ONLY

_TITLE "WPFMessageBox Select Case Test"
Params.Content = "Choose an option, please"
Params.TitleFontSize = 20
Params.ContentFontSize = 18
Params.ContentBackground = Hue.Thistle
Params.ContentTextForeground = Hue.Plum
Params.ButtonTextForeground = Hue.Indigo
Params.TitleTextForeground = Hue.Indigo
Params.TitleBackground = Hue.Transparent
Params.ShadowDepth = 10
Params.CornerRadius = 30
Params.FontFamily = "Arial Black"
Params.ButtonType = Button.Yes_No_Cancel

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
        _ECHO "Didn't exit correctly or exited prematurely"
END SELECT

'$INCLUDE:'WPFMessageBox.BM'
