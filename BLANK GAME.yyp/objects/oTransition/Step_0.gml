switch(state){
	case TRANSITION_STATE.EXIT:
		if sub_image_index < imax + xmax + ymax{
			sub_image_index += sub_image_index_inc	
		}else{
			state = TRANSITION_STATE.ENTER
			
			if room_to != noone{
				room_goto(room_to)
			}

		}
	
	break	
	case TRANSITION_STATE.ENTER:
		if sub_image_index > 0{
			sub_image_index -= sub_image_index_inc
		}else{
			instance_destroy()	
		}
	break;
}