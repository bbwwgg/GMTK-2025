image_speed = 0

row = 0
col = 0

dir = 0

commands = []
repeat(irandom_range(2,8)){
	array_push(commands,irandom(3))
}

function update_pos(){
	x = TileToScreenX(row,col)
	y = TileToScreenY(row,col)
	
	depth = -y
}