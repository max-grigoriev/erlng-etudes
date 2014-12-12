%%%-------------------------------------------------------------------
%%% @author max.grigoriev
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Dec 2014 23:56
%%%-------------------------------------------------------------------
-module(afile_server).
-author("max.grigoriev").

%% API
-export([start/1, loop/1]).


start(Dir) ->
  spawn(afile_server, loop, [Dir]).

loop(Dir) ->
  receive
    {Client, list_dir} ->
      Client ! {self(), file:list_dir(Dir)};
    {Client, {get_file, File}} ->
      Full = filename:join(Dir, File),
      Client ! {self(), file:read_file(Full)};
    {Client, {put_file, FileName, File}} ->
      Full = filename:join(Dir, FileName),
      Client ! {self(), file:write_file(Full, File)};
    {Client, _} ->
      Client ! {self(), unknown_command}
  end,
  loop(Dir).