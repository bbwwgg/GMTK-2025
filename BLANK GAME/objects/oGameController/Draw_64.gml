
if inv_time <= inv_time_max{
	if inv_time = 0{
		if inv_state = INVENTORY_STATE.SHOWN{
			inv_yto = GUI_INVENTORY_SHOWN_Y
			inv_yfrom = inv_top_y
		}else{
			inv_yto = GUI_INVENTORY_HIDDEN_Y
			inv_yfrom = inv_top_y
		}
	}
	
	inv_top_y = get_ease_data(MOVE_TYPE.EASE_OUT_ELASTIC,inv_time,inv_yfrom,inv_yto-inv_yfrom,inv_time_max)

	inv_time++

	//Inventory
	inventory_yoffset = inv_top_y+GUI_HIDDEN_INVENTORY_MAX_HEIGHT
	for(var j = 0; j < node_row_count; j ++){
		for(var i = 0; i < nodes_per_row; i ++){
		
			if i+j*nodes_per_row + 1 > ds_list_size(command_node_inventory){
				break	
			}
		
			var _cur_node = command_node_inventory[| i+j*nodes_per_row]
			_cur_node.move_timer = _cur_node.move_time_to + 1
			_cur_node.x = inventory_xoffset+inventory_node_xgap*(i+1) +i*(node_base_width*inventory_node_scale)
			_cur_node.y = inventory_yoffset+inventory_node_ygap*(j+1) +j*(node_base_height*inventory_node_scale)
			
			
		}
	}
}
draw_rectangle(inv_leftx,inv_top_y,inv_rightx,inv_bot_y,true)



//draw nodes

var x_offset = inv_leftx + command_node_side_margin
var y_offset = inv_top_y + command_node_top_margin

draw_rectangle(x_offset,y_offset,x_offset+command_width,y_offset+command_height,true)
//draw_rectangle(inv_leftx,inv_top_y+GUI_HIDDEN_INVENTORY_MAX_HEIGHT,inv_leftx+GUI_INVENTORY_COMMAND_NODE_WIDTH,inv_top_y+GUI_HIDDEN_INVENTORY_MAX_HEIGHT+GUI_INVENTORY_MAX_HEIGHT,true)

//Draw the set commands
draw_sprite_ext(sStartNode,0,x_offset,y_offset,node_scale,node_scale,0,c_white,1)
x_offset+=start_node_width*node_scale
for(var _node_index = 0; _node_index < list_max; _node_index ++){
	if is_undefined(command_list[_node_index]){
		draw_sprite_ext(sNode,4,x_offset+_node_index*(node_base_width*node_scale),y_offset,node_scale,node_scale,0,c_white,1)
	}else{
		command_list[_node_index].y = y_offset
		command_list[_node_index].draw()
	}
}
draw_sprite_ext(sEndNode,0,x_offset+_node_index*(node_base_width*node_scale),y_offset,node_scale,node_scale,0,c_white,1)


//Draw the inventory
if inv_state = INVENTORY_STATE.SHOWN{
	for(var j = 0; j < ds_list_size(command_node_inventory); j ++){
		
		var _cur_node = command_node_inventory[| j]
		if _cur_node == selected_node{
			continue	
		}
		_cur_node.draw()
	}
}


if selected_node != noone{
	selected_node.draw()
}