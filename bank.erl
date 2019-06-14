%% @author paspa
%% @doc @todo Add description to bank.


-module(bank).

-export([bank_data/0]).
-import(maps,[update/3]).

bank_data() -> 

	receive 
		{Send, {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]}} ->
			
			
			
			if
				Random_bank_value > Random_Amt ->
					
					Random_customer_value2 = Random_customer_value - Random_Amt,
%% 					Customer_map2 = maps:update(Random_customer_index, Random_customer_value2, Customer_map),
					Random_bank_value2 = Random_bank_value - Random_Amt,
%% 					Bank_map2 = maps:update(Random_bank_Index, Random_bank_value2, Bank_map),

					Customer_map2 = maps:remove(Random_customer_key, Customer_map),
					Customer_map3 = maps:put(Random_customer_key, Random_customer_value2, Customer_map2),
					
					
					Bank_map2 = maps:remove(Random_bank_key, Bank_map),
					Bank_map3 = maps:put(Random_bank_key, Random_bank_value2, Bank_map2),
					
					
%% 					io:fwrite("Customer_map3 = ~p~n", [Customer_map3]),
%% 					io:fwrite("Bank_map3 = ~p~n", [Bank_map3]),
					
					io:fwrite("~s having funds ~p approves a loan of ~p dollars from ~s remaining balance ~p ~n",[Random_bank_key, Random_bank_value, Random_Amt, Random_customer_key, Random_customer_value]),
					Send ! {[Cdata],[Bdata],[Customer_map3],[Bank_map3],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]},
					bank_data();
				true ->
					io:fwrite("~s having funds ~p denies a loan of ~p dollars from ~s remaining balance ~p~n",[Random_bank_key, Random_bank_value, Random_Amt, Random_customer_key, Random_customer_value]),
					Send ! {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]},
					bank_data()
			end
			
			
			
%% 			Send ! {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]},
%%  			io:fwrite("recieved in bank  pattern from Sender: ~w\n\n", [Send]),
%% 			bank_data()
	    after 2000 -> true
	end.