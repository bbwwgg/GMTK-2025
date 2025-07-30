function init_tile_database(){
	enum TILE_TYPE{
		EMPTY,
		BASE,
		SLIME,
		ICE,
		FIRE
	}

	TILEID[TILE_TYPE.EMPTY] = {
		ID :			TILE_TYPE.EMPTY,
		movement_cost :	1
	}

	TILEID[TILE_TYPE.BASE] = {
		ID :			TILE_TYPE.BASE,
		movement_cost :	1
	}

	TILEID[TILE_TYPE.SLIME] = {
		ID :				TILE_TYPE.SLIME,
		movement_cost :		2
	}

	TILEID[TILE_TYPE.ICE] = {
		ID :				TILE_TYPE.ICE,
		movement_cost :		1
	}

	TILEID[TILE_TYPE.FIRE] = {
		ID :				TILE_TYPE.FIRE,
		movement_cost :		3
	}

}

