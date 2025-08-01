function execute_step(){

	//Dont do anything if there is a delay
	if time <= step_delay{
		time ++
		return
	}
	
	if end_priority_step{		
		current_priority ++
		init_step()
		
		if current_priority >= STEP_PRIOTITY.COUNT{
			return	
		}

	}

	switch (current_priority){
		default:
			
			var _prestep_commands = step_command[current_turn][current_priority]
			
			if array_length(_prestep_commands) > 0{ 
				var _raw_command_data = array_pop(_prestep_commands)
			

				var _command_id = _raw_command_data[1]
				var _inst = _raw_command_data[0]
				var _cur_command = command_node_DB[_command_id]
		
				if struct_exists(_cur_command, "command_vars"){
					script_execute(_cur_command.command_script, _inst, _cur_command.command_vars)
				}else{
					script_execute(_cur_command.command_script, _inst)
				}
				
				
				time = step_delay/2
				
			}else{
				
				time = 0
				step_command[current_turn][current_priority] = undefined
				end_priority_step = true
			}

		break
		
		
		case STEP_PRIOTITY.PLAYER:
			var _prestep_commands = step_command[current_turn][current_priority]
				
				
			if array_length(_prestep_commands) > 0{ 
				var _raw_command_data = array_pop(_prestep_commands)
			

				var _command_id = _raw_command_data[1]
				var _inst = _raw_command_data[0]
				var _cur_command = command_node_DB[_command_id]
				
				
				if _cur_command.priority != STEP_PRIOTITY.MOVE{
					time = step_delay/2
				}else{
					moved = true
					ds_grid_clear(entity_map,0) 
					time = 0 	
				}
						
				
				//Check what type of script we are running, if its move it requires extra steps
				if struct_exists(_cur_command, "command_vars"){
					script_execute(_cur_command.command_script, _inst, _cur_command.command_vars)
				}else{
					script_execute(_cur_command.command_script, _inst)
				}


				//If we moved, we must add all entites back to the map
				if moved{
					with pEntity{
						if !visited{
							add_inst_to_square(row, col, self, true)
						}
				
						visited = false
					}
				}
			}else{
				if moved{
					//If anyone has fell, play that first
					if array_length(falling_conflicts) > 0{
						resolve_falling_conflict(array_pop(falling_conflicts))
						time = -step_delay*1.5
						return
					}
		
					//Resolve hits after that
					if array_length(conflict_squares) > 0{
		
						var _cur_conflict = array_pop(conflict_squares)
		
						resolve_conflict(_cur_conflict[0],_cur_conflict[1])
				
				
						return
					}
					
					
				}
		
		
				//Everything else is done at the same time here
					with global.player_entity{
						if visited = false{
							update_pos()	
						}
				
						visited = false
					}
				time = 0
				step_command[current_turn][current_priority] = undefined
				end_priority_step = true
			}
		
		break
		case STEP_PRIOTITY.MOVE:
			//Entity map used to move all entities at the same time
			if !moved{
				moved = true
				ds_grid_clear(entity_map,0) 
					
				var _priority_step_commands = step_command[current_turn][current_priority]
			
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
			}
			
			//If anyone has fell, play that first
			if array_length(falling_conflicts) > 0{
				resolve_falling_conflict(array_pop(falling_conflicts))
				time = -step_delay*1.5
				return
			}
		
			//Resolve hits after that
			if array_length(conflict_squares) > 0{
		
				var _cur_conflict = array_pop(conflict_squares)
		
				resolve_conflict(_cur_conflict[0],_cur_conflict[1])
				
				
				return
			}
		
		
			//Everything else is done at the same time here
			with pEntity{
				if visited = false{
					update_pos()	
				}
				
				visited = false
			}
			end_priority_step = true
						
			time = 0
		break		
	
	}

	
}