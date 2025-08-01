var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
image_index = 0
if (mouse_check_button(mb_left)) {
    if (point_in_rectangle(mx, my, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		oPlay.pressed = false
		image_index = 1;
	}
}