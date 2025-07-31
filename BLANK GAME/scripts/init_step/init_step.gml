function init_step(){

	conflict_squares = []
	
	var _step_commands =  step_command[current_turn]
	if is_undefined(_step_commands){return}
	
	//Entity map used to move all entities at the same time
	entity_map = ds_grid_create(global.board_width,global.board_height)
	
	

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
}