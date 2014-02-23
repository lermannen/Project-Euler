-module (problem02).
-export ([evenFib/1]).

evenFib(Limit) -> 
	Fibs = fib(Limit),
	sumEven(Fibs).

sumEven([Head|[]]) when Head rem 2 =:= 0 -> 
	Head;
sumEven([_|[]]) -> 0;
sumEven([Head|Tail]) when Head rem 2 =:= 0 -> 
	Head + sumEven(Tail);
sumEven([_|Tail]) -> 
	sumEven(Tail).

fib(Limit) ->
	fib(Limit, 0, 1, [0]).

fib(Limit, Current, Next, Fibs) when Current < Limit ->
	fib(Limit, Next, Current + Next, [Next | Fibs]);

fib(Limit, Current, _, Fibs) when Current >= Limit -> 
	Fibs.