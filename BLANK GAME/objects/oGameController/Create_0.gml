randomize()
command_node_database()
global.numberCounter = 0;
instance_create_layer(0,0,"Instances",oCamera)
instance_create_layer(0,0,"Instances", oInventory)

test_node = instance_create_layer(1000,450, "Entities", objNode)
instance_create_layer(50,40, "Instances", objStart)
test_node.nodeType = 3
state = load_board

selected_start_mousex = 0
selected_start_mousey = 0

step_command = []
current_turn = 0
current_priority = 0

time = 0
step_delay = 13




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
				still = false
			}
			
			current_priority = 0
			time = 0	
			
			init_step()
		break
	}
}
