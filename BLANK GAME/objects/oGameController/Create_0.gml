randomize()
command_node_database()


state = player_on_board

global.biom = -1

instance_create_layer(0,0,"Instances",oCamera)
instance_create_layer(0,0,"Instances",oBoardRender)

repeat(10){
	create_entity(irandom(global.board_width),irandom(global.board_height),irandom(2))
}



step_command = []
current_turn = 0


time = 0
step_delay = 15

entity_map = ds_grid_create(1,1)

get_all_entity_commands()

function switch_state(_state){
	state = _state
	
	switch _state{
		case execute_step:
		
			oCamera.lock_to_board = true
			with oCamera{	
				target_width = global.camera_max_width
				target_height = global.camera_max_height
			}
			init_step()
			
			time = 0	
			
		break
	}
}