::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJHuR4FY1OidzRRC+HmK1CLw4w9225+OMo18IaMo2c47J07eBLtw7407lZ58u2XQUkcgDbA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJieEsaHWQ=
::ZQ05rAF9IBncCkqN+0xwdVsGHFTMbQs=
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIYIRBVXhHPP2O7CPUP4O3346qUtkwPQPcvOIzU1KCcL+xT61X0eZ8u125Tl8Vs
::dhA7uBVwLU+EWHuN+0w5K1t2WRCWOXna
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJHuR4FY1OidzRRCOPWmGJLwT5uHfxN/KpF8cWecod53Q5paHL+4azm7ROJ4k3XtIjcYHMDNRdRO5ezMcoGVDpHHLMt+Z0w==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
rem ####### Hikaru-chan by Bionic Butter #######

rem Pre-Explorer command section
rem --------------------------------------------
call %systemdrive%\Bionic\Hikaru\Hikarun.bat
rem --------------------------------------------

rem Hikaru section
:StartupBegin
reg import %systemdrive%\Bionic\Hikaru\ShellDefault.reg
start %windir%\Explorer.exe
timeout /t 3 /nobreak
for /f "tokens=3" %%a in ('reg query "HKCU\Software\Hikaru-chan" /v StartupSoundVariant  ^|findstr /ri "REG_DWORD"') do set "ssv=%%a"
if %ssv%==0x1 goto StartupSoundDefault
if %ssv%==0x2 goto StartupSoundOSSE
if %ssv%==0x3 goto StartupSoundOSTE
goto StartupSoundNone

:StartupSoundDefault
%systemdrive%\Bionic\Hikaru\FFPlay.exe -i %systemdrive%\Bionic\Hikaru\StartupSound1.mp3 -nodisp -hide_banner -autoexit 
goto StartupDone

:StartupSoundOSSE
%systemdrive%\Bionic\Hikaru\FFPlay.exe -i %systemdrive%\Bionic\Hikaru\StartupSound2.mp3 -nodisp -hide_banner -autoexit 
goto StartupDone

:StartupSoundOSTE
%systemdrive%\Bionic\Hikaru\FFPlay.exe -i %systemdrive%\Bionic\Hikaru\StartupSound3.mp3 -nodisp -hide_banner -autoexit 
timeout /t 3 /nobreak
goto StartupDone

:StartupSoundNone
timeout /t 7 /nobreak
goto StartupDone

:StartupDone
reg import %systemdrive%\Bionic\Hikaru\ShellHikaru.reg
exit