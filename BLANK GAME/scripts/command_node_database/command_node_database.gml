function command_node_database(){

	command_node_DB[0] = {
		name : "Right",
		description : "Moves the target right",
		command_script : move_prep,
		command_vars : 0, //Not required, but if put it will run the command with the arg(s)
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.STEP
	}

	command_node_DB[1] = {
		name : "Up",
		description : "Moves the target up",
		command_script : move_prep,
		command_vars : 1, //Not required, but if put it will run the command with the arg(s)
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.STEP
	}

	command_node_DB[2] = {
		name : "Left",
		description : "Moves the target left",
		command_script : move_prep,
		command_vars : 2, //Not required, but if put it will run the command with the arg(s)
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.STEP
	}


	command_node_DB[3] = {
		name : "Down",
		description : "Moves the target down",
		command_script : move_prep,
		command_vars : 3, //Not required, but if put it will run the command with the arg(s)
		cost  : 0,
		sell_price : 3,
		sprite : sHitDebris,
		priority : STEP_PRIOTITY.STEP
	}




}