%%%-------------------------------------------------------------------
%%% @author max.grigoriev
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Dec 2014 16:47
%%%-------------------------------------------------------------------
-module(record).
-author("max.grigoriev").

%% API
-export([clear_status/1, check_map/1]).

-include("records.hrl").

clear_status(#todo{who = W, status = S} = R) when is_record(R, todo) ->
  Henry8 = #{class => king, born => 1491},
  #{born := B} = Henry8,
  B,
  R#todo{status = done}.

check_map(#{a:=V} = M) when V > 10 -> one;
check_map(M) -> other.