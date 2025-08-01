if move_timer <= move_time_to{
	x = ease_out(move_timer, xFrom, xTo - xFrom, move_time_to)	
	y = ease_out(move_timer, yFrom, yTo - yFrom, move_time_to)	
}