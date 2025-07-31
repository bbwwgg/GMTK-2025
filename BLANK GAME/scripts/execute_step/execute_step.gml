function execute_step(){
	
	if time <= step_delay{
		time ++
		return
		
	}
	
	
	switch (current_priority){
		case STEP_PRIOTITY.PRESTEP:
			var _prestep_commands = step_command[current_turn][current_priority]
			
			var _raw_command_data = array_pop(_prestep_commands)
			
			if is_undefined(_raw_command_data){ 
				time = 0 
				current_priority ++
				init_step()
				return
			}

			var _command_id = _raw_command_data[1]
			var _inst = _raw_command_data[0]
			var _cur_command = command_node_DB[_command_id]
		
			if struct_exists(_cur_command, "command_vars"){
				script_execute(_cur_command.command_script, _inst, _cur_command.command_vars)
			}else{
				script_execute(_cur_command.command_script, _inst)
			}
			
			time = step_delay div 2
		break
		
		
		case STEP_PRIOTITY.PLAYER:

			for(var i = 0; i < array_length(_step_commands); i ++){
				//Preform each command
				var _command_id = _step_commands[i][1]
				var _inst = _step_commands[i][0]
				var _cur_command = command_node_DB[_command_id]
		
				if struct_exists(_cur_command, "command_vars"){
					script_execute(_cur_command.command_script, _inst, _cur_command.command_vars)
				}else{
					script_execute(_cur_command.command_script, _inst)
				}
			}
		break
		case STEP_PRIOTITY.MOVE:
		
			if array_length(conflict_squares) > 0{
		
				var _cur_conflict = array_pop(conflict_squares)
		
				resolve_conflict(_cur_conflict[0],_cur_conflict[1])
				
				time = 0
			}else{
		
		
				//Everything else is done at the same time here
		
				with pEntity{
					update_pos()	
				}
				
				current_priority ++
				init_step()
				

			}
		
		break
		case STEP_PRIOTITY.ATTACK:
		
		break
		
	
	}

}