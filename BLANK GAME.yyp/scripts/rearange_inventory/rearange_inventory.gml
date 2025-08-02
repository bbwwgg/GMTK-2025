function rearange_inventory(_include_selected = false, _time_to = 15){

	inventory_yoffset = inv_top_y+GUI_HIDDEN_INVENTORY_MAX_HEIGHT
	var _size = ds_list_size(command_node_inventory)
	var _index = 0
	
	
 
	if selected_node != noone and _include_selected{
		var _node_width = node_base_width*selected_node.xscale
		var _node_height = node_base_width*selected_node.yscale
		var _device_mouse_x = device_mouse_x_to_gui(0)-_node_width/2
		var _device_mouse_y = device_mouse_y_to_gui(0)-_node_height/2
	
		var _x = floor((_device_mouse_x - inventory_xoffset) / (inventory_node_xgap + node_base_width * inventory_node_scale));
	    var _y = floor((_device_mouse_y - inventory_yoffset) / (inventory_node_ygap + node_base_height * inventory_node_scale));

		if (_x < 0 || _x >= nodes_per_row || _y < 0 || _y >= node_row_count) {
	        _include_selected = false
	    }else{
			_size ++		
		}
	}else{
		_include_selected = false	
	}
			
	
	
	
	for(var j = 0; j < node_row_count; j ++){
		for(var i = 0; i < nodes_per_row; i ++){
					
			if _include_selected{
				if _x == i and _y == j{
					continue	
				}
			}
	
		
			var _cur_node = command_node_inventory[| _index]
			if is_undefined(_cur_node){
				_index++
				continue	
			}
			_cur_node.move_to(inventory_xoffset+inventory_node_xgap*(i+1) +i*(node_base_width*inventory_node_scale),inventory_yoffset+inventory_node_ygap*(j+1) +j*(node_base_height*inventory_node_scale),_time_to)
			_cur_node.image_xscale = inventory_node_scale
			_cur_node.image_yscale = inventory_node_scale
			
			
			_index++
			if _index = _size{
				break	
			}
			 
		}
	}
}