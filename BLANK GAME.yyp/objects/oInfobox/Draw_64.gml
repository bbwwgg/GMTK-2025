if time <= time_to{
	if state = INFOBOX_STATE.ENTER{
		image_alpha = get_ease_data(MOVE_TYPE.EASE_OUT,time,0,1,time_to)
	}else{
		image_alpha = get_ease_data(MOVE_TYPE.EASE_IN,time,1,-1,time_to)
		
		if time = time_to{
			instance_destroy()	
		}
	}

	name.blend(c_white,image_alpha)
	description.blend(c_white,image_alpha)

	time ++
}

draw_self()

name.draw(x+(INFOBOX_NAME_X_OFFSET+INFOBOX_NAME_WIDTH/2)*image_xscale,y+INFOBOX_NAME_Y_OFFSET*image_yscale)

description.draw(x+(INFOBOX_DESC_X_OFFSET)*image_xscale,y+INFOBOX_DESC_Y_OFFSET*image_yscale)