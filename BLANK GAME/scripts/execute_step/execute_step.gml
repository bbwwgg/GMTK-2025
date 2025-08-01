function execute_step(){
	
	if time <= step_delay{
		time ++
		show_debug_message(time)
		return
		
	}
	
	show_debug_message(current_priority)
	switch (current_priority){
		default:
		
			var _prestep_commands = step_command[current_turn][current_priority]
			
			
			if array_length(_prestep_commands) = 0{ 
				time = 0 
				current_priority ++
				init_step()
				
				return
			}

			
			var _raw_command_data = array_pop(_prestep_commands)
			

			var _command_id = _raw_command_data[1]
			var _inst = _raw_command_data[0]
			var _cur_command = command_node_DB[_command_id]
		
			if struct_exists(_cur_command, "command_vars"){
				script_execute(_cur_command.command_script, _inst, _cur_command.command_vars)
			}else{
				script_execute(_cur_command.command_script, _inst)
			}
			
			time = 0//step_delay div 2
		break
		
		
		case STEP_PRIOTITY.PLAYER:

			if array_length(falling_conflicts) > 0{
				
				resolve_falling_conflict(array_pop(falling_conflicts))
				time = -step_delay*2
				return	
			}
		
			if array_length(conflict_squares) > 0{
		
				var _cur_conflict = array_pop(conflict_squares)
		
				resolve_conflict(_cur_conflict[0],_cur_conflict[1])
				
				time = 0
			}else{
		
				//Everything else is done at the same time here
		
				global.player_entity.update_pos()	

				current_priority ++
				init_step()
				
			}
		break
		case STEP_PRIOTITY.MOVE:
		
			if array_length(falling_conflicts) > 0{
				
				
				resolve_falling_conflict(array_pop(falling_conflicts))
				time = -step_delay*2
				
				return
			}
		
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
	
	}

}