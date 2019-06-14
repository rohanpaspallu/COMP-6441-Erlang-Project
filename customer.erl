%% @author paspa
%% @doc @todo Add description to customer.


-module(customer).

-export([customer_data/0]).

customer_data() ->
	receive 
		{Sender, {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt]}} ->
			
%% 			Random_Amt2 = rand:uniform(50),
%% 			io:format("~p~n", [Random_Amt2]),
%% 			Sender ! {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt2]},
%% 			io:fwrite("recieved in baz2/cat  pattern from Sender: ~w\n\n", [Sender]),

			
			if
				Random_customer_value > 50 ->
					Random_Amt2 = rand:uniform(50),
					io:format("~s having loan amount ~p requests a loan of ~p dollar(s) from ~s having funds ~p \n\n", [Random_customer_key,Random_customer_value,Random_Amt,Random_bank_key, Random_bank_value]),

					Sender ! {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt2]},
					customer_data();
				
				true ->
					if
						Random_customer_value ==0 ->
							io:fwrite("nothing to do\n\n");
						true ->
							Random_Amt3 = rand:uniform(Random_customer_value),
							io:format("~s having loan amount ~p requests a loan of ~p dollar(s) from ~s having funds ~p \n\n", [Random_customer_key,Random_customer_value,Random_Amt,Random_bank_key, Random_bank_value]),
							Sender ! {[Cdata],[Bdata],[Customer_map],[Bank_map],[Size_customer],[Size_bank],[C_key],[B_key],[Random_customer_index],[Random_bank_Index],[Random_customer_key],[Random_bank_key],[Random_customer_value],[Random_bank_value],[Random_Amt3]},
							customer_data()
					end
			end
					
					
%% 			if
%% 				Current_Cust_Amt <50 ->
%% 					Random_Amt2 = rand:uniform(Current_Cust_Amt),
%% %% 					Current_Cust_Amt1 = Current_Cust_Amt - Random_Amt,
%% %% 					io:format("value less than 50  Current_Cust_Amt1 ~p~n", [Current_Cust_Amt1]),
%% %% 					io:format("Current_Cust_Amt ~p~n", [Current_Cust_Amt]),
%% 					io:format("Random_Amt2 ~p~n", [Random_Amt2]),
%% 					Sender ! {[Cdata],[Bdata],[Cust_Name_List],[Bank_Name_List], [Cust_Amount_List], [Bank_Amount_List], [Current_Cust_Amt], [Current_Bank_Amt], [Random_customer], [Random_bank], [Random_Amt2]},
%% 					io:fwrite("recieved in baz2/cat  pattern from Sender: ~w\n\n", [Sender]),
%% 					customer_data();
%% 				true ->
%% 					Random_Amt3 = rand:uniform(50),
%% %% 					Current_Cust_Amt2 = Current_Cust_Amt - Random_Amt,
%% %% 					io:format("value greater than 50  Current_Cust_Amt2 ~p~n", [Current_Cust_Amt2]),
%% %% 					io:format("Current_Cust_Amt ~p~n", [Current_Cust_Amt]),
%% 					io:format("Random_Amt3 ~p~n", [Random_Amt3]),
%% 					Sender ! {[Cdata],[Bdata],[Cust_Name_List],[Bank_Name_List], [Cust_Amount_List], [Bank_Amount_List], [Current_Cust_Amt], [Current_Bank_Amt], [Random_customer], [Random_bank],[Random_Amt3]},
%% 					io:fwrite("recieved in baz2/cat  pattern from Sender: ~w\n\n", [Sender]),
%% 					customer_data()
%% 			end
%% 			
			
			
%% 			customer_data()
	    after 2000 -> true
	end.
