function player_dragging_camera(){

	var _release = mouse_check_button_released(mb_left)

	//move camera by 
	var _device_mouse_x = device_mouse_x_to_gui(0)
	var _device_mouse_y = device_mouse_y_to_gui(0)	
	
	var move_x = _device_mouse_x - selected_start_mousex;
	var move_y = _device_mouse_y - selected_start_mousey;
	
	if move_x != 0{
		var new_x = oCamera.x_to - move_x * 0.2 * oCamera.current_width/global.camera_max_width
		var current_w = oCamera.current_width
		
		//Limit the screen
		if new_x < 0{
			new_x = new_x*exp(0.25*new_x/current_w)
		}else{
			var _upper_bound = global.camera_max_width - current_w
			
			if new_x > _upper_bound{
				new_x = _upper_bound + (new_x-_upper_bound)*exp(0.25*(_upper_bound-new_x)/current_w)
			}
		}
		
		oCamera.x_to = new_x
		
		selected_start_mousex = _device_mouse_x
	}
	
	if move_y != 0{
		var current_h = oCamera.current_height
		var new_y = oCamera.y_to - move_y * 0.2 * current_h/global.camera_max_height
		
		
		//Limit the screen
		if new_y < 0{
			new_y = new_y*exp(0.25*new_y/current_h)
		}else{
			var _upper_bound = global.camera_max_height - current_h
			
			if new_y > _upper_bound{
				new_y = _upper_bound + (new_y-_upper_bound)*exp(0.25*(_upper_bound-new_y)/current_h)
			}
		}
		
		oCamera.y_to = new_y
		
		selected_start_mousey = _device_mouse_y
	}

	
	if _release{
		oCamera.lock_to_board = true
		switch_state(player_on_board)	
	}
}