//Used to help all entity movement
function move_prep(_inst, _dir){

	var _cardinal_dirs = [[0,1],[1,0],[0,-1],[-1,0]]
	
	var _location_change = _cardinal_dirs[_dir]
	
	
	var _row = _inst.row
	var _col = _inst.col 
	
	var _desired_row = _row + _location_change[0] 
	var _desired_col = _col + _location_change[1] 
	
	
	_inst.visited = true

	if !is_square_valid(_desired_row,_desired_col){
		add_inst_to_square(_row, _col, _inst, true)
		_inst.dir = _dir
		return false
	}
	
	//Falling if we reach a hole
	if global.map[# _desired_row, _desired_col][TILE.SPRITE] == 0{
		
		array_push(oGameController.falling_conflicts,_inst)
		
		_inst.row = _desired_row
		_inst.col = _desired_col
		_inst.dir = _dir
		return false
	}
	
	//If there is no object here we can try to tell the desired placement
	if global.map[# _desired_row, _desired_col][TILE.OBJECT] = noone{
		
		add_inst_to_square(_desired_row,_desired_col,_inst)

		_inst.row = _desired_row
		_inst.col = _desired_col
		_inst.dir = _dir
		return true
	}


	return false
}


function add_inst_to_square(_row, _col, _inst, _stationary = false){
	
	var _new_entity_placement = oGameController.entity_map[# _row, _col]
		
	//If an entity already wants to move here
	if _new_entity_placement != 0{
		if is_array(_new_entity_placement){
			array_push(_new_entity_placement,_inst)	
		}else{
			oGameController.entity_map[# _row, _col] = [_new_entity_placement , _inst]
			array_push(oGameController.conflict_squares,[_row, _col])

		}
	}else{
		oGameController.entity_map[# _row, _col] = _inst
	}
	
	
	_inst.still = _stationary
}