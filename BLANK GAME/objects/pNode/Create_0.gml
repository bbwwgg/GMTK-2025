ID = 0

color = 0
shape = 0

scale = 1

xTo = 0
yTo = 0
xFrom = 0
yFrom = 0

sprite = sStartNode

image_speed = 0

move_time_to = 24
move_timer = move_time_to

function move_to(_x, _y, _time_to = 24){
	xTo = _x
	yTo = _y
	xFrom = x
	yFrom = y
	
	move_timer = 0
	move_time_to = _time_to
}
