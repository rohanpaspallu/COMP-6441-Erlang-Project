%% @author paspa
%% @doc @todo Add description to customer.


-module(customer).

-export([customer_data/0]).

customer_data() ->
	receive 
		{Sender, {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]}} ->

			
			if
				Random_customer_value > 50 ->
					Random_Amt2 = rand:uniform(50),
					io:format("~s having loan amount ~p requests a loan of ~p dollar(s) from ~s having funds ~p \n\n", [Random_customer_key,Random_customer_value,Random_Amt2,Random_bank_key, Random_bank_value]),

					Sender ! {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt2]},
					customer_data();
				
				true ->
					if
						Random_customer_value ==0 ->
							Customer_map4 = maps:remove(Random_customer_key, Customer_map),
							io:fwrite("nothing to do\n\n"),
%% 							Sender ! {[Cdata],[Bdata],[Customer_map4],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]},
							customer_data();
						true ->
							Random_Amt3 = rand:uniform(Random_customer_value),
							io:format("~s having loan amount ~p requests a loan of ~p dollar(s) from ~s having funds ~p \n\n", [Random_customer_key,Random_customer_value,Random_Amt3,Random_bank_key, Random_bank_value]),
							Sender ! {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt3]},
							customer_data()
					end
			end
					
					

	    after 2000 -> true
	end.
