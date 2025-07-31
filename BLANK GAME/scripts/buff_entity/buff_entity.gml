function buff_entity(_inst, _args){
	//@param _inst instance to buff
	//@param _args[ Buff type, ammount ]
	
	_inst.health = 2
	create_debris(_inst.x,_inst.y)
	create_debris(_inst.x,_inst.y)
	create_debris(_inst.x,_inst.y)
	create_text_gui(_inst.x,_inst.y-MAP_TILE_H/2,"+2",#99ff33)
}