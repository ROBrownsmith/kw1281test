@ECHO OFF
ECHO .
ECHO .
CHOICE /C 1234 /M "Choose COM port"
GOTO COM%ERRORLEVEL%

:COM4
set com=com4
GOTO Q2

:COM3
set com=com3
GOTO Q2

:COM2
set com=com2
GOTO Q2

:COM1
set com=com1
GOTO Q2

:Q2
ECHO .
ECHO .
CHOICE /C 12 /M "Choose baud rate 1. 10400, 2. 9600"
GOTO BAUD%ERRORLEVEL%


:BAUD2
set baud=9600
GOTO Q3

:BAUD1
set baud=10400
GOTO Q3

:Q3
ECHO . 
ECHO .
CHOICE /C 1234 /M "Choose controller 1. ECU, 2. Cluster, 3. CCM, 4. Radio"
GOTO CONTROLLER%ERRORLEVEL%

:CONTROLLER4
set controller=56
GOTO Q4

:CONTROLLER3
set controller=46
GOTO Q4

:CONTROLLER2
set controller=17
GOTO Q4

:CONTROLLER1
set controller=1
GOTO Q4


:Q4
ECHO .
ECHO .
CHOICE /C 123456789 /M "Choose command 1. ActuatorTest 2. AdaptationRead 3. AdaptationSave 4. AdaptationTest 5. BasicSetting 6. ClarionVWPremium4SafeCode 7. ClearFaultCodes 8. DelcoVWPremium5SafeCode 9. more commands" 
GOTO SWITCH%ERRORLEVEL%

:Q5
ECHO .
ECHO .
CHOICE /C 123456789 /M "1. DumpEdc15Eeprom 2. DumpEeprom 3. DumpMarelliMem 4. DumpMem 5. DumpRBxMem 6. GetSKC 7. GroupRead 8. LoadEeprom 9. more commands"
GOTO BSWITCH%ERRORLEVEL%

:Q6
ECHO .
ECHO .
CHOICE /C 123456789 /M "1. MapEeprom 2. ReadFaultCodes 3. ReadIdent 4. ReadEeprom 5. ReadRAM 6. ReadROM 7. ReadSoftwareVersion 8. Reset 9. more commands"
GOTO CSWITCH%ERRORLEVEL%

:Q7
ECHO .
ECHO .
CHOICE /C 123 /M "1. SetSoftwareCoding 2. ToogleRB4Mode 3. WriteEeprom"
GOTO DSWITCH%ERRORLEVEL%

:DSWITCH3
set switch=WriteEeprom
GOTO ADDRESS
:DSWITCH2
set switch=ToogleRB4Mode
GOTO SYNTAX
:DSWITCH1
set switch=SetSoftwareCoding
GOTO CODING
:CSWITCH9
GOTO Q7
:CSWITCH8
set switch=Reset
GOTO SYNTAX
:CSWITCH7
set switch=ReadSoftwareVersion
GOTO SYNTAX
:CSWITCH6
set switch=ReadROM
GOTO ADDRESS
:CSWITCH5
set switch=ReadRAM
GOTO ADDRESS
:CSWITCH4
set switch=ReadEeprom
GOTO ADDRESS
:CSWITCH3
set switch=ReadIdent
GOTO SYNTAX
:CSWITCH2
set switch=ReadFaultCodes
GOTO SYNTAX
:CSWITCH1
set switch=MapEeprom
GOTO SYNTAX
:BSWITCH9
GOTO Q6
:BSWITCH8
set switch=LoadEeprom
GOTO LESTART
:BSWITCH7
set switch=GroupRead
GOTO GROUP
:BSWITCH6
set switch=GetSKC
GOTO SYNTAX
:BSWITCH5
set switch=DumpRBxMem
GOTO START
:BSWITCH4
set switch=DumpMem
GOTO START
:BSWITCH3
set switch=DumpMarelliMem
GOTO START
:BSWITCH2
set switch=DumpEeprom
GOTO START
:BSWITCH1
set switch=DumpEdc15Eeprom
GOTO FILENAMEEDC
:SWITCH9
GOTO Q5
:SWITCH8
set switch=DelcoVWPremium5SafeCode
GOTO SYNTAX
:SWITCH7
set switch=ClearFaultCodes
GOTO SYNTAX
:SWITCH6
set switch=ClarionVWPremium4SafeCode
GOTO SYNTAX
:SWITCH5
set switch=BasicSetting
GOTO GROUP
:SWITCH4
set switch=AdaptationTest
GOTO CHANNEL
:SWITCH3
set switch=AdaptationSave
GOTO CHANNEL
:SWITCH2
set switch=AdaptationRead
GOTO CHANNEL
:SWITCH1
set switch=ActuatorTest
GOTO SYNTAX

:ARCHANNEL
set /p "channel=Enter a Channel number (0-99)"
GOTO ARLOGIN

:CHANNEL
set /p "channel=Enter a Channel number (0-99)"
GOTO CHANNELVALUE

:CHANNELVALUE
set /p "channelvalue=Enter a Channel Value (0-65535)"
GOTO LOGIN

:ARLOGIN
set /p "login=Enter an Optional login (0-65535)"
GOTO SYNTAX1

:LOGIN
set /p "login=Enter an Optional login (0-65535)"
GOTO SYNTAX2

:GROUP
set /P "group=Group number (0-255)(Group 0: Raw controller data)"
GOTO SYNTAX3

:LESTART
set /P "start=Start address in decimal (e.g. 0) or hex (e.g. $0)"
GOTO LEFILENAME

:START
set /P "start=Start address in decimal (e.g. 0) or hex (e.g. $0)"
GOTO LENGTH

:LENGTH
set /p "length=Number of bytes in decimal (e.g. 2048) or hex (e.g. $800)"
GOTO FILENAME

:LEFILENAME
set /p "filename=Enter a filename."
GOTO SYNTAX6

:FILENAME
set /p "filename=Enter a filename."
GOTO SYNTAX5

:FILENAMEEDC
set /p "filename=Enter a filename."
GOTO SYNTAX4

:ADDRESS
set /p "address=Address in decimal (e.g. 4361) or hex (e.g. $1109)"
GOTO SYNTAX7

:WEADDRESS
set /p "address=Address in decimal (e.g. 4361) or hex (e.g. $1109)"
GOTO ADDRESSVALUE

:ADDRESSVALUE
set /p "addressvalue=Value in decimal (e.g. 138) or hex (e.g. $8A)"
GOTO SYNTAX9

:CODING
set /p "coding=Software coding in decimal (e.g. 4361) or hex (e.g. $1109)"
GOTO WORKSHOP

:WORKSHOP
set /p "workshop=Workshop code in decimal (e.g. 4361) or hex (e.g. $1109)"
GOTO SYNTAX8

:SYNTAX1
ECHO kw1281test.exe %com% %baud% %controller% %switch% %channel% %login%
kw1281test.exe %com% %baud% %controller% %switch% %channel% %login%
pause

:SYNTAX2
ECHO kw1281test.exe %com% %baud% %controller% %switch% %channel% %channelvalue% %login%
kw1281test.exe %com% %baud% %controller% %switch% %channel% %channelvalue% %login%
pause

:SYNTAX3
ECHO kw1281test.exe %com% %baud% %controller% %switch% %group%
kw1281test.exe %com% %baud% %controller% %switch% %group%
pause

:SYNTAX4
ECHO kw1281test.exe %com% %baud% %controller% %switch% %filename%
kw1281test.exe %com% %baud% %controller% %switch% %filename%
pause

:SYNTAX5
ECHO kw1281test.exe %com% %baud% %controller% %switch% %start% %length% %filename%
kw1281test.exe %com% %baud% %controller% %switch% %start% %length% %filename%
pause

:SYNTAX6
ECHO kw1281test.exe %com% %baud% %controller% %switch% %start% %filename%
kw1281test.exe %com% %baud% %controller% %switch% %start% %filename%
pause

:SYNTAX7
ECHO kw1281test.exe %com% %baud% %controller% %switch% %address%
kw1281test.exe %com% %baud% %controller% %switch% %address%
pause

:SYNTAX8
ECHO kw1281test.exe %com% %baud% %controller% %switch% %coding% %workshop%
kw1281test.exe %com% %baud% %controller% %switch% %coding% %workshop%
pause

:SYNTAX9
ECHO kw1281test.exe %com% %baud% %controller% %switch% %address% %addressvalue%
kw1281test.exe %com% %baud% %controller% %switch% %address% %addressvalue%
pause

:SYNTAX
ECHO kw1281test.exe %com% %baud% %controller% %switch%
kw1281test.exe %com% %baud% %controller% %switch%
pause