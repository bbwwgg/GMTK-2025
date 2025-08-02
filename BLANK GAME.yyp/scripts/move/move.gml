function move(_inst, _dir){

	var _cardinal_dirs = [[0,1],[1,0],[0,-1],[-1,0]]
	
	var _location_change = _cardinal_dirs[_dir]
	
	
	var _row = _inst.row
	var _col = _inst.col 
	
	var _desired_row = _row + _location_change[0] 
	var _desired_col = _col + _location_change[1] 
	
	

	if !is_square_valid(_desired_row,_desired_col){
		return false
	}


	if tile_empty (_desired_row,_desired_col){
		
		if global.map[# _row, _col][TILE.ENTITY] = _inst{
			global.map[# _row, _col][TILE.ENTITY]  = noone
		}
		
		global.map[# _desired_row, _desired_col][TILE.ENTITY]  = _inst
		
		_inst.row = _desired_row
		_inst.col = _desired_col
		
		_inst.update_pos()
		
		return true
	}


	return false
}