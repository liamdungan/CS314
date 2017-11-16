%Liam Dungan -- CS 314 -- HW6 -- Prolog


% ---- 1 ----
partof(joe , toy_dept).

reports(X , Y) :- partof(X , Z), head(Y , Z).

head(sam , toy_dept).

lower_salary(X , Y) :- reports(X , Y).

lower_salary(joe , sam).




% ---- 2 ----
%	fib(N,F) returns true if F is the Nth number in the fibanacci sequence.
fib(0 , 0).
fib(1 , 1).
fib(N , F) :- 
			N > 1,
			A is N - 1, fib(A , Y1),
			B is N - 2, fib(B , Y2),
			F is Y1 + Y2.



% ---- 3 ----
%	double(A, B) returns true if, for lists A and B, B has the same elements as A, but repeated.
%	e.g. double([dog, cat], [dog, dog, cat, cat]) is true
double([],[]).
double([H | T], [H , H | Z]) :-
			double(T , Z).



% ---- 4 ----
% 	without0(L1, L2) returns true if L2 is a copy of L1 with all 0s removed. 
%	e.g., without0([4, 0, 5, 6, 0], [4, 5, 6]) is true and without0([4, 0, 5], L) binds L to [4, 5]
remove0([], 0, []).
remove0([0 | T] , 0 , L) :- 
			remove0(T , 0 , L).
remove0([H | T] , 0 , [H | L]) :- 
			remove0(T, 0, L).

without0([], []).
without0(A, B) :- 
			remove0(A , 0 , L),
			L = B.





% ---- Additional practice NOT from HW ----

%	last(A, B) returns true if B is the last element of list A
%	e.g. last([1,2,3], 3). is true
last([A], A).
last([_|T], A):- last(T, A).



%	member(A, B) returns true if A is a member of list B
%	e.g. member(2, [1,2,3]). is true
member(A, [A | _]).
member(A, [_ | T]):- member(A, T).



%	onemore(A, B) returns true if each element of list B is one more than list A
%	e.g. onemore([1,2],[2,3]). is true
onemore([], []).
onemore([H1 | T1], [H2 | T2]):-
			H2 is H1 + 1,
			onemore(T1, T2).



%	replace_all(L1, A, B, L2) replaces all instances of A in list L1 with B
% 	e.g replace_all([1,2,3,2], 2, 8, [1,8,3,8]). is true
replace_all([], _, _, []).
replace_all([A | T], A, B, [B | L]):-
			replace_all(T, A, B, L).
replace_all([H | T], A, B, [H | L]):-
			replace_all(T, A, B, L).



%	sumlist(L, N) returns true if N is the sum of all elements in the list of numbers L
%	e.g. sumlist([1,2,3], 6). is true
sumlist([], 0).
sumlist([H | T], N):-
			sumlist(T, N1),
			N is H + N1.


