//Mostly reused from resolve conflict
function resolve_falling_conflict(_inst){

	var _cardinal_dirs = [[0,1],[1,0],[0,-1],[-1,0]]
		
	camera_shake(4,0.7)
	
	
	//Move them back to their starting square, if there is someone already there create a conflict

	//Animate the hit
	_inst.falling()
	_inst.visited = true
	
	
	repeat(irandom_range(2,4)){
		create_debris(_inst.xTo, _inst.yTo)
	}
	
	//Do the dmg here
	deal_dmg(_inst, 2)
	
	if !instance_exists(_inst){
		return
	}
	
	//move back and collide with anyone taht just went to that square
	var _oppisite_dir = ((4 + _inst.dir - 2) mod 4)
		
	var _dir = _cardinal_dirs[_oppisite_dir]
	var _old_row = _inst.row + _dir[0]
	var _old_col = _inst.col + _dir[1]

	if !is_square_valid(_old_row,_old_col){
		exit
	}

	var _new_entity_placement = entity_map[# _old_row, _old_col]
		
	//If an entity already wants to move here
	if _new_entity_placement != 0{
		if is_array(_new_entity_placement){
			array_push(_new_entity_placement,_inst)	
		}else{
			entity_map[# _old_row, _old_col] = [_new_entity_placement , _inst]
			array_push(conflict_squares,[_old_row, _old_col])
		}
	}else{
		entity_map[# _old_row, _old_col] = _inst
	}
		
				
	_inst.row = _old_row
	_inst.col = _old_col

	//_inst.dir = _oppisite_dir

	//REMOVE THIS IF YOU WANT TO MAKE A CHARACTER MOVE MULTIPLE TIMES
	//Bug does exist that makes 2 characters get stuck on each other
	_inst.still = true
	
}