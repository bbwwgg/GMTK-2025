function command_node_database(){

	command_node_DB[0] = {
		name : "Right",
		description : "Moves the target right",
		command_script : move_prep,
		command_vars : 0, //Not required, but if put it will run the command with the arg(s)
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.MOVE
	}

	command_node_DB[1] = {
		name : "Up",
		description : "Moves the target up",
		command_script : move_prep,
		command_vars : 1, //Not required, but if put it will run the command with the arg(s)
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.MOVE
	}

	command_node_DB[2] = {
		name : "Left",
		description : "Moves the target left",
		command_script : move_prep,
		command_vars : 2, //Not required, but if put it will run the command with the arg(s)
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.MOVE
	}


	command_node_DB[3] = {
		name : "Down",
		description : "Moves the target down",
		command_script : move_prep,
		command_vars : 3, //Not required, but if put it will run the command with the arg(s)
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.MOVE
	}
	
	command_node_DB[4] = {
		name : "Heal",
		description : "Heal 1 health",
		command_script : buff_entity,
		command_vars : [1,1], //Not required, but if put it will run the command with the arg(s)
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.POSTSTEP
	}

	command_node_DB[5] = {
		name : "Move To Player",
		description : "Move towards the player",
		command_script : move_to_player,
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.MOVE
	}
	
	command_node_DB[6] = {
		name : "Move To Enemy",
		description : "Move towards the closest enemy",
		command_script : move_to_enemy,
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.MOVE
	}
	
	




}