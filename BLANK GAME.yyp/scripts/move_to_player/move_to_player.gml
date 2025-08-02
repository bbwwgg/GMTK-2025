function move_to_player(_inst){
	var _src = [_inst.row,_inst.col]
	var _path_to_player = a_star_search(_src,[global.player_entity.row,global.player_entity.col],true)
		
	if is_array(_path_to_player){
		var _first_step = _path_to_player[1]
		
		var _dir = get_cardinal_direction(_src, _first_step)

		if _dir != noone{
			move_prep(_inst,_dir)
			return
		}
	}
	
	
	_inst.visited = true
	add_inst_to_square(_src[0], _src[1], _inst, true)
	
	
}