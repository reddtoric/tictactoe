@ECHO OFF
set "gameover=false"

::    rc
set "r1c1=0"
set "r1c2=0"
set "r1c3=0"

set "r2c1=0"
set "r2c2=0"
set "r2c3=0"

set "r3c1=0"
set "r3c2=0"
set "r3c3=0"

set "row=x"
set "col=x"

set "player=0"


:gameloop
	echo  Tic Tac Toe Game
	echo.
	echo     1  2  3
	
	set "strRow1= 1 "
	set "strRow2= 2 "
	set "strRow3= 3 "

	if not %r1c1% == 0 ( set "strRow1=%strRow1%[%r1c1%]"
	) else ( set "strRow1=%strRow1%[ ]")
	
	if not %r1c2% == 0 ( set "strRow1=%strRow1%[%r1c2%]"
	) else ( set "strRow1=%strRow1%[ ]")
	
	if not %r1c3% == 0 ( set "strRow1=%strRow1%[%r1c3%]"
	) else ( set "strRow1=%strRow1%[ ]")



	if not %r2c1% == 0 ( set "strRow2=%strRow2%[%r2c1%]"
	) else ( set "strRow2=%strRow2%[ ]")
	
	if not %r2c2% == 0 ( set "strRow2=%strRow2%[%r2c2%]"
	) else ( set "strRow2=%strRow2%[ ]")
	
	if not %r2c3% == 0 ( set "strRow2=%strRow2%[%r2c3%]"
	) else ( set "strRow2=%strRow2%[ ]")



	if not %r3c1% == 0 ( set "strRow3=%strRow3%[%r3c1%]"
	) else ( set "strRow3=%strRow3%[ ]")
	
	if not %r3c2% == 0 ( set "strRow3=%strRow3%[%r3c2%]"
	) else ( set "strRow3=%strRow3%[ ]")
	
	if not %r3c3% == 0 ( set "strRow3=%strRow3%[%r3c3%]"
	) else ( set "strRow3=%strRow3%[ ]")
	
	
	echo %strRow1%
	echo %strRow2%
	echo %strRow3%
	echo.

	goto :userInput
	:afterUserInput

	::echo r:%row% c:%col%
	
	if %player% == 1 ( set "player=X")
	if %player% == 2 ( set "player=O")
	
	if %row% == 1 (
		if %col% == 1 ( set "r1c1=%player%")
		if %col% == 2 ( set "r1c2=%player%")
		if %col% == 3 ( set "r1c3=%player%")
	)
	if %row% == 2 (
		if %col% == 1 ( set "r2c1=%player%")
		if %col% == 2 ( set "r2c2=%player%")
		if %col% == 3 ( set "r2c3=%player%")
	)
	if %row% == 3 (
		if %col% == 1 ( set "r3c1=%player%")
		if %col% == 2 ( set "r3c2=%player%")
		if %col% == 3 ( set "r3c3=%player%")
	)


	pause
	goto :gameloop



:userInput
:selectPlayer
set /p player=Player 1 or 2:
set "playerSelected=false"
if %player% == 1 ( set "playerSelected=true")
if %player% == 2 ( set "playerSelected=true")
if %playerSelected% == true ( 
	goto :selectRow
) else (
	goto :selectPlayer
)


:selectRow
set /p row=Please enter row: 
set "rowSelected=false"
if %row% == 1 ( set "rowSelected=true")
if %row% == 2 ( set "rowSelected=true")
if %row% == 3 ( set "rowSelected=true")
if %rowSelected% == true (
	goto :selectCol
) else (
	goto :selectRow
)


:selectCol
set /p col=Please enter col: 
set "colSelected=false"
if %col% == 1 ( set "colSelected=true")
if %col% == 2 ( set "colSelected=true")
if %col% == 3 ( set "colSelected=true")
if %colSelected% == true (
	goto :afterUserInput
) else (
	goto :selectCol
)





