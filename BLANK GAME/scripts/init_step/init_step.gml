function init_step(){
	end_priority_step = false
	conflict_squares = []
	falling_conflicts = []
	
	//Get the current step commands
	var _step_commands =  step_command[current_turn]
	if is_undefined(_step_commands){return}

	//Find a priority that isnt empty
	current_priority = clamp(current_priority,0,STEP_PRIOTITY.COUNT-1)
	
	while is_undefined(_step_commands[current_priority]){
		current_priority ++
		
		//If there are none left, end the turn
		if current_priority >= STEP_PRIOTITY.COUNT{
			current_turn ++
			if current_turn = current_turn_length{
				//End the turn
				switch_state(player_on_board)
				return
			}
			current_priority = 0
			
			_step_commands =  step_command[current_turn]
			if is_undefined(_step_commands){return}
			
			return
		}
	}
	
	switch (current_priority){


		
		case STEP_PRIOTITY.PLAYER:
		//Move commands should happen before the turn starts
		case STEP_PRIOTITY.MOVE:
		
			moved = false
		break
	
	}

	//set time to 0 for the turn
	time = 0

}