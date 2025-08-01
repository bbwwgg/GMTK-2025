function entity_database(){
	var ENTITY_ID
	
	//Player entity is always 0
	ENTITY_ID[0] = {
		sprite : sSands,
		hp : 5,
		str : 1,
		res : 0,
		collide_dmg : 1
		
	}
	
	ENTITY_ID[1] = {
		sprite : sBow,
		hp : 5,
		str : 1,
		res : 0,
		collide_dmg : 3,
		
		commands : [5]
	}
	
	ENTITY_ID[2] = {
		sprite : sOtherone,
		hp : 3,
		str : 1,
		res : 0,
		collide_dmg : 0,
		commands : [4,3,2,1,0]
	}

	return ENTITY_ID
}