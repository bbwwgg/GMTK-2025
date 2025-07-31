randomize()
command_node_database()


state = player_on_board

global.biom = -1

instance_create_layer(0,0,"Instances",oCamera)
instance_create_layer(0,0,"Instances",oBoardRender)

repeat(10){
	create_entity(irandom(global.board_width),irandom(global.board_height),irandom(2))
}

selected_start_mousex = 0
selected_start_mousey = 0

step_command = []
current_turn = 0
current_priority = 0

time = 0
step_delay = 15

entity_map = ds_grid_create(1,1)

current_turn_length = 3



function switch_state(_state){
	state = _state
	
	switch _state{
		case execute_step:
			step_command = []
			get_all_entity_commands()
			current_turn = 0
			current_priority = 0
			
			oCamera.lock_to_board = true
			with oCamera{	
				target_width = global.camera_max_width
				target_height = global.camera_max_height
			}
			
			
			entity_map = ds_grid_create(global.board_width,global.board_height)
			
			with pEntity{
				other.entity_map[# col, row] = self
				visited = false
			}
			
			current_priority = 0
			time = 0	
			
			init_step()
		break
	}
}