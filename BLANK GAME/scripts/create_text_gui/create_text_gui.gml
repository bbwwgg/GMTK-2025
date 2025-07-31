function create_text_gui(_x,_y,_text, _color){
	with instance_create_layer(_x,_y,"effects",oTextEffect){
	
		vsp = random_range(-1,-2)
		hsp = random_range(-1,1)
		vsp_change = 0.1
		alpha_change =  0.02
		text = _text
		color = _color
		
		alarm[0] = room_speed
	}
}
