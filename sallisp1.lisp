;#!/usr/bin/sbcl --script

(defvar str "hello ramesh")
;(write-line str)
;(print(random 7))
(defun dice1 () 
	;(write-line str)
	;(random 7)
	(random 7 (make-random-state t))
	;(print (random 7))
)
;(print (dice))
(dice1)
(print (random 7))
(defvar dicev 10)
(print dicev)
(loop
	(print dicev)
	(set 'dicev (- dicev 1))
	(when (< dicev 1) (return))
)
(set 'dicev 10)
(defvar ndice (make-array 10))
(loop
	;(print dicev)
	(set 'dicev (- dicev 1))
	(setf (aref ndice dicev) (* dicev 2))
	(print (aref ndice dicev))
	(when (< dicev 1) (return))
)
(defvar pos 0)
(defvar dicev1 0)
(loop
	(set 'dicev1 (+ dicev1 1))
	(set 'pos (+ (dice1) pos))
	(print pos)
	(when (> dicev1 20) (return))
)
(defvar turnsofdice 0)
(defvar turnsofgame 0)
(defvar turnsofdiceforagame 0)
(defvar numberofdiceturns 1000)
(defvar ladderStart '(8 19 21 28 36 43 50 54 61 62 66 ))
(defvar ladderEnd '( 26 38 82 53 57 77 91 88 99 96 87 ))
(defvar snakeStart '( 98 93 83 69 68 64 59 52 48 46 ))
(defvar snakeEnd '(13 37 22 33 2 24 18 11 9 15 ))
(defvar states (make-array 101))
(defvar ladderStart (make-array 11))
(defvar ladderEnd (make-array 11))
(defvar snakeStart (make-array 10))
(defvar snakeEnd (make-array 10))
(defvar ladderHit (make-array 12))
(defvar snakeHit (make-array 11))
(defvar lIndex (make-array 101))
(defvar sIndex (make-array 101))
(defun dice (p) 
	;(write-line str)
	;(random 7)
	(+ (random 6 (make-random-state t)) p 1)
	;(print (random 7))
)
(defun runGame()
	(set 'pos 1)
	;(print pos)
	(let ((id 1))
	(loop
		;(print id)
		;(if (eq id 101) (return))
		(setf (aref states id) 0)
		(setf (aref lIndex id) 0)
		(setf (aref sIndex id) 0)
		(if (< id 12) (setf (aref ladderHit id) 0))
		(if (< id 11) (setf (aref ladderHit id) 0))
		;(print (aref states id))
		(setf id (+ id 1))
		(if (eq id 101) (return))
	)
	;(print id)
	)
	(fillLadders)
	(fillSnakes)
	;fillLaddersrand();
	;fillSnakesrand();
	(loop
		(if (> turnsofdice numberofdiceturns) (return))
		(setf pos (dice pos))
		(TurnsofDice)
		;(print pos)
		(if (> pos 100) (numberofGames))
		;(SnakesLadders)
	)

)
(defun TurnsofDice()
	(set 'turnsofdice (+ turnsofdice 1))
	(set 'turnsofdiceforgame (+ turnsofdiceforagame 1))
)
(defun fillLadders()
	(let ((id 0)(ls)(le))
	(loop
		;(print id)
		;(if (> id 10) (return))
		(setf ls (nth id ladderStart))
		(setf le (nth id ladderEnd))
		;(if (> (aref lIndex ls) 0)
		(setf (aref states ls) le)
		;(setf (aref lIndex ls) (+ ls 1))
		;(print (aref states ls))
		(setf id (+ id 1))
		(if (eq id 11) (return))
	)
	;(print id)
	)
	
)
(defun fillSnakes()
	(let ((id 0)(ss)(se))
	(loop
		;(print id)
		;(if (> id 10) (return))
		(setf ss (nth id snakeStart))
		(setf se (nth id snakeEnd))
		;(if (> (aref lIndex ls) 0)
		(setf (aref states ss) se)
		;(setf (aref lIndex ls) (+ ls 1))
		;(print (aref states ls))
		(setf id (+ id 1))
		(if (eq id 10) (return))
	)
	;(print id)
	)
	
)
(defun numberofGames()
	(set 'pos (- pos 100))
	(set 'turnsofgame (+ turnsofgame 1))
	;turnsofgame++;
	;turnsasmoney = turnsasmoney*(((10000 - basispoint) / 10000) + (basispoint / (float64(turnsofdiceforagame) * 350)));
	;logmultiple();
	(set 'turnsofdiceforagame  0)
)

(runGame)
#|
const numberofboards = 101
const boardsize = 101
const numberofparts = 101

var pos int= 1;
var turnsofdice int= 0;
var turnsofgame int= 0
var turnsofdiceforagame int= 0;
var states[101]int;
var numberofdiceturns int= 100000;
var turnsasmoney float64 = 100;
var turnsasmoneytakeninx float64 = 0;
var gameturnmultiple float64 = 1;
var gametotalmultiple float64 = 1;
var interest float64 = 0.006;
var prefinterest float64 = 0.0045;
var basispoint float64 = 100;
var ladderStart[11]int;
var ladderEnd[11]int;
var snakeStart[10]int;
var snakeEnd[10]int;
var ladderHit [12]int;
var snakeHit[11]int;
var lIndex[101]int;
var sIndex[101]int;
var boardstates[101][101]int;
var boardlIndex[101][101]int;
var boardsIndex[101][101]int;
var boardladderHit[101][12]int;
var boardsnakeHit[101][11]int;
var boardpos[101]int;
var boardturnsofdiceforagame[101]int;
var boardturnsofgame[101]int;
var boardgameturnmultiple[101][31]float64;
var boardgametotalmultiple[101][31]float64;
var boardsnakesshuffled int = 0;
var boardladdersshuffled int = 0;
var commonboardgametotalmultipleleft[101]float64;
var commonboardgametotalmultipleadded[101]float64;
var commonboardgametotalmultipletakenin[101]float64;
var prefcommonboardgametotalmultipleleft[101][31]float64;
var prefcommonboardgametotalmultipleadded[101][31]float64;
var prefcommonboardgametotalmultipletakenin[101][31]float64;
var logprefgamewholemultiple float64 = 0;
var logprefwholemultipletaken float64 = 0;
var logprefwholemultipleadded float64 = 1;
var logprefwholemultipleleft float64 = 1;
var prefboardgametotalmultiple[numberofboards]float64;
|#
#|
func runGame(){
	for i:= 1; i<101; i++{
		states[i] = 0;
		lIndex[i] = 0;
		sIndex[i] = 0;
	}
	for i:= 1; i < 12; i++{ladderHit[i] = 0;}
	for i:= 1; i < 11; i++{snakeHit[i] = 0;}
	//getSnakesLadders(args);
	//System.out.println("turnsasmoneyatstart=" + turnsasmoney);
	//fillLadders();
	//fillSnakes();
	fillLaddersrand();
	fillSnakesrand();
	for turnsofdice<numberofdiceturns{
		pos = Dice(pos);
		TurnsofDice();
		if (pos>100){numberofGames();}
		pos = SnakesLadders();
	}
}
func TurnsofDice(){
	turnsofdice++;
	turnsofdiceforagame++;
}
func SnakesLadders()int{
	if (states[pos] != 0){
		if (lIndex[pos] != 0){ladderHit[lIndex[pos]]++;}
		if (sIndex[pos] != 0){snakeHit[sIndex[pos]]++;}
		//if(pos>states[pos])printf("snakehit %d",pos);
		//if(pos<states[pos])printf("ladderhit %d",pos);
		pos = states[pos];
	}
	return pos;
}
func fillLadders(){
	for i := 0; i<11; i++{
		//if (lIndex[ladderStart[i]] != 0)
		//{
		states[ladderStart[i]] = ladderEnd[i];
		lIndex[ladderStart[i]] = i + 1;
		//}
	}
}
func fillSnakes(){
	for i := 0; i<10; i++{
		//if (sIndex[snakeStart[i]] != 0)
		//{
		states[snakeStart[i]] = snakeEnd[i];
		sIndex[snakeStart[i]] = i + 1;
		//}
	}
}
func numberofGames(){
	pos = pos - 100;
	//System.out.println("turnsofgame="+turnsofgame);
	//System.out.println("position="+pos);
	turnsofgame++;
	//turnsasmoney = turnsasmoney*(((10000 - basispoint) / 10000) + (basispoint / (float64(turnsofdiceforagame) * 350)));
	logmultiple();
	turnsofdiceforagame = 0;
	//if(turnsofgame%35==0)numberofdiceturns=numberofdiceturns+100;
}
func printGameStats(){
	//fmt.Printf("turnsasmoney= %f \n", turnsasmoney);
	fmt.Printf(" gametotalmultiple %f \n", gametotalmultiple);
}
func logmultiple(){
	gameturnmultiple = ((10000 - basispoint) / 10000)*(turnsasmoneytakeninx + 1)- turnsasmoneytakeninx*(1 + interest)+ (basispoint / (float64(turnsofdiceforagame) * 350))*(turnsasmoneytakeninx + 1);
	//gameturnmultiple = ((10000 - basispoint) / 10000) + ((basispoint / (turnsofdiceforagame * 350)));
	//printf(" gameturnmultiple %f ", gameturnmultiple);
	gametotalmultiple = gametotalmultiple * gameturnmultiple;
	gameturnmultiple = 1;
	//loggameturnmultiple = log(((10000 - basispoint) / 10000) + ((basispoint / (turnsofdiceforagame * 350))));
	//printf(" loggameturnmultiple %e ", loggameturnmultiple);
	//loggametotalmultiple = loggametotalmultiple + loggameturnmultiple;
	//loggameturnmultiple = 0;
	//printf(" loggametotalmultiple %e ", loggametotalmultiple);
}
|#
;(write-line (dice 5))
;(write-line "hello ramesh")