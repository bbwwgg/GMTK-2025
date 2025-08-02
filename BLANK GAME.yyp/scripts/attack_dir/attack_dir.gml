function attack_dir(_inst){
		
	var _cardinal_dirs = [[0,1],[1,0],[0,-1],[-1,0]]
	var _location_change = _cardinal_dirs[_inst.dir]
	
	var _row = _inst.row
	var _col = _inst.col 
	
	var _desired_row = _row + _location_change[0] 
	var _desired_col = _col + _location_change[1] 
	
	if !is_square_valid(_desired_row,_desired_col){
		return	
	}
	
	
	
	with instance_create_layer( TileToScreenX(_desired_row,_desired_col), TileToScreenY(_desired_row,_desired_col), "effects", oEffect){
		sprite_index = sDmg_square
		
		image_speed = 1
		depth = -y + 1
	}
	
	var _entity = entity_map[# _desired_col, _desired_row]
	
	if _entity != 0{
		deal_dmg(_entity,_inst.str)
		camera_shake(6,0.4)
	}
	
	
}