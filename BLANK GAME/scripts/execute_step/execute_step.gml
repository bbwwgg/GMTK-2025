function execute_step(_step_commands){
	
	if is_undefined(_step_commands){return}
	
	//Entity map used to move all entities at the same time
	entity_map = ds_grid_create(global.board_width,global.board_height)
	
	conflict_squares = []
	
	for(var i = 0; i < array_length(_step_commands); i ++){
		
		move_prep(_step_commands[i][0],_step_commands[i][1])		
	}	
	
	//Fix the entity map if there is any overlaps or collisions
	while array_length(conflict_squares) > 0{
		var _cur_conflict = array_pop(conflict_squares)
		
		resolve_conflict(_cur_conflict[0],_cur_conflict[1])
	}	
	
	with pEntity{
		update_pos()	
	}

	ds_grid_destroy(entity_map)

}