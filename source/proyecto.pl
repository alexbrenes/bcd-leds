combY(X, X):- length(X, 0), !.
combY([89|T], [78|CT]):- combY(T, CT).
combY([E|T], [E|CT]):- combY(T, CT).

fun([], [], []):-!.
fun([H|T],[H|T1], [89|X1]):- !, fun(T,T1, X1).
fun([89|T],[78|T1], [78|X1]):- !, fun(T,T1, X1).

numero(X, 0, Q):- combY("YYYYYYN", X), fun("YYYYYYN", X, Q).
numero(X, 1, Q):- combY("NYYNNNN", X), fun("NYYNNNN", X, Q).
numero(X, 2, Q):- combY("YYNYYNY", X), fun("YYNYYNY", X, Q).
numero(X, 3, Q):- combY("YYYYNNY", X), fun("YYYYNNY", X, Q).
numero(X, 4, Q):- combY("NYYNNYY", X), fun("NYYNNYY", X, Q).
numero(X, 5, Q):- combY("YNYYNYY", X), fun("YNYYNYY", X, Q).
numero(X, 6, Q):- combY("YNYYYYY", X), fun("YNYYYYY", X, Q).
numero(X, 7, Q):- combY("YYYNNNN", X), fun("YYYNNNN", X, Q).
numero(X, 8, Q):- combY("YYYYYYY", X), fun("YYYYYYY", X, Q).
numero(X, 9, Q):- combY("YYYYNYY", X), fun("YYYYNYY", X, Q).

subl(
[X0,X1,X2,X3,X4,X5,X6,
Y0,Y1,Y2,Y3,Y4,Y5,Y6,
Z0,Z1,Z2,Z3,Z4,Z5,Z6], X, Y, Z):- !, subl([X0,X1,X2,X3,X4,X5,X6],
                                          [Y0,Y1,Y2,Y3,Y4,Y5,Y6],
                                          [Z0,Z1,Z2,Z3,Z4,Z5,Z6],X,Y,Z).
subl(X,Y,Z,X,Y,Z):-!.

isValid(MA, DA, UA, MB, DB, UB):- NA is MA * 100 + DA * 10 + UA, NB is MB * 100 + DB * 10 + UB, 1 is NA - NB.

burnedChk([],[]):-!.
burnedChk([78|T1],[78|T2]):- !, burnedChk(T1,T2).
burnedChk([89|T1],[_|T2]):- burnedChk(T1,T2).

decremento([],_):- !.
decremento([A|[]], BndOut):- burnedChk(BndOut, A), !.
decremento([A|[B|T]], BndOut):- subl(A, MA, DA, UA), subl(B, MB, DB, UB),
						numero(MA, MA1, QMA), numero(DA, DA1, QDA), numero(UA, UA1, QUA),
						append(QMA, QDA, QMDA), append(QMDA, QUA, QA), burnedChk(BndOut, QA),
						fun(BndOut, QA, NQA),
						numero(MB, MB1, QMB), numero(DB, DB1, QDB), numero(UB, UB1, QUB),
						append(QMB, QDB, QMDB), append(QMDB, QUB, QB), burnedChk(NQA, QB),
						fun(NQA, QB, NQB),
						isValid(MA1, DA1, UA1, MB1, DB1, UB1),
						write(MA1), write(':'), write(DA1), write(UA1),write(' '),write(MB1), write(':'), write(DB1), write(UB1), write('\n'),
						decremento([B|T], NQB).

decremento([]):-!.
decremento([_|[]]):-!.
decremento(L):- decremento(L, "YYYYYYYYYYYYYYYYYYYYY").
