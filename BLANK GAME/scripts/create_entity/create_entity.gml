function create_entity(_row, _col, _entity_id){
	
	if !is_square_valid(_row, _col){ show_debug_message("Invalid spawning square") return false}
	

	if tile_empty(_row,_col){
		
		var _new_entity = instance_create_layer(0,0,"Entities",pEntity)
	
		global.map[# _row,_col][TILE.ENTITY] = _new_entity
		_new_entity.x = TileToScreenX(_row,_col)
		_new_entity.y = TileToScreenY(_row,_col)
		_new_entity.depth = -_new_entity.y
		return true
	}
	
	return false
	
}