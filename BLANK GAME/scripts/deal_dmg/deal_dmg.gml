function deal_dmg(_inst_to, _value, _type = false){
	//Type not yet implemented
	
	_inst_to.hp -= _value
	
	create_text_gui(_inst_to.x, _inst_to.y,"-"+string(_value),#ff5050,true)

	
	if _inst_to.hp < 0{
		if _inst_to = global.player_entity{
			//Player death handled diffrently
			
			screen_transition(Room1)
			
			return
		}
		
		//if entity_map[# _inst_to.row,_inst_to.col] 
		if entity_map[# _inst_to.row,_inst_to.col] = _inst_to{
			entity_map[# _inst_to.row,_inst_to.col] = 0	
		}

		//instance_destroy()	
	}
	
}