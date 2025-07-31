function execute_step(){
	if time <= step_delay{
		time ++
		return
		
	}
	
	if array_length(conflict_squares) > 0{
		
		var _cur_conflict = array_pop(conflict_squares)
		
		resolve_conflict(_cur_conflict[0],_cur_conflict[1])
		time = 0

		
	}else{

		with pEntity{
			update_pos()	
		}

		ds_grid_destroy(entity_map)
		
		switch_state(player_on_board)
	}

}