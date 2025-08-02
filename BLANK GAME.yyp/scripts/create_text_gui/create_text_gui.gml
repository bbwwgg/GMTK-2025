function create_text_gui(_x,_y,_text, _color, is_down = false){
	with instance_create_layer(_x,_y,"effects",oTextEffect){
		hsp = random_range(-1,1)
		
		
		if !is_down{
			vsp = random_range(0.7,-1)
			vsp_change = -0.05
		}else{
			hsp = random_range(-1,1)
			vsp_change = 0.1
		}
		
		alpha_change =  0.015
		text = _text
		color = _color
		image_alpha = 1.5
		
		alarm[0] = room_speed*2
	}
}
