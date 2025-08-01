function load_board(){
	//Board creation
	global.biom = 1

	instance_create_layer(0,0,"Instances",oBoardRender)

	global.player_entity = false
	while !global.player_entity{
		global.player_entity = create_entity(irandom(global.board_width),irandom(global.board_height),0)
	}
	
create_entity(irandom(global.board_width),irandom(global.board_height),1)
	//repeat(10){
	//	create_entity(irandom(global.board_width),irandom(global.board_height),irandom_range(1,2))
	//}
	
	
	entity_map = ds_grid_create(1,1)

	current_turn_length = 10

	switch_state(player_on_board)

}