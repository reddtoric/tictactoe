@echo off
echo test
echo test
echo test

set x[0][0]=a
set x[0][1]=b
set x[0][2]=c

set x[1][0]=a0
set x[1][1]=a1
set x[1][2]=a2

setlocal EnableDelayedExpansion
set /A i=0
set /A k=0
set /A j=1
:loop2
	if %i%==2 ( if %k%==0 ( goto :afterloop2 ))
	::echo x[!i!][!k!] = !x[%i%][%k%]!
	::call set !%x[%%i][%%k]%!=%j%
	set x[!i!][!k!]=%j%
	echo x[!i!][!k!] = !x[%i%][%k%]!
	set /A j=j+1
	set /A k=k+1
	if %k%==3 (
		set /A k=0
		set /A i=i+1
		goto :loop2
	) else ( goto :loop2 )

:afterloop2

echo %x[0][0]%
echo %x[0][1]%
echo %x[0][2]%
echo %x[1][0]%
echo %x[1][1]%
echo %x[1][2]%

echo.
echo "test: "

setlocal EnableDelayedExpansion
set /A i=0
set /A k=0
:loop
	if %i%==2 ( if %k%==0 ( goto :end ))
	echo x[!i!][!k!] = !x[%i%][%k%]!
	set /A k=k+1
	if %k%==3 (
		set /A k=0
		set /A i=i+1
		goto :loop
	) else ( goto :loop )


:end
pause
exit /b 0
