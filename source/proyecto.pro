combY(X, X):- length(X, 0), !.
combY([89|T], [78|CT]):- combY(T, CT).
combY([E|T], [E|CT]):- combY(T, CT).

numero(X, 0):- combY("YYYYYYN", X).
numero(X, 1):- combY("YYNYYNY", X).
numero(X, 2):- combY("YYYYNNY", X).
numero(X, 3):- combY("YYYYNNY", X).
numero(X, 4):- combY("NYYNNYY", X).
numero(X, 5):- combY("YNYYNYY", X).
numero(X, 6):- combY("YNYYYYY", X).
numero(X, 7):- combY("YYYNNNN", X).
numero(X, 8):- combY("YYYYYYY", X).
numero(X, 9):- combY("YYYYNYY", X).

subl(
[X0,X1,X2,X3,X4,X5,X6,
Y0,Y1,Y2,Y3,Y4,Y5,Y6,
Z0,Z1,Z2,Z3,Z4,Z5,Z6], X, Y, Z):- !, subl([X0,X1,X2,X3,X4,X5,X6],
										  [Y0,Y1,Y2,Y3,Y4,Y5,Y6],
										  [Z0,Z1,Z2,Z3,Z4,Z5,Z6],X,Y,Z).
subl(X,Y,Z,X,Y,Z):-!.

printL([A|[]]):- write(A).
printL([A|T]):- write(A), write(", "), printL(T).

isValid(MA, 0, 0, MB, 5, 9):- MB is MA - 1, !.
isValid(MA, DA, 0, MA, DB, 9):- DB is DA - 1, !.
isValid(MA, DA, UA, MA, DA, UB):- UB is UA - 1, !.

decremento([]):-!.
decremento([_|[]]):-!.
decremento([A|[B|T]]):- subl(A, MA, DA, UA), subl(B, MB, DB, UB),
						numero(MA, MA1), numero(DA, DA1), numero(UA, UA1),
						numero(MB, MB1), numero(DB, DB1), numero(UB, UB1),
						isValid(MA1, DA1, UA1, MB1, DB1, UB1), !,
						decremento([B|T]).
						