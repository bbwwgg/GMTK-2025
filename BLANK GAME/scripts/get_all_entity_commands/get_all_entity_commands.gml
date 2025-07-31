function get_all_entity_commands(){
	var _turn_length = current_turn_length
	
	step_command = array_create(_turn_length, undefined)
	
	for (var i = 0; i < instance_number(pEntity); i++){
		var _inst = instance_find(pEntity, i);
			
		//Get the entities commands
		var _new_commands = _inst.commands
		
		if is_undefined(_new_commands){
			exit	
		}
		
		var _command_length = array_length(_new_commands)
		
		for(var j = 0; j < _turn_length; j++){
			var _cur_index = j mod _command_length
			
			var _cur_command = _new_commands[_cur_index]
			
			
			//Check if this step has any commands set
			var _formated_command = [_inst, _cur_command]
			var _priority = command_node_DB[_cur_command].priority
			

			if is_undefined(step_command[j]){
				step_command[j] = array_create(STEP_PRIOTITY.COUNT, undefined)

			}
			
			if is_undefined(step_command[j][_priority]){
				step_command[j][_priority] = []
			}
			
			array_push(step_command[j][_priority], _formated_command)
						
		}
		
		
		
	}
	
}