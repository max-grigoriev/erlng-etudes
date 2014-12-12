%%%-------------------------------------------------------------------
%%% @author max.grigoriev
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Dec 2014 00:12
%%%-------------------------------------------------------------------
-module(afile_client).
-author("max.grigoriev").

%% API
-export([ls/1, get_file/2, put_file/2]).


ls(Server) ->
  Server ! {self(), list_dir},
  receive
    {Server, FileList} -> FileList
  end.

get_file(Server, File) ->
  Server ! {self(), {get_file, File}},
  receive
    {Server, Content} -> Content
  end.
put_file(Server, File) ->
  {ok, Content} = file:read_file(File),
  Server ! {self(), {put_file, filename:basename(File), Content}},
  receive
    {Server, Result} -> Result
  end.