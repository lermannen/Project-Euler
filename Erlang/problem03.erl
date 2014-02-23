-module(problem03).
-export([largestPrimeFactor/1, primes/1, lPF/1]).

% The prime factors of 13195 are 5, 7, 13 and 29.
% What is the largest prime factor of the number 600851475143 ?

lPF(N) -> lPF(N, 2).
lPF(N, Factor) ->
	if
		Factor > N div 2 ->
			N;
		true -> 
			if
				N rem Factor =:= 0 ->
					lPF(N div Factor, Factor);
			 true -> lPF(N, Factor+1)
			end
	end.

largestPrimeFactor(N) -> 
	List = primes(erlang:round(math:sqrt(N))), 
	largestPrimeFactor(N, List).
largestPrimeFactor(N, [Head|Tail]) -> 
	M = if N rem Head =:= 0 -> N div Head;
		N rem Head /= 0 -> N
	end,
	largestPrimeFactor(M, Tail);
largestPrimeFactor(N, []) -> N.


% ta bort alla tal som är jämt delbara med talet
primes([]) -> [];
primes([Head|Tail]) -> 
	List = lists:filter(fun(N) -> N rem Head /= 0 end, Tail),
	[Head|primes(List)];
primes(N) -> primes(lists:seq(2, N)). % generera alla tal