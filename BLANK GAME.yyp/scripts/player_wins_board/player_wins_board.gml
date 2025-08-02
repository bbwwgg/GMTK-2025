function player_wins_board(){
	
	//Transition to the next level or shop
	screen_transition(room_shop)
	
	if room == room_shop{
		
		//remove any commands in the slot
		for(var i = 0; i < array_length(command_list); i ++){
			if is_undefined(command_list[i]){continue}
			add_node_to_inventory(command_list[i])
			command_list[i] = undefined
		}
		
		switch_state(player_in_shop)
	}
}