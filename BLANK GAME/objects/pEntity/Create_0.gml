randomize()


enum ENTITY_STATE{
	MOVE,
	COLLIDE,
	RECOVER
}

image_speed = 0

row = 0
col = 0

dir = 0

commands = []

state = ENTITY_STATE.MOVE

repeat(irandom_range(2,8)){
	array_push(commands,irandom(3))
}


normal_move_time = 12
collide_move_time = 6
move_time = normal_move_time


function update_pos(){
	
	xFrom = x
	yFrom = y
	
	xTo = TileToScreenX(row,col)
	yTo = TileToScreenY(row,col)
	

	time = 0
	
	state = ENTITY_STATE.MOVE
	move_time = normal_move_time
}


function collision(){
	update_pos()
	
	state = ENTITY_STATE.COLLIDE
	move_time = collide_move_time
}



time = move_time
