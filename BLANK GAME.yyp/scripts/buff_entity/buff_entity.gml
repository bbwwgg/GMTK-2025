function buff_entity(_inst, _args){
	//@param _inst instance to buff
	//@param _args[ Buff type, ammount ]
	var _type = _args[0]
	var _ammount = _args[1]
	
	switch _type{
		case BUFFS.HEAL:
			_inst.hp = clamp(_inst.hp + _ammount ,0,_inst.max_hp)
			create_text_gui(_inst.x,_inst.y-MAP_TILE_H/2,"+"+string(_ammount),#99ff33)
		break
		
	}
	
}