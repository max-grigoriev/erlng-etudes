%%%-------------------------------------------------------------------
%%% @author max.grigoriev
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Dec 2014 20:52
%%%-------------------------------------------------------------------
-module(geometry).
-author("max.grigoriev").

%% API
-export([area/1, test/0, total/1, pyt/1, perms/1, condi/1, my_tuple_to_list/3, my_time/2, filter/2]).


area({rectangle, Widht, Height}) -> Widht * Height;
area({square, Side}) -> Side * Side.

test() ->
  12 = area({rectangle, 3, 4}),
  144 = area({square, 12}),
  test_worked.

total(L) ->
  totalInt(L, 0).

totalInt([H | T], Sum) -> totalInt(T, H + Sum);
totalInt([], Sum) -> Sum.


pyt(N) ->
  [{A, B, C} || A <- lists:seq(1, N),
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N, A * A + B * B =:= C * C].

perms([]) -> [[]];
perms(L) -> [[H | T] || H <- L, T <- perms(L--[H])].

condi(X) ->
  if
    X > 0 -> X * 2;
    true -> X
  end.

my_tuple_to_list(T, L, Pos) when Pos =< tuple_size(T) ->
  my_tuple_to_list(T, [element(Pos, T) | L], Pos + 1);
my_tuple_to_list(_, L, _) -> lists:reverse(L).



my_time(F, Args) ->
  {MegaSecs, Secs, MicroSecs} = erlang:now(),
  F(Args),
  {MegaSecs2, Secs2, MicroSecs2} = erlang:now(),
  {MegaSecs2 - MegaSecs, Secs2 - Secs, MicroSecs2 - MicroSecs}.

filter(F, L) ->
  [X || X <- L, F(X)].