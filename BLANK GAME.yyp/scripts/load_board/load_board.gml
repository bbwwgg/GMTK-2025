function load_board(){
	
	if room = room_combat{
		
		//Board creation
		global.biom = 1

		instance_create_layer(0,0,"Instances",oBoardRender)
		

		global.player_entity = false
		while !global.player_entity{
			global.player_entity = create_entity(irandom(global.board_width),irandom(global.board_height),0)
		}
	

		repeat(irandom_range(3,8)){
			create_entity(irandom(global.board_width),irandom(global.board_height),irandom_range(1,2))
		}
	
	
		entity_map = ds_grid_create(global.board_width,global.board_height)

		

		current_turn = 0
		current_priority = 0


		current_turn_length = 4

	
		switch_state(player_on_board)
	}else{
		screen_transition(room_combat)
	}

	
}