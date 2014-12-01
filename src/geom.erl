%%%-------------------------------------------------------------------
%%% @author max.grigoriev
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Nov 2014 21:24
%%%-------------------------------------------------------------------
-module(geom).
-author("max.grigoriev").

%% API
-export([area/3]).

%% @doc Calculates the area of a rectangle, given the
%% length and width. Returns the product
%% of its arguments.
%% @end
-spec(area(atom(), number(), number()) -> number()).

area(rectangle, Width, Height) -> Width * Height;
area(triangle, Width, Height) -> (Width * Height) / 2.0;
area(ellipse, Width, Height) -> Width * Height * math:pi();
area(_, _, _) -> 0.
