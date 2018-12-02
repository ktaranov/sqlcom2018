; Any text file whose name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; ! - Alt
; ^ - Control
; + - Shift
; # - Win key
; InputBox, OutputVar [, Title, Prompt, HIDE, Width, Height, X, Y, Font, Timeout, Default]
; StringReplace, OutputVar, InputVar, SearchText [, ReplaceText, ReplaceAll?]

; !o::
; {
; SendInput {°}
; }
; return

; CapsLock::Insert  ;; replace CapsLock to insert

; Press Alt and input digital code below
; «Ёлочки»: 0171 и 0187.
; „лапки“: 0132 и 0147.
; “английские двойные”: 0147 и 0148.
; ‘английские одинарные’: 0145 и 0146.
; Самые используемые - французские кавычки, которые также называют «ёлочками». Ставятся в Microsoft Word по-умолчанию (по клавише Shift+2).

; fastest way to delete a large folder in Windows
; del /f/s/q foldername > nul
; rmdir /s/q foldername

^SPACE::  Winset, Alwaysontop, , A

:R*?:crd::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return

:*b0:<em>::</em>{left 5}
::k-t::Konstantin Taranov
::k@::kast218@gmail.com
::ke@::kast218.6e0ac@m.evernote.com
::kgaz::k.taranov@econom.gazprom.ru
::ifdrop::IF OBJECT_ID('TableName','U') IS NOT NULL DROP TABLE TableName;
::setuppy::python setup.py install
::coursera::I certify this submission as my own original work completed in accordance with the Coursera Honor Code.
::@@v::SELECT @@VERSION;
::@@sb::SELECT * FROM master.dbo.BenchmarkTSQL ORDER BY BenchmarkTSQLID DESC;
::@@tb::TRUNCATE TABLE master.dbo.BenchmarkTSQL;

; R Scripts
; http://stackoverflow.com/questions/1395270/determining-memory-usage-of-objects
:*:robjsize::sort(sapply(ls(),function(x){{}format(object.size(get(x)), units="Mb"){}}))
::rsns::setnames(dt, c(""),  c(""))

:*:]d::  ; This hotstring replaces "]d" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, yyyy-mm-dd hh:mm tt  ; It will look like 9/1/2005 3:53 PM
SendInput %CurrentDateTime%
return


;==========================================================================================================================================
; Ctrl+Alt+Win+1 Special symbols
^#!1::
; SetBatchLines -1
WinWide := 500
TextWide := 550
TxtX := 60
SelectedBtn := ""
SelectedTxt := ""

; Gui, Color, White
Gui, Font, cBlue s14 Bold, Verdana
Gui, Add, Text, x0 y30 w%WinWide% h30 Center , Select number or click mouse!
Gui, Font, s12 Normal
Gui, Add, Radio,  x%TxtX% y80   w%TextWide% h30 gRA1 vRA1 Checked, (&1) Currency Symbol
Gui, Add, Radio,          yp+30 w%TextWide% h30 gRA2 vRA2        , (&2) Special symbols
Gui, Add, Radio,          yp+30 w%TextWide% h30 gRA3 vRA3        , (&3) Greek, Russian, Latin alphabet
Gui, Add, Radio,          yp+30 w%TextWide% h30 gRA4 vRA4        , (&4) kast218@email.com
Gui, Add, Radio,          yp+30 w%TextWide% h30 gRA5 vRA5        , (&5) konstantin@taranov.pro
Gui, Add, Radio,          yp+30 w%TextWide% h30 gRA6 vRA6        , (&6) kast196@yandex.ru
Gui, Add, Button,         yp+60 w100 gButtOK Default             , &OK!
Gui, Show, x130 y100 h600 w%WinWide%, Quick string copy
Gosub, RA1 ; initialize selection
return

GuiClose:
GuiEscape:
Gui Destroy
return

RA1:
RA2:
RA3:
RA4:
RA5:
RA6:
   If (SelectedBtn) {
      Gui, Font, cBlue s16 Normal
      GuiControl, Font, %SelectedBtn%
   }
   SelectedBtn := A_ThisLabel
   Gui, Font, cRed s14 Bold
   GuiControl, Font, %SelectedBtn%
return

ButtOK:
   Gui Destroy
   If (SelectedBtn = "RA1") {
      Clipboard = $£€¥₱रु₮฿₩₴₫
   }
   if (SelectedBtn = "RA2") {
      Clipboard = „“«»“”°‘’№℗™Ω℮←↑→↓↔↕∂∆∏∑−∕∙√∞∫∟∩∫≈≠≡≤≥
   }
   if (SelectedBtn = "RA3") {
      Clipboard = αβγδεζηθικλμνξοπρστυφχψω
   }
   if (SelectedBtn = "RA4") {
      Clipboard = kast218@gmail.com
   }
   If (SelectedBtn = "RA5") {
      Clipboard = konstantin@taranov.pro
   }
   If (SelectedBtn = "RA6") {
      Clipboard = kast196@yandex.ru
   }
   MsgBox String copyed to Clipbord! `n`nSelection: %SelectedBtn% = %Clipboard%
return


;==========================================================================================================================================
; Ctrl+Alt+Win+2 SQL Gist
^!#2::
WinWide := 500
TextWide := 550
TxtX := 60
SelectedBtn := ""
SelectedTxt := ""

; Gui, Color, White
Gui, Font, cBlue s14 Bold, Verdana
Gui, Add, Text, x0 y30 w%WinWide% h30 Center , Select number or click mouse!
Gui, Font, s12 Normal
Gui, Add, Radio,  x%TxtX% y80   w%TextWide% h30 gSQL1 vSQL1 Checked, (&1) SQL Server Database Backup
Gui, Add, Radio,          yp+30 w%TextWide% h30 gSQL2 vSQL2        , (&2) usp_bcpTableUnload
Gui, Add, Radio,          yp+30 w%TextWide% h30 gSQL3 vSQL3        , (&3) usp_BulkUpload
Gui, Add, Radio,          yp+30 w%TextWide% h30 gSQL4 vSQL4        , (&4) Table Identity Reset
Gui, Add, Radio,          yp+30 w%TextWide% h30 gSQL5 vSQL5        , (&5) Openrowset Excel
Gui, Add, Radio,          yp+30 w%TextWide% h30 gSQL6 vSQL6        , (&6) Openrowset Flat File
Gui, Add, Radio,          yp+30 w%TextWide% h30 gRINSTALL vRINSTALL, (&7) RInstallPackage
Gui, Add, Button,         yp+60 w100 gButtSQLOK Default            , &OK!
Gui, Show, x130 y100 h600 w%WinWide%, Quick string copy
Gosub, SQL1 ; initialize selection
return

SQL1:
SQL2:
SQL3:
SQL4:
SQL5:
SQL6:
RINSTALL:
   If (SelectedBtn) {
      Gui, Font, cBlue s16 Normal
      GuiControl, Font, %SelectedBtn%
   }
   SelectedBtn := A_ThisLabel
   Gui, Font, cRed s14 Bold
   GuiControl, Font, %SelectedBtn%
return

ButtSQLOK:
   Gui Destroy
   If (SelectedBtn = "SQL1") {
      udf_SQLServerBackup()
   }
   if (SelectedBtn = "SQL2") {
      udf_usp_bcpTableUnload()
   }
   if (SelectedBtn = "SQL3") {
      udf_usp_BulkUpload()
   }
   If (SelectedBtn = "SQL4") {
      udf_IdentityReset()
   }
   If (SelectedBtn = "SQL5") {
      udf_OpenrowsetExcel()
   }
   If (SelectedBtn = "SQL6") {
      udf_OpenrowsetFlat()
   }   
   If (SelectedBtn = "RINSTALL") {
      udf_RInstallPackage()
   }
   ; MsgBox String copyed to Clipbord! `n`nSelection: %SelectedBtn% = %Clipboard%
return

udf_SQLServerBackup() {
   InputBox, replaceString, Replace String, Databse backup: Please input Database name
   if ErrorLevel
      {
      MsgBox, CANCEL was pressed.
      return
      }
   searchString = ___DatabaseName___
   BackupString = 
   (
BACKUP DATABASE [___DatabaseName___] TO DISK = N'D:\MSSQL\MSSQL12.MSSQLSERVER\MSSQL\Backup\___DatabaseName___.bak'
WITH NOFORMAT
,COPY_ONLY
,NOINIT
,NAME = N'___DatabaseName___-Full Database Backup'
,SKIP
,NOREWIND
,NOUNLOAD
,COMPRESSION
,STATS = 10;
GO

DECLARE @backupSetId AS INT;

SELECT @backupSetId = position
FROM msdb..backupset
WHERE database_name = N'___DatabaseName___'
   AND backup_set_id = (
SELECT max(backup_set_id)
FROM msdb..backupset
WHERE database_name = N'___DatabaseName___');

IF @backupSetId IS NULL
BEGIN
RAISERROR (N'Verify failed. Backup information for database ''___DatabaseName___'' not found.', 16 ,1);
END

RESTORE VERIFYONLY
FROM DISK = N'D:\MSSQL\MSSQL12.MSSQLSERVER\MSSQL\Backup\___DatabaseName___.bak'
WITH FILE = @backupSetId
,NOUNLOAD
,NOREWIND;
GO
   )
   StringUpper replaceString, replaceString
   StringReplace, BackupString, BackupString, %searchString%, %replaceString%, All
   Clipboard = %BackupString%
   Send ^v
   return
}

udf_usp_bcpTableUnload() {
   InputBox, replaceString, Replace String, usp_bcpTableUnload: Please input Table name
   if ErrorLevel
       {
       MsgBox, CANCEL was pressed.
       return
       }
   searchString = ___TableName___
   TSQLStatetment =
   (
EXECUTE dbo.usp_bcpTableUnload
      @path                = 'd:\'
    , @databaseName        = 'NIIGAZ'
    , @schemaName          = 'dbo'
    , @tableName           = '___TableName___'
    , @field_term          = '|'
    , @row_term            = '\n'
    , @fileExtension       = 'txt'
    , @excludeColumns      = ''
    , @orderByColumns      = '___TableName___ID'
    , @outputColumnHeaders = 1
    , @debug               = 0;
   )
   StringReplace, TSQLStatetment, TSQLStatetment, %searchString%, %replaceString%, All
   Clipboard = %TSQLStatetment%
   Send ^v
   return
}

udf_usp_BulkUpload() {
   InputBox, inputSchemaName, Schema Name, usp_BulkUpload: Please input Schema name, , 300, 150, , , , ,dbo
   if ErrorLevel
       {
       MsgBox, CANCEL was pressed.
       return
       }
   InputBox, inputTableName, Table Name, usp_BulkUpload: Please input Table name
   if ErrorLevel
       {
       MsgBox, CANCEL was pressed.
       return
       }
   
   schemaName = ___SchemaName___
   tableName  = ___TableName___
   TSQLStatetment =
   (
EXEC dbo.usp_BulkUpload
     @path                = N'D:\'-- add a slash (\) at the end of a variable @path
   , @fileName            = N'[___SchemaName___].[___TableName___]'
   , @fileExtension       = N'txt'
   , @databaseName        = 'NIIGAZ'
   , @schemaName          = N'___schemaName___'
   , @tableName           = N'___TableName___'
   , @useIdentity         = 1  -- 1 - table with identity and identity column exists in file; 2 - table with identity and identity column not exists in file; 0 - table without identity
   , @identityColumnName  = N''
   , @CODEPAGE            = N'1251'
   , @DATAFILETYPE        = N'char'
   , @FIELDTERMINATOR     = N'|'
   , @FIRSTROW            = 2
   , @KEEPNULLS           = 0
   , @LASTROW             = 0
   , @ROWTERMINATOR       = N'\n'
   , @TABLOCK             = 1
   , @ERRORFILE           = N''
   , @FORMATFILE          = 'xml'
   , @excludeColumns      = N''''''
   , @rowOrderByColumn    = N''
   , @skipTempDB          = 1
   , @columnTypeSort      = 0    -- 0 - physical column order; 1 - alphabetical
   , @databaseRecoveryMode= N''  -- '' - without change; FULL; BULK_LOGGED; SIMPLE
   , @debug               = 0    -- 0 - only print tsql statement; 1 - exec tsql statement
   )
   StringReplace, TSQLStatetment, TSQLStatetment, %schemaName%, %inputSchemaName%, All
   StringReplace, TSQLStatetment, TSQLStatetment, %tableName%, %inputTableName%, All
   Clipboard = %TSQLStatetment%
   Send ^v
   return
}

udf_IdentityReset() {
InputBox, replaceString, Replace String, Identity reset: Please input Table name
if ErrorLevel
    {
    MsgBox, CANCEL was pressed.
    return
    }

searchString = ___TableName___
PATINDEX := "PATINDEX('%.%', @tableName)"
TSQLStatetment = 
(
DECLARE @currentIdentity INTEGER;
DECLARE @maxIdentity     INTEGER;
DECLARE @tableName       SYSNAME        = N'___TableName___';
DECLARE @ParmDefinition  NVARCHAR(500)  = N'@maxIdentityOUT INTEGER OUTPUT';
DECLARE @sqlStatement    NVARCHAR(1000) = N'SELECT @maxIdentityOUT = MAX(' + 
                                          RIGHT(@tableName, 
                                                LEN(@tableName) -%PATINDEX%) +
                                          N'ID) FROM ' + @tableName;
PRINT @sqlStatement;
exec sp_executesql
      @sqlStatement
    , @ParmDefinition
    , @maxIdentityOUT = @maxIdentity OUTPUT;
PRINT '@maxIdentity = ' + ISNULL(CAST(@maxIdentity AS VARCHAR), 'NULL');
SELECT @currentIdentity = IDENT_CURRENT(@tableName);
PRINT '@currentIdentity = ' + ISNULL(CAST(@currentIdentity AS VARCHAR), 'NULL');

IF @maxIdentity = @currentIdentity
PRINT 'All OK, Table ' + @tableName +' have maxIdentity = currentIdentity = ' + CAST(@maxIdentity AS VARCHAR)

IF @maxIdentity > @currentIdentity
PRINT 'Error, Table ' + @tableName + ' have maxIdentity > currentIdentity' + CAST(@maxIdentity AS VARCHAR)
--DBCC CHECKIDENT(@tableName, RESEED, @maxIdentity);
)
StringReplace, TSQLStatetment, TSQLStatetment, %searchString%, %replaceString%, All
Clipboard = %TSQLStatetment%
Send ^v
return
}

udf_OpenrowsetExcel() {
InputBox, replaceString, Replace String, Identity reset: Please input complete File Path
if ErrorLevel
    {
    MsgBox, CANCEL was pressed.
    return
    }

searchString = ___FilePath___
TSQLStatetment = 
(
SELECT *
  FROM OPENROWSET(
      'Microsoft.ACE.OLEDB.12.0'
    , 'Excel 12.0;Database=___FilePath___'
    , 'SELECT * FROM [ListName$A1:B2]') AS op; 
)
StringReplace, TSQLStatetment, TSQLStatetment, %searchString%, %replaceString%, All
Clipboard = %TSQLStatetment%
Send ^v
return
}

udf_OpenrowsetFlat() {
InputBox, replaceString, Replace String, Identity reset: Please input complete File Path
if ErrorLevel
    {
    MsgBox, CANCEL was pressed.
    return
    }

searchString = ___FilePath___
TSQLStatetment = 
(
SELECT *
  FROM OPENROWSET(
      'MSDASQL'
    , 'Driver={Microsoft Access Text Driver (*.txt, *.csv)}; DefaultDir=___FilePath___'
    , 'SELECT * FROM "file.txt"') AS op; 

)
StringReplace, TSQLStatetment, TSQLStatetment, %searchString%, %replaceString%, All
Clipboard = %TSQLStatetment%
Send ^v
return
}

udf_RInstallPackage() {
InputBox, replaceString, Replace String, Identity reset: Please input package File Path
if ErrorLevel
    {
    MsgBox, CANCEL was pressed.
    return
    }

searchString = ___PackageFilePath___
RStatetment = 
(
install.packages(
  paste0("___PackageFilePath___"),
  lib =  paste0(paste0(
    "c:/Program Files/R/R-", paste0(paste0(version$major, "."), version$minor)), "/library/"),
  repos = NULL)
)
StringReplace, RStatetment, RStatetment, %searchString%, %replaceString%, All
Clipboard = %RStatetment%
Send ^v
return
}


^!#5::
;InputBox, replaceString, Replace String, Identity reset: Please input Table name
if ErrorLevel
    {
    MsgBox, CANCEL was pressed.
    return
    }

;searchString = ___TableName___
RStatetment = 
(
suppressPackageStartupMessages(library("openxlsx"))
suppressPackageStartupMessages(library("data.table"))

excelFilePath <- "D:/MyExcel.xlsx"
startRow <- 1L

dtOld <-
  data.table(read.xlsx(
    excelFilePath,
    sheet = "SPLITDAT_OLD",
    startRow = startRow,
    colNames = TRUE))

dtLast <-
  data.table(read.xlsx(
    excelFilePath,
    sheet = "SPLITDAT",
    startRow = startRow,
    colNames = TRUE))

diffDT <- fsetdiff(x = dtOld, y = dtLast)
)
;StringReplace, TSQLStatetment, TSQLStatetment, %searchString%, %replaceString%, All
Clipboard = %RStatetment%
Send ^v
return


^!#3::
WinWide := 500
TextWide := 550
TxtX := 60
SelectedBtn := ""
SelectedTxt := ""

; Gui, Color, White
Gui, Font, cBlue s14 Bold, Verdana
Gui, Add, Text, x0 y30 w%WinWide% h30 Center , Type number or click mouse!
Gui, Font, s12 Normal
Gui, Add, Radio, x%TxtX% y80 w%TextWide% h30 gRUN1 vRUN1 Checked, (&1) SpeedCrunchPortable
Gui, Add, Radio,       yp+30 w%TextWide% h30 gRUN2 vRUN2        , (&2) SSMS
Gui, Add, Radio,       yp+30 w%TextWide% h30 gRUN3 vRUN3        , (&3) Dropbox and Yandex Disk
Gui, Add, Radio,       yp+30 w%TextWide% h30 gRUN4 vRUN4        , (&4) Excel
Gui, Add, Radio,       yp+30 w%TextWide% h30 gRUN5 vRUN5        , (&5) Character Map
Gui, Add, Button,      yp+60 w100 gButtRUNOK Default            , &OK!
Gui, Show, x130 y100 h600 w%WinWide%, Quick string copy
Gosub, RUN1 ; initialize selection
return

RUN1:
RUN2:
RUN3:
RUN4:
RUN5:
   If (SelectedBtn) {
      Gui, Font, cBlue s16 Normal
      GuiControl, Font, %SelectedBtn%
   }
   SelectedBtn := A_ThisLabel
   Gui, Font, cRed s14 Bold
   GuiControl, Font, %SelectedBtn%
return

ButtRUNOK:
   Gui Destroy
   If (SelectedBtn = "RUN1") {
      RUN d:\Unix\PortableApp\PortableApps\SpeedCrunchPortable\SpeedCrunchPortable.exe
   }
   if (SelectedBtn = "RUN2") {
      Run "C:\Program Files (x86)\Microsoft SQL Server\120\Tools\Binn\ManagementStudio\Ssms.exe"
   }
   if (SelectedBtn = "RUN3") {
      Run C:\Users\admin\AppData\Roaming\Dropbox\bin\Dropbox.exe
      Run C:\Users\admin\AppData\Roaming\Yandex\YandexDisk\YandexDisk.exe
   }
   If (SelectedBtn = "RUN4") {
      Run Excel
   }
   If (SelectedBtn = "RUN5") {
      Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\System Tools\Character Map.lnk"
   }
return


;==========================================================================================================================================
; Quick runs program

; Ctrl+Win+Alt+O
^#!o::
Run C:\Program Files (x86)\RemotePackages\OUTLOOK.rdp
return


; Ctrl+Win+Alt+E
^#!e::
;MsgBox, 4, , Would you like to continue?
;IfMsgBox, No
;    return
;; Otherwise, the user picked yes.
;MsgBox You pressed YES.
IfWinExist Книга1 - Microsoft Excel
    WinActivate
else
    Run Excel
return


;==========================================================================================================================================
; Replace clipbord pattern using regex
#!^h::
InputBox, searchString, Search String for Replacment, Please input your string (use escape symbol '\' for regex symbols: ./*), , , 300, 150, , , ,\\
if (ErrorLevel){
    MsgBox, CANCEL was pressed.
    return
 }else{
InputBox, replaceString, Replace String, Please input your string, , 300, 150, , , , ,`/
}
if (ErrorLevel){
    MsgBox, CANCEL was pressed.
    return
 }else{
var1 = %Clipboard%
var1 := RegExReplace(var1, searchString, replaceString)
Clipboard = %var1%
}
return


;==========================================================================================================================================
; CTL+L - convert to lowercase
; CTL+U - convert to uppercase
; CTL+K - invert the case (e.g. "The Big Dog" becomes "tHE bIG dOG")
; SHIFT+CTL+K - convert to capitalized (e.g. "the big dog" becomes "The Big Dog")
; SHIFT+CTL+U - convert to sentence case

; Ctrl+Win+U Convert text to upper
^#u::                                                                 
 StringUpper Clipboard, Clipboard
 Send %Clipboard%
return

; Ctrl+Win+L Convert text to lower
^#l::
 StringLower Clipboard, Clipboard
 Send %Clipboard%
return

; Ctrl+Win+K Convert text to capitalized
^#k::
 StringUpper Clipboard, Clipboard, T
 Send %Clipboard%
return

; Ctrl+Win+Alt+K Convert text to inverted
^#!k::
 Lab_Invert_Char_Out:= ""
 Loop % Strlen(Clipboard) {
    Lab_Invert_Char:= Substr(Clipboard, A_Index, 1)
    if Lab_Invert_Char is upper
       Lab_Invert_Char_Out:= Lab_Invert_Char_Out Chr(Asc(Lab_Invert_Char) + 32)
    else if Lab_Invert_Char is lower
       Lab_Invert_Char_Out:= Lab_Invert_Char_Out Chr(Asc(Lab_Invert_Char) - 32)
    else
       Lab_Invert_Char_Out:= Lab_Invert_Char_Out Lab_Invert_Char
 }
 Send %Lab_Invert_Char_Out%
return
