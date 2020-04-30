'$INCLUDE:'New-WPFMessageBox.ps1.bin.bas'
''$CONSOLE:ONLY
'=============================================
TYPE Params
    Content AS STRING 'mandatory
    Title AS STRING 'not mandatory
    ButtonType AS STRING 'defaults to Button.OK
    'Valid ButtonType values are listed in Button
    ContentFontSize AS INTEGER 'defaults to 14
    TitleFontSize AS INTEGER 'defaults to 14
    BorderThickness AS INTEGER 'defaults to 0
    CornerRadius AS INTEGER 'defaults to 8
    ShadowDepth AS INTEGER 'defaults to 3
    BlurRadius AS INTEGER 'defaults to 20
    'WindowHost AS LONG
    'Timeout AS STRING 'not mandatory
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
    Sound AS STRING 'not mandatory, defaults to Alert.NotifySystemGeneric
    'Valid sounds are listed in Alert
    'CustomButton1 AS STRING 'not mandatory, only used if ButtonType = Button.None
    'CustomButton2 AS STRING 'not mandatory, only used if ButtonType = Button.None
    'CustomButton3 AS STRING 'not mandatory, only used if ButtonType = Button.None
END TYPE
DIM SHARED Params AS Params
TYPE ButtonClicked
    OK AS INTEGER
    Cancel AS INTEGER
    Abort AS INTEGER
    Retry AS INTEGER
    Ignore AS INTEGER
    Yes AS INTEGER
    No AS INTEGER
    TryAgain AS INTEGER
    Continue AS INTEGER
END TYPE
DIM SHARED ButtonClicked AS ButtonClicked
ButtonClicked.OK = 1
ButtonClicked.Cancel = 2
ButtonClicked.Abort = 3
ButtonClicked.Retry = 4
ButtonClicked.Ignore = 5
ButtonClicked.Yes = 6
ButtonClicked.No = 7
ButtonClicked.TryAgain = 8
ButtonClicked.Continue = 9
TYPE ButtonType
    OK AS STRING
    OK_Cancel AS STRING
    Abort_Retry_Ignore AS STRING
    Yes_No_Cancel AS STRING
    Yes_No AS STRING
    Retry_Cancel AS STRING
    Cancel_TryAgain_Continue AS STRING
    'None AS STRING
END TYPE
DIM SHARED Button AS ButtonType
Button.OK = "OK"
Button.OK_Cancel = "OK-Cancel"
Button.Abort_Retry_Ignore = "Abort-Retry-Ignore"
Button.Yes_No_Cancel = "Yes-No-Cancel"
Button.Yes_No = "Yes-No"
Button.Retry_Cancel = "Retry-Cancel"
Button.Cancel_TryAgain_Continue = "Cancel-TryAgain-Continue"
'Button.None = "None"
TYPE Color
    AliceBlue AS STRING
    AntiqueWhite AS STRING
    Aqua AS STRING
    Aquamarine AS STRING
    Azure AS STRING
    Beige AS STRING
    Bisque AS STRING
    Black AS STRING
    BlanchedAlmond AS STRING
    Blue AS STRING
    BlueViolet AS STRING
    Brown AS STRING
    BurlyWood AS STRING
    CadetBlue AS STRING
    Chartreuse AS STRING
    Chocolate AS STRING
    Coral AS STRING
    CornflowerBlue AS STRING
    Cornsilk AS STRING
    Crimson AS STRING
    Cyan AS STRING
    DarkBlue AS STRING
    DarkCyan AS STRING
    DarkGoldenrod AS STRING
    DarkGray AS STRING
    DarkGreen AS STRING
    DarkKhaki AS STRING
    DarkMagenta AS STRING
    DarkOliveGreen AS STRING
    DarkOrange AS STRING
    DarkOrchid AS STRING
    DarkRed AS STRING
    DarkSalmon AS STRING
    DarkSeaGreen AS STRING
    DarkSlateBlue AS STRING
    DarkSlateGray AS STRING
    DarkTurquoise AS STRING
    DarkViolet AS STRING
    DeepPink AS STRING
    DeepSkyBlue AS STRING
    DimGray AS STRING
    DodgerBlue AS STRING
    Firebrick AS STRING
    FloralWhite AS STRING
    ForestGreen AS STRING
    Fuchsia AS STRING
    Gainsboro AS STRING
    GhostWhite AS STRING
    Gold AS STRING
    Goldenrod AS STRING
    Gray AS STRING
    Green AS STRING
    GreenYellow AS STRING
    Honeydew AS STRING
    HotPink AS STRING
    IndianRed AS STRING
    Indigo AS STRING
    Ivory AS STRING
    Khaki AS STRING
    Lavender AS STRING
    LavenderBlush AS STRING
    LawnGreen AS STRING
    LemonChiffon AS STRING
    LightBlue AS STRING
    LightCoral AS STRING
    LightCyan AS STRING
    LightGoldenrodYellow AS STRING
    LightGray AS STRING
    LightGreen AS STRING
    LightPink AS STRING
    LightSalmon AS STRING
    LightSeaGreen AS STRING
    LightSkyBlue AS STRING
    LightSlateGray AS STRING
    LightSteelBlue AS STRING
    LightYellow AS STRING
    Lime AS STRING
    LimeGreen AS STRING
    Linen AS STRING
    Magenta AS STRING
    Maroon AS STRING
    MediumAquamarine AS STRING
    MediumBlue AS STRING
    MediumOrchid AS STRING
    MediumPurple AS STRING
    MediumSeaGreen AS STRING
    MediumSlateBlue AS STRING
    MediumSpringGreen AS STRING
    MediumTurquoise AS STRING
    MediumVioletRed AS STRING
    MidnightBlue AS STRING
    MintCream AS STRING
    MistyRose AS STRING
    Moccasin AS STRING
    NavajoWhite AS STRING
    Navy AS STRING
    OldLace AS STRING
    Olive AS STRING
    OliveDrab AS STRING
    Orange AS STRING
    OrangeRed AS STRING
    Orchid AS STRING
    PaleGoldenrod AS STRING
    PaleGreen AS STRING
    PaleTurquoise AS STRING
    PaleVioletRed AS STRING
    PapayaWhip AS STRING
    PeachPuff AS STRING
    Peru AS STRING
    Pink AS STRING
    Plum AS STRING
    PowderBlue AS STRING
    Purple AS STRING
    Red AS STRING
    RosyBrown AS STRING
    RoyalBlue AS STRING
    SaddleBrown AS STRING
    Salmon AS STRING
    SandyBrown AS STRING
    SeaGreen AS STRING
    SeaShell AS STRING
    Sienna AS STRING
    Silver AS STRING
    SkyBlue AS STRING
    SlateBlue AS STRING
    SlateGray AS STRING
    Snow AS STRING
    SpringGreen AS STRING
    SteelBlue AS STRING
    Tan AS STRING
    Teal AS STRING
    Thistle AS STRING
    Tomato AS STRING
    Transparent AS STRING 'Might not work. Test this
    Turquoise AS STRING
    Violet AS STRING
    Wheat AS STRING
    White AS STRING
    WhiteSmoke AS STRING
    Yellow AS STRING
    YellowGreen AS STRING
END TYPE
DIM SHARED Hue AS Color
Hue.AliceBlue = "AliceBlue"
Hue.AntiqueWhite = "AntiqueWhite"
Hue.Aqua = "Aqua"
Hue.Aquamarine = "Aquamarine"
Hue.Azure = "Azure"
Hue.Beige = "Beige"
Hue.Bisque = "Bisque"
Hue.Black = "Black"
Hue.BlanchedAlmond = "BlanchedAlmond"
Hue.Blue = "Blue"
Hue.BlueViolet = "BlueViolet"
Hue.Brown = "Brown"
Hue.BurlyWood = "BurlyWood"
Hue.CadetBlue = "CadetBlue"
Hue.Chartreuse = "Chartreuse"
Hue.Chocolate = "Chocolate"
Hue.Coral = "Coral"
Hue.CornflowerBlue = "CornflowerBlue"
Hue.Cornsilk = "Cornsilk"
Hue.Crimson = "Crimson"
Hue.Cyan = "Cyan"
Hue.DarkBlue = "DarkBlue"
Hue.DarkCyan = "DarkCyan"
Hue.DarkGoldenrod = "DarkGoldenrod"
Hue.DarkGray = "DarkGray"
Hue.DarkGreen = "DarkGreen"
Hue.DarkKhaki = "DarkKhaki"
Hue.DarkMagenta = "DarkMagenta"
Hue.DarkOliveGreen = "DarkOliveGreen"
Hue.DarkOrange = "DarkOrange"
Hue.DarkOrchid = "DarkOrchid"
Hue.DarkRed = "DarkRed"
Hue.DarkSalmon = "DarkSalmon"
Hue.DarkSeaGreen = "DarkSeaGreen"
Hue.DarkSlateBlue = "DarkSlateBlue"
Hue.DarkSlateGray = "DarkSlateGray"
Hue.DarkTurquoise = "DarkTurquoise"
Hue.DarkViolet = "DarkViolet"
Hue.DeepPink = "DeepPink"
Hue.DeepSkyBlue = "DeepSkyBlue"
Hue.DimGray = "DimGray"
Hue.DodgerBlue = "DodgerBlue"
Hue.Firebrick = "Firebrick"
Hue.FloralWhite = "FloralWhite"
Hue.ForestGreen = "ForestGreen"
Hue.Fuchsia = "Fuchsia"
Hue.Gainsboro = "Gainsboro"
Hue.GhostWhite = "GhostWhite"
Hue.Gold = "Gold"
Hue.Goldenrod = "Goldenrod"
Hue.Gray = "Gray"
Hue.Green = "Green"
Hue.GreenYellow = "GreenYellow"
Hue.Honeydew = "Honeydew"
Hue.HotPink = "HotPink"
Hue.IndianRed = "IndianRed"
Hue.Indigo = "Indigo"
Hue.Ivory = "Ivory"
Hue.Khaki = "Khaki"
Hue.Lavender = "Lavender"
Hue.LavenderBlush = "LavenderBlush"
Hue.LawnGreen = "LawnGreen"
Hue.LemonChiffon = "LemonChiffon"
Hue.LightBlue = "LightBlue"
Hue.LightCoral = "LightCoral"
Hue.LightCyan = "LightCyan"
Hue.LightGoldenrodYellow = "LightGoldenrodYellow"
Hue.LightGray = "LightGray"
Hue.LightGreen = "LightGreen"
Hue.LightPink = "LightPink"
Hue.LightSalmon = "LightSalmon"
Hue.LightSeaGreen = "LightSeaGreen"
Hue.LightSkyBlue = "LightSkyBlue"
Hue.LightSlateGray = "LightSlateGray"
Hue.LightSteelBlue = "LightSteelBlue"
Hue.LightYellow = "LightYellow"
Hue.Lime = "Lime"
Hue.LimeGreen = "LimeGreen"
Hue.Linen = "Linen"
Hue.Magenta = "Magenta"
Hue.Maroon = "Maroon"
Hue.MediumAquamarine = "MediumAquamarine"
Hue.MediumBlue = "MediumBlue"
Hue.MediumOrchid = "MediumOrchid"
Hue.MediumPurple = "MediumPurple"
Hue.MediumSeaGreen = "MediumSeaGreen"
Hue.MediumSlateBlue = "MediumSlateBlue"
Hue.MediumSpringGreen = "MediumSpringGreen"
Hue.MediumTurquoise = "MediumTurquoise"
Hue.MediumVioletRed = "MediumVioletRed"
Hue.MidnightBlue = "MidnightBlue"
Hue.MintCream = "MintCream"
Hue.MistyRose = "MistyRose"
Hue.Moccasin = "Moccasin"
Hue.NavajoWhite = "NavajoWhite"
Hue.Navy = "Navy"
Hue.OldLace = "OldLace"
Hue.Olive = "Olive"
Hue.OliveDrab = "OliveDrab"
Hue.Orange = "Orange"
Hue.OrangeRed = "OrangeRed"
Hue.Orchid = "Orchid"
Hue.PaleGoldenrod = "PaleGoldenrod"
Hue.PaleGreen = "PaleGreen"
Hue.PaleTurquoise = "PaleTurquoise"
Hue.PaleVioletRed = "PaleVioletRed"
Hue.PapayaWhip = "PapayaWhip"
Hue.PeachPuff = "PeachPuff"
Hue.Peru = "Peru"
Hue.Pink = "Pink"
Hue.Plum = "Plum"
Hue.PowderBlue = "PowderBlue"
Hue.Purple = "Purple"
Hue.Red = "Red"
Hue.RosyBrown = "RosyBrown"
Hue.RoyalBlue = "RoyalBlue"
Hue.SaddleBrown = "SaddleBrown"
Hue.Salmon = "Salmon"
Hue.SandyBrown = "SandyBrown"
Hue.SeaGreen = "SeaGreen"
Hue.SeaShell = "SeaShell"
Hue.Sienna = "Sienna"
Hue.Silver = "Silver"
Hue.SkyBlue = "SkyBlue"
Hue.SlateBlue = "SlateBlue"
Hue.SlateGray = "SlateGray"
Hue.Snow = "Snow"
Hue.SpringGreen = "SpringGreen"
Hue.SteelBlue = "SteelBlue"
Hue.Tan = "Tan"
Hue.Teal = "Teal"
Hue.Thistle = "Thistle"
Hue.Tomato = "Tomato"
Hue.Transparent = "Transparent" 'Might not work. Test this
Hue.Turquoise = "Turquoise"
Hue.Violet = "Violet"
Hue.Wheat = "Wheat"
Hue.White = "White"
Hue.WhiteSmoke = "WhiteSmoke"
Hue.Yellow = "Yellow"
Hue.YellowGreen = "YellowGreen"
TYPE Sound
    Background AS STRING
    Balloon AS STRING
    BatteryCritical AS STRING
    BatteryLow AS STRING
    CriticalStop AS STRING
    Default AS STRING
    Ding AS STRING
    Error AS STRING
    Exclamation AS STRING
    FeedDiscovered AS STRING
    Foreground AS STRING
    HardwareFail AS STRING
    HardwareInsert AS STRING
    HardwareRemove AS STRING
    InformationBar AS STRING
    LogoffSound AS STRING
    Logon AS STRING
    MenuCommand AS STRING
    MessageNudge AS STRING
    Minimize AS STRING
    NavigationStart AS STRING
    NotifyCalendar AS STRING
    NotifyEmail AS STRING
    NotifyMessaging AS STRING
    NotifySystemGeneric AS STRING
    Notify AS STRING
    Pop_upBlocked AS STRING
    PrintComplete AS STRING
    ProximityConnection AS STRING
    ProximityNotification AS STRING
    Recycle AS STRING
    Restore AS STRING
    Ringin AS STRING
    Ringout AS STRING
    Shutdown AS STRING
    Startup AS STRING
    Unlock AS STRING
    UserAccountControl AS STRING
END TYPE
DIM SHARED Alert AS Sound
Alert.Background = "Windows Background"
Alert.Balloon = "Windows Balloon"
Alert.BatteryCritical = "Windows Battery Critical"
Alert.BatteryLow = "Windows Battery Low"
Alert.CriticalStop = "Windows Critical Stop"
Alert.Default = "Windows Default"
Alert.Ding = "Windows Ding"
Alert.Error = "Windows Error"
Alert.Exclamation = "Windows Exclamation"
Alert.FeedDiscovered = "Windows Feed Discovered"
Alert.Foreground = "Windows Foreground"
Alert.HardwareFail = "Windows Hardware Fail"
Alert.HardwareInsert = "Windows Hardware Insert"
Alert.HardwareRemove = "Windows Hardware Remove"
Alert.InformationBar = "Windows Information Bar"
Alert.LogoffSound = "Windows Logoff Sound"
Alert.Logon = "Windows Logon"
Alert.MenuCommand = "Windows Menu Command"
Alert.MessageNudge = "Windows Message Nudge"
Alert.Minimize = "Windows Minimize"
Alert.NavigationStart = "Windows Navigation Start"
Alert.NotifyCalendar = "Windows Notify Calendar"
Alert.NotifyEmail = "Windows Notify Email"
Alert.NotifyMessaging = "Windows Notify Messaging"
Alert.NotifySystemGeneric = "Windows Notify System Generic"
Alert.Notify = "Windows Notify"
Alert.Pop_upBlocked = "Windows Pop-up Blocked"
Alert.PrintComplete = "Windows Print Complete"
Alert.ProximityConnection = "Windows Proximity Connection"
Alert.ProximityNotification = "Windows Proximity Notification"
Alert.Recycle = "Windows Recycle"
Alert.Restore = "Windows Restore"
Alert.Ringin = "Windows Ringin"
Alert.Ringout = "Windows Ringout"
Alert.Shutdown = "Windows Shutdown"
Alert.Startup = "Windows Startup"
Alert.Unlock = "Windows Unlock"
Alert.UserAccountControl = "Windows User Account Control"
TYPE FontWeight
    Thin AS STRING
    ExtraLight AS STRING
    UltraLight AS STRING
    Light AS STRING
    Normal AS STRING
    Regular AS STRING
    Medium AS STRING
    DemiBold AS STRING
    SemiBold AS STRING
    Bold AS STRING
    ExtraBold AS STRING
    UltraBold AS STRING
    Black AS STRING
    Heavy AS STRING
    ExtraBlack AS STRING
    UltraBlack AS STRING
END TYPE
DIM SHARED FontWeight AS FontWeight
FontWeight.Thin = "Thin"
FontWeight.ExtraLight = "ExtraLight"
FontWeight.UltraLight = "UltraLight"
FontWeight.Light = "Light"
FontWeight.Normal = "Normal"
FontWeight.Regular = "Regular"
FontWeight.Medium = "Medium"
FontWeight.DemiBold = "DemiBold"
FontWeight.SemiBold = "SemiBold"
FontWeight.Bold = "Bold"
FontWeight.ExtraBold = "ExtraBold"
FontWeight.UltraBold = "UltraBold"
FontWeight.Black = "Black"
FontWeight.Heavy = "Heavy"
FontWeight.ExtraBlack = "ExtraBlack"
FontWeight.UltraBlack = "UltraBlack"
