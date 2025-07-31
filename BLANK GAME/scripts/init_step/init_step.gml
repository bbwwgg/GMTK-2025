function init_step(){

	conflict_squares = []
	falling_conflicts = []
	
	var _step_commands =  step_command[current_turn]
	if is_undefined(_step_commands){return}

	if current_priority >= STEP_PRIOTITY.COUNT{
		current_turn ++
		if current_turn = current_turn_length{
			//End the turn
			switch_state(player_on_board)
			return
		}
		current_priority = 0
	}
	

	while is_undefined(_step_commands[current_priority]){
		current_priority ++
		
		if current_priority >= STEP_PRIOTITY.COUNT{
			current_turn ++
			if current_turn = current_turn_length{
				//End the turn
				switch_state(player_on_board)
				return
			}
			current_priority = 0
		}
	}
	
	switch (current_priority){

		case STEP_PRIOTITY.MOVE:
		
			//Entity map used to move all entities at the same time
			ds_grid_clear(entity_map,0) 
			
			var _priority_step_commands = _step_commands[current_priority]
			
			for(var i = 0; i < array_length(_priority_step_commands); i ++){
				//Preform each command
				var _command_id = _priority_step_commands[i][1]
				var _inst = _priority_step_commands[i][0]
				var _cur_command = command_node_DB[_command_id]
		
				if struct_exists(_cur_command, "command_vars"){
					script_execute(_cur_command.command_script, _inst, _cur_command.command_vars)
				}else{
					script_execute(_cur_command.command_script, _inst)
				}
			}
			
			with pEntity{
				if !visited{
					add_inst_to_square(row, col, self, true)
				}
				
				visited = false
			}
			
			time = 0
		break
	
	}




}