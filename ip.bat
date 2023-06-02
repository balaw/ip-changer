@ECHO off
cls

:start
ECHO.
ECHO 1. Change to "IP_01"
ECHO 2. Change to "IP_02"
ECHO 3. Change to "IP_03"
ECHO 4. Obtain an IP address automatically
ECHO 5. Exit

set choice=
set /p choice=Enter your choice :
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto con2
if '%choice%'=='3' goto con3
if '%choice%'=='4' goto autosearch
if '%choice%'=='5' goto end
ECHO "%choice%" is not valid, try again
ECHO.

goto start
:con1
ECHO Connecting Connection 1
netsh interface ipv4 set address name="Ethernet" static "IP_01"
netsh interface ip set dns "Ethernet" static "your_dns"
goto end

:con2
ECHO Connecting Connection 2
netsh interface ipv4 set address name="Ethernet" static "IP_02"
netsh interface ip set dns "Ethernet" static "your_dns"
goto end

:con3
ECHO Connecting Connection 3
netsh interface ipv4 set address name="Ethernet" static "IP_03"
netsh interface ip set dns "Ethernet" static "your_dns"
goto end

:autosearch
ECHO obtaining auto IP
netsh interface ipv4 set address name="Ethernet" source=dhcp
netsh interface ip set dns "Ethernet" source=dhcp
goto end
