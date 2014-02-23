-module(problem04).
-export([solve/0]).

solve() ->
	palindrome(999, 999, 0).

palindrome(100, 100, X) ->
	X;
palindrome(N, M, Max) ->
	palindrome(newN(N, M), newM(M), newMax(N*M, Max)).

newMax(N, OldMax) ->
	case isPalindrome(N) andalso N > OldMax of
		true -> N;
		false -> OldMax
	end.

newN(N, M) ->
	case	N > 100 andalso M == 100 of
				true -> N-1;
				false -> N
	end.

newM(M) ->
	case	M > 100 of
				true -> M-1;
				false -> 999
	end.

isPalindrome(N) -> 
	isEqual(integer_to_list(N), lists:reverse(integer_to_list(N))).

isEqual([], []) ->
	true;
isEqual([Head|X], [Head|X2]) ->
	isEqual(X, X2);
isEqual(_, _) ->
	false.