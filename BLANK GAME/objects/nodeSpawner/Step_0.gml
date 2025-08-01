// Only allow one node to be selected
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (global.mouse_clicked_handled == false && mouse_check_button(mb_left)) {
    if (point_in_rectangle(mx, my, bbox_left, bbox_top, bbox_right, bbox_bottom) && global.selected_node == noone) {
		var node = global.command_node_DB[nodeType];
			if (node.amount > 0){
				var createnode = instance_create_layer(x, y, "Instances", objNode)
				createnode.nodeType = nodeType
				node.amount--
				
				global.selected_node = createnode
				global.mouse_clicked_handled = true;
	}
		
	}
}
