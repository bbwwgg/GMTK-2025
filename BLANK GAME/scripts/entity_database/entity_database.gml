function entity_database(){
	var ENTITY_ID
	
	//Player entity is always 0
	ENTITY_ID[0] = {
		sprite : sSands
	}
	
	ENTITY_ID[1] = {
		sprite : sBow,
		commands : [5]
	}
	
	ENTITY_ID[2] = {
		sprite : sGuy,
		commands : [4,3,2,1]
	}

	return ENTITY_ID
}