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

set "player=1"


:gameloop
	echo.
	echo.
	echo.
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

	goto :checkWin
	:afterCheckWin	
	
	goto :userInput
	:afterUserInput

	::echo r:%row% c:%col%
	
	if %player% == 1 ( set "img=O")
	if %player% == 2 ( set "img=X")
	
	if %row% == 1 (
		if %col% == 1 ( set "r1c1=%img%")
		if %col% == 2 ( set "r1c2=%img%")
		if %col% == 3 ( set "r1c3=%img%")
	)
	if %row% == 2 (
		if %col% == 1 ( set "r2c1=%img%")
		if %col% == 2 ( set "r2c2=%img%")
		if %col% == 3 ( set "r2c3=%img%")
	)
	if %row% == 3 (
		if %col% == 1 ( set "r3c1=%img%")
		if %col% == 2 ( set "r3c2=%img%")
		if %col% == 3 ( set "r3c3=%img%")
	)

	goto :switchPlayer
	:afterSwitchPlayer

	::pause
	cls
	goto :gameloop







:checkWin
	set "win=none"
	::check rows
	if not %r1c1% == 0 (
		if %r1c1% == %r1c2% (
			if %r1c2% == %r1c3% ( set "win=%r1c1%" )
		)
	)
	if not %r2c1% == 0 (
		if %r2c1% == %r2c2% (
			if %r2c2% == %r2c3% ( set "win=%r2c1%" )
		)
	)
	if not %r3c1% == 0 (
		if %r3c1% == %r3c2% (
			if %r3c2% == %r3c3% ( set "win=%r3c1%" )
		)
	)
	::check cols
	if not %r1c1% == 0 (
		if %r1c1% == %r2c1% (
			if %r2c1% == %r3c1% ( set "win=%r1c1%" )
		)
	)
	if not %r1c2% == 0 (
		if %r1c2% == %r2c2% (
			if %r2c2% == %r3c2% ( set "win=%r1c2%" )
		)
	)
	if not %r1c3% == 0 (
		if %r1c3% == %r2c3% (
			if %r2c3% == %r3c3% ( set "win=%r1c3%" )
		)
	)
	::check diagonals
	if not %r1c1% == 0 (
		if %r1c1% == %r2c2% (
			if %r2c2% == %r3c3% ( set "win=%r1c1%" )
		)
	)
	if not %r1c3% == 0 (
		if %r1c3% == %r2c2% (
			if %r2c2% == %r3c1% ( set "win=%r1c3%" )
		)
	)
	if %win% == O (
		echo Player 1 wins
		goto :endgame
	) else if %win% == X (
		echo Player 2 wins
		goto :endgame
	)
	goto :afterCheckWin


:userInput
	echo Player %player%
:selectRow
	set "rowSelected=false"
	set /p row=Please enter row: 
	if %row% == 1 ( set "rowSelected=true")
	if %row% == 2 ( set "rowSelected=true")
	if %row% == 3 ( set "rowSelected=true")
	if not %rowSelected% == true (
		goto :selectRow
	)
	goto :selectCol


:selectCol
	set "colSelected=false"
	set /p col=Please enter col: 
	if %col% == 1 ( set "colSelected=true")
	if %col% == 2 ( set "colSelected=true")
	if %col% == 3 ( set "colSelected=true")
	if %col% == b ( goto :selectRow )
	if not %colSelected% == true (
		goto :selectCol
	)
	goto :checkInput


:switchPlayer
	if %player% == 1 ( set "player=2" 
	) else ( set "player=1" )
	goto :afterSwitchPlayer


:checkInput
	set "inputFailed=false"
	if %row% == 1 (
		if %col% == 1 (
			if not %r1c1% == 0 ( set "inputFailed=true" )
		) else if %col% == 2 (
			if not %r1c2% == 0 ( set "inputFailed=true" )
		) else (
			if not %r1c3% == 0 ( set "inputFailed=true" )
		)
	) else if %row% == 2 (
		if %col% == 1 (
			if not %r2c1% == 0 ( set "inputFailed=true" )
		) else if %col% == 2 (
			if not %r2c2% == 0 ( set "inputFailed=true" )
		) else (
			if not %r2c3% == 0 ( set "inputFailed=true" )
		)
	) else (
		if %col% == 1 (
			if not %r3c1% == 0 ( set "inputFailed=true" )
		) else if %col% == 2 (
			if not %r3c2% == 0 ( set "inputFailed=true" )
		) else (
			if not %r3c3% == 0 ( set "inputFailed=true" )
		)
	)
	if %inputFailed% == true (
		echo.
		echo Please re-enter move.
		goto :userInput
	)
	goto :afterUserInput




:endgame
pause
pause

