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
	case ENTITY_STATE.FALLING:
		
		var shorter_move = floor(move_time*0.75)
	
		x = get_ease_data(MOVE_TYPE.EASE_OUT,time,xFrom,xTo-xFrom,shorter_move)
		y = get_ease_data(MOVE_TYPE.EASE_OUT,time,yFrom,yTo-yFrom,shorter_move)	
		
		if time + 1 > shorter_move{
			image_alpha = 0
			
			x = TileToScreenX(row,col)
			y = TileToScreenY(row,col)
			
			time = 0
			state = ENTITY_STATE.RESPAWN
			move_time = 8
		}
	break
	case  ENTITY_STATE.RESPAWN:
		image_alpha = get_ease_data(MOVE_TYPE.EASE_IN,time,0,1,move_time)
	break
	}
	depth = -y
	
	
	time ++
}