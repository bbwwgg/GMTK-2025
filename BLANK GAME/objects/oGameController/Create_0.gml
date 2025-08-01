randomize()
command_node_database()
instance_create_layer(0,0,"Instances",oCamera)


state = load_board

selected_start_mousex = 0
selected_start_mousey = 0

step_command = []
current_turn = 0
current_priority = 0

time = 0
step_delay = 15


//Inventory vars
enum INVENTORY_STATE{
	HIDDEN,
	SHOWN
}


can_hold = false

inv_time_max = 15
inv_time = inv_time_max+1
inv_bot_y = VIEW_HEIGHT
inv_top_y = GUI_INVENTORY_HIDDEN_Y
inv_leftx = GUI_INVENTORY_LEFTX
inv_rightx = inv_leftx + GUI_INVENTORY_MAX_WIDTH

inv_state = INVENTORY_STATE.HIDDEN

inv_yto = inv_top_y
inv_yfrom = inv_top_y


//Commands + inventory
command_node_inventory = ds_list_create()

selected_node = noone

list_max = 3
command_list = array_create(list_max,undefined)

node_base_width = sprite_get_width(sNode)- 12
node_base_height = sprite_get_height(sNode)

start_node_width = sprite_get_width(sStartNode) - 12
end_node_width = sprite_get_width(sEndNode)

command_node_max_width = GUI_COMMAND_MAX_WIDTH 
command_node_max_height = GUI_COMMAND_MAX_HEIGHT

command_node_top_border = (GUI_HIDDEN_INVENTORY_MAX_HEIGHT-command_node_max_height) / 2


inventory_width = GUI_INVENTORY_COMMAND_NODE_WIDTH
inventory_height = GUI_INVENTORY_NODE_MAX_HEIGHT

inventory_xoffset = inv_leftx
inventory_yoffset = inv_top_y+GUI_HIDDEN_INVENTORY_MAX_HEIGHT

max_inventory_nodes = 15
nodes_per_row = 5
node_row_count = (max_inventory_nodes div nodes_per_row)

inventory_node_scale = min(inventory_width/(nodes_per_row+1)/node_base_width,inventory_height/node_base_height/(node_row_count + 1))
inventory_node_xgap = (inventory_width-inventory_node_scale*node_base_width*nodes_per_row) / (nodes_per_row+1)
inventory_node_ygap = (inventory_height-inventory_node_scale*node_base_height*node_row_count) / (node_row_count+1)

function setup_node_sizing(){
	node_scale = min(command_node_max_width/list_max/node_base_width+start_node_width+end_node_width,command_node_max_height/node_base_height)
	
	command_width = (node_base_width*node_scale*list_max) + start_node_width+end_node_width
	command_height = (node_base_height*node_scale)
	
	command_node_side_margin = (command_node_max_width-command_width) / 2
	command_node_top_margin =  (command_node_max_height-command_height)/ 2 + command_node_top_border
}


function is_command_complete(){
	for(var i = 0; i < array_length(command_list); i ++){
		if is_undefined(command_list[i]){
			return false
		}	
	}
	
	return true
}

setup_node_sizing()
repeat(18){
	add_node_to_inventory(create_node(0,0,2,1))
}

function point_in_inventory(_px,_py) {
	return point_in_rectangle(_px,_py,inv_leftx,inv_top_y,inv_rightx,inv_bot_y)
}

function switch_state(_state){

	//Enter code
	switch _state{
		case player_on_board:
			if 	inv_state = INVENTORY_STATE.SHOWN{
			inv_time = 0	
			inv_state = INVENTORY_STATE.HIDDEN
			}
		
			can_hold = false
		break
		case player_on_nodes:
			rearange_inventory()
		break
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
	
	state = _state
	
}