function node(_ID) constructor{
	ID = _ID
	
	sprite_index = sNode
	sprite = sNode

	shape = 0
	image_index = shape
	
	image_xscale = 1
	image_yscale = 1
	xscale = 1
	yscale = 1
	
	
	
	x = 0
	y = 0
	
	color = 0
	shape = 0

	scale = 1

	xTo = 0
	yTo = 0
	xFrom = 0
	yFrom = 0
	
	
	

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
	
	function draw(){
		if move_timer <= move_time_to{
			x = ease_out(move_timer, xFrom, xTo - xFrom, move_time_to)	
			y = ease_out(move_timer, yFrom, yTo - yFrom, move_time_to)	
			move_timer ++
		}
		xscale = lerp(xscale, image_xscale, 0.25)
		yscale = lerp(yscale, image_xscale, 0.25)
		
		draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,0,color,1)
		draw_sprite_ext(sprite,image_index,x,y,xscale,yscale,0,color,1)


	}

}