// Only allow one node to be selected
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
if (global.mouse_clicked_handled == false && mouse_check_button(mb_left)) {
    if (point_in_rectangle(mx, my, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		global.mouse_clicked_handled = true
		if (global.selected_node == noone || global.selected_node == id) {
            if (!selected) {
                disX = mx - x;
                disY = my - y;
            }
            selected = true;
            global.selected_node = id;
        }
    }
} else {
    // If this was the selected node, release it
    if (global.selected_node == id) {
        global.selected_node = noone;
    }
    selected = false;
}



if(selected == true ){
x = mx - disX
y = my - disY
}else if(added == false){
global.command_node_DB[nodeType].amount++

	instance_destroy(self)
}