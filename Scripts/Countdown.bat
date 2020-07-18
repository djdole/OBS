@echo off
rem The ideal way to do this would be to actually use the system time

setlocal EnableDelayedExpansion

if ["%~1"] == [""] (
  set /a CountdownSec=300
) else (
  set /a CountdownSec=%~1

)

set out_file=Countdown.txt
set prepend=
set append=

:loop
timeout /t 1 /nobreak > nul
set /a Min=(%CountdownSec% / 60)
set MinStr=%Min%:
rem if ["%MinStr%"] == ["0:"] set "MinStr="
set /a Sec = (%CountdownSec% - (%Min% * 60))
set SecStr=%Sec%
if ["%MinStr%"] NEQ [""] (
  if %Sec% LSS 10 (
    set "SecStr=0%SecStr%"
  )
) else (
  if %Sec% LSS 10 (
    set "SecStr=0%SecStr%"
  )
)
echo|set /p="%prepend%%MinStr%%SecStr%%append%" > "%out_file%"
set /a CountdownSec -= 1
if %CountdownSec% GTR -1 goto loop
