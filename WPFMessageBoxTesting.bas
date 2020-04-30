'$INCLUDE:'WPFMessageBox.BI'
$CONSOLE:ONLY
_TITLE "WPFMessageBox Select Case Test"
Params.Content = "Choose an option, please"
Params.TitleFontSize = 20
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
END SELECT
'$INCLUDE:'WPFMessageBox.BM'
