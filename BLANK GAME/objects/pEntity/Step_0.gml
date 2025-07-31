if time <= move_time{
	
	switch (state){
	case ENTITY_STATE.MOVE:
		x = get_ease_data(MOVE_TYPE.EASE_OUT,time,xFrom,xTo-xFrom,move_time)
		y = get_ease_data(MOVE_TYPE.EASE_OUT,time,yFrom,yTo-yFrom,move_time)
	break
	case ENTITY_STATE.COLLIDE:
		x = get_ease_data(MOVE_TYPE.EASE_IN,time,xFrom,xTo-xFrom,move_time)
		y = get_ease_data(MOVE_TYPE.EASE_IN,time,yFrom,yTo-yFrom,move_time)
		
		if time + 1 > move_time{
			
			update_pos()

			move_time = collide_move_time
			
		}
		
	break
	}
	depth = -y
	
	time ++
}