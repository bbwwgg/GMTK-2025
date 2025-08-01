function player_dragging_node(){

	var _held = mouse_check_button(mb_left)
	
	var _node_width = node_base_width*selected_node.xscale
	var _node_height = node_base_width*selected_node.yscale

	var _device_mouse_x = device_mouse_x_to_gui(0)-_node_width/2
	var _device_mouse_y = device_mouse_y_to_gui(0)-_node_height/2

	var x_offset = inv_leftx + command_node_side_margin
	var y_offset = inv_top_y + command_node_top_margin
	
	var _node_x = selected_node.x
	var _node_y = selected_node.y
	
	if rectangle_in_rectangle(_device_mouse_x, _device_mouse_y, _device_mouse_x+_node_width, _device_mouse_y+_node_height,x_offset,y_offset,x_offset+command_width,y_offset+command_height)!=0{
	    // Calculate the slot index directly
        var index = floor(( _device_mouse_x- x_offset) / (node_base_width * node_scale));
        index = clamp(index, 0, list_max - 1);
		if temp_command_node_index != index{
			
		
			if !is_command_complete(){
				//Check if this slot is empty
				if !is_undefined(command_list[index]){
					if temp_command_node_index != -1{
						if is_undefined(command_list[temp_command_node_index]){
							move_command_node(index,temp_command_node_index)
						}else{
							//This shouldnt happen so i wont code here
						}
					}else{
						var _search = 0
						while (true) {
						    _search++;

						    // Push right
						    if (index + _search < array_length(command_list)) {
						        if is_undefined(command_list[index + _search]) {
						            // Shift everything from (index + _search - 1) down to index right by 1
						            for (var i = index + _search - 1; i >= index; i--) {
						                move_command_node(i, i + 1);
						            }
						            break;
						        }
						    }

						    // Push left
						    if (index - _search >= 0) {
						        if is_undefined(command_list[index - _search]) {
						            // Shift everything from (index - _search + 1) up to index left by 1
						            for (var i = index - _search + 1; i <= index; i++) {
						                move_command_node(i, i - 1);
						            }
						            break;
						        }
						    }
						}
					}
				}
			
				// Calculate snapped x position
				temp_command_node_index = index
		        var snap_x = x_offset + start_node_width * node_scale + index * (node_base_width * node_scale);
		        var snap_y = y_offset;
				selected_node.move_to(snap_x,snap_y,10)
			
			}
		}

	}else{
		
		//Rearange the nodes if possible
	    var i = floor((_device_mouse_x - inventory_xoffset) / (inventory_node_xgap + node_base_width * inventory_node_scale));
	    var j = floor((_device_mouse_y - inventory_yoffset) / (inventory_node_ygap + node_base_height * inventory_node_scale));
		
		//If this isnt a valid area for a nide
		var _index = -1
		if (i >= 0 || i < nodes_per_row || j >= 0 || j < node_row_count) {
	        _index = i + j * nodes_per_row;
	    }

		//
		if _index != prev_index{
			prev_index = _index

			rearange_inventory(true)	
		}
		
		temp_command_node_index = -1
		selected_node.x = lerp(selected_node.x, _device_mouse_x, 0.25)
		selected_node.y = lerp(selected_node.y, _device_mouse_y, 0.25)
		
		
	}
	
	
	if !_held{

		//Add the held node to the command line
		if temp_command_node_index != -1{
			command_list[temp_command_node_index] = selected_node
			rearange_inventory()
		}else{		
			//Add it back to the inventory
			if prev_index = -1 or prev_index >= ds_list_size(command_node_inventory){
				add_node_to_inventory(selected_node)
			}else{
				ds_list_insert(command_node_inventory,prev_index,selected_node)	
			}
			
			selected_node.image_xscale = inventory_node_scale
			selected_node.image_yscale = inventory_node_scale
		}
		selected_node = noone
		
		switch_state(player_on_nodes)
	}
}

function move_command_node(_old_index, _new_index){

	var x_offset = inv_leftx + command_node_side_margin
	var y_offset = inv_top_y + command_node_top_margin
	
	command_list[_new_index] = command_list[_old_index]
	command_list[_old_index] = undefined

	var snap_x = x_offset + start_node_width * node_scale + _new_index * (node_base_width * node_scale);
	var snap_y = y_offset;
	command_list[_new_index].move_to(snap_x,snap_y,10)
	//show_message([selected_node.x,selected_node.xTo])
}