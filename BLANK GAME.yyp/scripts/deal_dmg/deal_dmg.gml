function deal_dmg(_inst_to, _value, _type = false){
	//Type not yet implemented
	
	//check if the target is dead
	if !instance_exists(_inst_to){ return }
	
	_inst_to.hp -= _value
	
	create_text_gui(_inst_to.x, _inst_to.y-32,"-"+string(_value),#ff5050,true)

	
	if _inst_to.hp <= 0{
		if _inst_to = global.player_entity{
			//Player death handled diffrently
			
			//screen_transition(room_combat)
			
			return
		}
		
		//if entity_map[# _inst_to.row,_inst_to.col] 
		if entity_map[# _inst_to.row,_inst_to.col] = _inst_to{
			entity_map[# _inst_to.row,_inst_to.col] = 0	
		}else{
			if is_array(entity_map[# _inst_to.row,_inst_to.col]){
				for(var i = 0; i < array_length(entity_map[# _inst_to.row,_inst_to.col]); i ++){
					//if entity_map[# _inst_to.row,_inst_to.col][i] = _inst_to{
					//	array_delete(entity_map[# _inst_to.row,_inst_to.col],i,1)
					//}
				}
				//show_message(entity_map[# _inst_to.row,_inst_to.col])	
			}
		}
	
		instance_destroy(_inst_to)	
	}
	
}