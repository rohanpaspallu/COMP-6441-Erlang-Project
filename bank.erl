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
					Random_bank_value2 = Random_bank_value - Random_Amt,
					
					if
						customer_value2 ==0 ->
							Customer_map5 = maps:remove(Random_customer_key, Customer_map),
							Bank_map2 = maps:remove(Random_bank_key, Bank_map),
							Bank_map3 = maps:put(Random_bank_key, Random_bank_value2, Bank_map2),	
							Send ! {[Cdata],[Bdata],[Customer_map5],[Bank_map3],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]},
							bank_data();
						true ->
							Customer_map2 = maps:remove(Random_customer_key, Customer_map),
							Customer_map3 = maps:put(Random_customer_key, Random_customer_value2, Customer_map2),
							Bank_map5 = maps:remove(Random_bank_key, Bank_map),
							Bank_map6 = maps:put(Random_bank_key, Random_bank_value2, Bank_map5),
							io:fwrite("~s having funds ~p approves a loan of ~p dollars from ~s remaining balance ~p ~n",[Random_bank_key, Random_bank_value, Random_Amt, Random_customer_key, Random_customer_value]),
							Send ! {[Cdata],[Bdata],[Customer_map3],[Bank_map6],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]},
							bank_data()
					end;
							
							
							
					
				true ->
					if
						Random_bank_value ==0 ->
							Bank_map4 = maps:remove(Random_bank_key, Bank_map),
							Send ! {[Cdata],[Bdata],[Customer_map],[Bank_map4],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]},
							bank_data();
						true ->
							io:fwrite("~s having funds ~p denies a loan of ~p dollars from ~s remaining balance ~p~n",[Random_bank_key, Random_bank_value, Random_Amt, Random_customer_key, Random_customer_value]),
							Send ! {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]},
							bank_data()
					end
			end

	    after 2000 -> true
	end.
