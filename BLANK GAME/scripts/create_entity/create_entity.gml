function create_entity(_row, _col, _entity_id){
	
	static ENTITY_ID = entity_database()
	
	if !is_square_valid(_row, _col){ show_debug_message("Invalid spawning square") return false}


	if tile_empty(_row,_col){
		
		var _new_entity = instance_create_layer(0,0,"Entities",pEntity)
	
		global.map[# _row,_col][TILE.ENTITY] = _new_entity
		
		with _new_entity{
		
			row = _row
			col = _col
		
			if struct_exists(ENTITY_ID[_entity_id],"commands"){
				commands = ENTITY_ID[_entity_id].commands
			}
		
			image_index = _entity_id
		
			update_pos()

			x = xTo
			y = yTo
			depth= -y
			time = move_time + 1
		}

		return _new_entity
	}
	
	return false
	
}