%% @author paspa
%% @doc @todo Add description to money.


-module(money).

-export([main_function/0]).

main_function() ->
	
	{_,Cdata} = file:consult("customers.txt"),
%%  	io:format("~p~n", [Cdata]),
	
	{_,Bdata} = file:consult("banks.txt"),
%%  	io:format("~p~n", [Bdata]),
	
	Customer_map = maps:from_list(Cdata),
%% 	io:format("~p~n", [Customer_map]),
	
	Bank_map = maps:from_list(Bdata),
%% 	io:format("~p~n", [Bank_map]),
		
%% 	io:fwrite("~p ~p~n",[maps:keys(Customer_map), maps:values(Customer_map)]),
	
	
	
	
	customer_calling(Cdata,Bdata,Customer_map,Bank_map).


customer_calling(Cdata,Bdata,Customer_map,Bank_map) ->
	
%% 	io:fwrite("inside customer calling ~n"),
	Size_customer = maps:size(Customer_map),
	C_key = maps:keys(Customer_map),
	Random_customer_index = rand:uniform(Size_customer),
	Random_customer_key = lists:nth(Random_customer_index, C_key),
	Random_customer_value = maps:get(Random_customer_key,Customer_map),
%% 	io:fwrite("~p~n",[Random_customer_key]),
%% 	io:fwrite("~p ~p~n",[Random_customer_key,maps:get(Random_customer_key,Customer_map)]),
	
	
	Size_bank = maps:size(Bank_map),
	B_key = maps:keys(Bank_map),
	Random_bank_Index = rand:uniform(Size_bank),
	Random_bank_key = lists:nth(Random_bank_Index, B_key),
	Random_bank_value = maps:get(Random_bank_key,Bank_map),
%% 	io:fwrite("~p~n",[Random_bank_key]),
%% 	io:fwrite("~p ~p~n",[Random_bank_key,maps:get(Random_bank_key,Bank_map)]),
	
	Random_Amt = rand:uniform(50),	
	
	lists:foreach(fun(Key)->
						  #{Key := Val} = Customer_map,
						  Pid  = spawn(customer, customer_data, []),
						  Pid ! {self(), {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]}},
						  get_feedback()
				  end, C_key).


get_feedback() ->
	receive
		{[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]} -> 

%%  			io:format("~s having loan amount ~p requests a loan of ~p dollar(s) from ~s having funds ~p \n\n", [Random_customer_key,Random_customer_value,Random_Amt,Random_bank_key, Random_bank_value]),


			
			
			
			bank_calling(Cdata,Bdata,Customer_map,Bank_map,Size_customer,Size_bank,C_key,B_key,Random_customer_index,Random_bank_Index,Random_customer_key,Random_bank_key,Random_customer_value,Random_bank_value,Random_Amt)
	after 2000 -> true

	end.



bank_calling(Cdata,Bdata,Customer_map,Bank_map,Size_customer,Size_bank,C_key,B_key,Random_customer_index,Random_bank_Index,Random_customer_key,Random_bank_key,Random_customer_value,Random_bank_value,Random_Amt) ->
	
	
%% 	io:fwrite("inside bank calling ~n"),
	
	
%%  	io:format("~s having loan amount ~p requests a loan of ~p dollar(s) from ~s having funds ~p \n\n", [Random_customer_key,Random_customer_value,Random_Amt,Random_bank_key, Random_bank_value]),

	
	lists:foreach(fun(Key)->
						  #{Key := Val} = Bank_map,
						  Bid  = spawn(bank, bank_data, []),
						  Bid ! {self(), {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]}},
						  get_bank_feedback()
				  end, B_key).



get_bank_feedback() ->
	receive
		{[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]} ->
			
%% 			io:fwrite("~s having funds ~p approves a loan of ~p dollars from ~s remaining balance ~p~n",[Random_bank_key, Random_bank_value, Random_Amt, Random_customer_key, Random_customer_value]),
			
			customer_calling(Cdata, Bdata, Customer_map, Bank_map)
			
	after 2000 -> true

	end.


