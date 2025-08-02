function player_on_nodes(){
	var _device_mouse_x = device_mouse_x_to_gui(0)
	var _device_mouse_y = device_mouse_y_to_gui(0)
	var _click = mouse_check_button_pressed(mb_left)
	
	if !point_in_inventory(_device_mouse_x, _device_mouse_y){
		switch_state(player_on_board)
	}
	
	
	var _node = -1
		
	var x_offset = inv_leftx + command_node_side_margin
	var y_offset = inv_top_y + command_node_top_margin
	
	//If we are on the locked in commands remove them instead
	if point_in_rectangle(_device_mouse_x, _device_mouse_y,x_offset,y_offset,x_offset+command_width,y_offset+command_height) != 0{
		
		var index = floor((_device_mouse_x- x_offset - node_base_width*node_scale/2) / (node_base_width * node_scale));
			
		//If they havent clicked directly on a index
		if index < 0 || index >= list_max {
			return	
		}
			
		if is_undefined(command_list[index]){
			return
		}
			
		_node = command_list[index]
		if _click{	
			selected_node = _node
			command_list[index] = undefined
			return_x = -1
			return_y = -1
			
			temp_command_node_index = index
			prev_index = -1
			
			switch_state(player_dragging_node)
			
			return
		}
	}
		
	var i = floor((_device_mouse_x - inventory_xoffset) / (inventory_node_xgap + node_base_width * inventory_node_scale));
	var j = floor((_device_mouse_y - inventory_yoffset) / (inventory_node_ygap + node_base_height * inventory_node_scale));
	
	
	//If this isnt a valid area for a nide
	if (i >= 0 and i < nodes_per_row and j >= 0 and j < node_row_count) {
		
	
	
		//Get the index to check
		var _index = i + j * nodes_per_row;

		if (_index < ds_list_size(command_node_inventory)) {
		
			_node = command_node_inventory[| _index]
			
			//if we have clicked on a node
			if point_in_rectangle(_device_mouse_x,_device_mouse_y, _node.x, _node.y, _node.x + node_base_width*inventory_node_scale, _node.y+node_base_height*inventory_node_scale){
		
		
				if _click{	
					selected_node = _node
					return_x = inventory_xoffset+inventory_node_xgap*(i+1) +i*(node_base_width*inventory_node_scale)
					return_y = inventory_yoffset+inventory_node_ygap*(j+1) +j*(node_base_height*inventory_node_scale)
			
					selected_node.image_xscale = node_scale
					selected_node.image_yscale = node_scale
			
					temp_command_node_index = -1
					prev_index = _index
			
					ds_list_delete(command_node_inventory,_index)
			
					switch_state(player_dragging_node)
				}
			}
		}
	}

	if _node = prev_node and _node != -1{
		node_timer --
		if node_timer = 0{
			create_infobox(_node.x+node_base_width*_node.xscale/2 - GUI_INFOBOX_WIDTH/2,_node.y - GUI_INFOBOX_HEIGHT*0.8,_node)
		}
	}else{
		if instance_exists(oInfobox){
			if oInfobox.state = INFOBOX_STATE.ENTER{
				with oInfobox{
					switch_state(INFOBOX_STATE.EXIT)
				}
			}
		}
		prev_node = _node
		node_timer = max_node_timer
	}
}
	

