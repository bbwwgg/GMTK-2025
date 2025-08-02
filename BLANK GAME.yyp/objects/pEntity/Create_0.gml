randomize()
//Customizable stats
max_hp = 99
hp = max_hp 
str = 1
res = 0
collide_dmg = 1




enum ENTITY_STATE{
	MOVE,
	COLLIDE,
	RECOVER,
	FALLING,
	RESPAWN
}

image_speed = 0

row = 0
col = 0

dir = 0

commands = []

state = ENTITY_STATE.MOVE


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

function falling(){
	//change the sprite
	update_pos()
	state = ENTITY_STATE.FALLING
}


time = move_time
