-module(problem01).
-export([divisibleSum/1]).

% Summera alla tal som är delbara med 3 och 5

divisibleSum(N) when N < 3 -> 0;
divisibleSum(N) when N rem 3 =:= 0; N rem 5 =:= 0 -> N+divisibleSum(N-1);
divisibleSum(N) -> divisibleSum(N-1).