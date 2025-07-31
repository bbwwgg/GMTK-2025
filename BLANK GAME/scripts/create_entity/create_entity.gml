function create_entity(_row, _col, _entity_id){
	
	static ENTITY_ID = entity_database()
	
	if !is_square_valid(_row, _col){ show_debug_message("Invalid spawning square") return false}
	

	if tile_empty(_row,_col){
		
		var _new_entity = instance_create_layer(0,0,"Entities",pEntity)
	
		global.map[# _row,_col][TILE.ENTITY] = _new_entity
		_new_entity.row = _row
		_new_entity.col = _col
		
		_new_entity.commands = ENTITY_ID[_entity_id].commands
		
		_new_entity.image_index = _entity_id
		
		_new_entity.update_pos()

		return true
	}
	
	return false
	
}