%% @author Marc Worrell <marc@worrell.nl>
%% @copyright 2010 Marc Worrell
%% @doc 'capfirst' filter, capitalize the first character

%% Copyright 2010 Marc Worrell
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(filter_capfirst).
-export([capfirst/2]).


capfirst(undefined, _Context) ->
    undefined;
capfirst([H|T], _Context) when H >= $a andalso H =< $z ->
    [H + $A - $a | T];
capfirst(<<Byte:8/integer, Binary/binary>>, _Context) when Byte >= $a andalso Byte =< $z ->
    [<<(Byte + $A - $a)>>, Binary];
capfirst({trans, _} = In, Context) ->
    capfirst(erlydtl_runtime:to_list(In, Context), Context).
