function resolve_conflict(_row,_col){
	var _entities = entity_map[# _row, _col]
	var _base_len = array_length(_entities)
	var _cardinal_dirs = [[0,1],[1,0],[0,-1],[-1,0]]
	
	
	camera_shake(4,0.7)
	//Change this into arrays so that multple go atr 
	var _dmg_to_deal = array_create(_base_len,0)
	//Deal the damange
	for(var i = 0; i < _base_len; i ++){
		var _dmg_dealer = _entities[i]
		
		for(var j = 0; j < _base_len; j ++){
			if j = i{
				continue	
			}

			deal_dmg(_entities[j], _dmg_dealer.collide_dmg)
			
			//Debris
			repeat(irandom_range(2,4)){
				create_debris(_dmg_dealer.xTo, _dmg_dealer.yTo)
			}
			
		}
	}
	

	
	//Move them back to their starting square, if there is someone already there create a conflict
	for(var i = 0; i < _base_len; i ++){
		var _current_entity = array_pop(_entities)
		
		
		//Animate the hit
		_current_entity.collision()
		_current_entity.visited = true
		

		if _current_entity.still{
			continue	
		}
			
		//move back and collide with anyone taht just went to that square
		var _oppisite_dir = ((4 + _current_entity.dir - 2) mod 4)
		
		var _dir = _cardinal_dirs[_oppisite_dir]
		var _old_row = _current_entity.row + _dir[0]
		var _old_col = _current_entity.col + _dir[1]

		if !is_square_valid(_old_row,_old_col){
			continue
		}

		var _new_entity_placement = entity_map[# _old_row, _old_col]
		
		//If an entity already wants to move here
		if _new_entity_placement != 0{
			if is_array(_new_entity_placement){
				array_push(_new_entity_placement,_current_entity)	
			}else{
				entity_map[# _old_row, _old_col] = [_new_entity_placement , _current_entity]
				array_push(conflict_squares,[_old_row, _old_col])
			}
		}else{
			entity_map[# _old_row, _old_col] = _current_entity
		}
		
				
		_current_entity.row = _old_row
		_current_entity.col = _old_col

		//_current_entity.dir = _oppisite_dir

		//REMOVE THIS IF YOU WANT TO MAKE A CHARACTER MOVE MULTIPLE TIMES
		//Bug does exist that makes 2 characters get stuck on each other
		_current_entity.still = true
	}
	
	
}