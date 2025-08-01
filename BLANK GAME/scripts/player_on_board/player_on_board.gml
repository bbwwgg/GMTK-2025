function player_on_board(){
	var _device_mouse_x = device_mouse_x_to_gui(0)
	var _device_mouse_y = device_mouse_y_to_gui(0)
	var _click = mouse_check_button_pressed(mb_left)
	var _held = mouse_check_button(mb_left)
	var _release = mouse_check_button_released(mb_left)
	//Zooming into board 
	var wheel = mouse_wheel_down() - mouse_wheel_up()

	if(wheel != 0) {
		wheel *= 0.1	
		with oCamera{	
			target_width = clamp(target_width *(wheel + 1), global.camera_max_width *0.4,global.camera_max_width)
			target_height = clamp(target_height*(wheel + 1), global.camera_max_height*0.4,global.camera_max_height)
		}
		
	}
		
	//Click effects
	if _click{
		selected_start_mousex = _device_mouse_x
		selected_start_mousey = _device_mouse_y
		can_hold = true
	}
	
	if _held and can_hold{
		var move_threshold = 8
		if( _device_mouse_x < selected_start_mousex - move_threshold || selected_start_mousex + move_threshold < _device_mouse_x ||
			_device_mouse_y < selected_start_mousey - move_threshold || selected_start_mousey + move_threshold < _device_mouse_y){ 
			oCamera.lock_to_board = false

			switch_state(player_dragging_camera)
		}
		
	}
	
	if _release{
		//TODO select entity on mouse
	}
	
	if point_in_inventory(_device_mouse_x,_device_mouse_y){
		switch_state(player_on_nodes)
		inv_state = INVENTORY_STATE.SHOWN
			
		inv_time = 0
	}
	
	if keyboard_check_pressed(vk_space){
		global.player_entity.commands = [0,1,2,3,4]
		switch_state(execute_step)
	}


}