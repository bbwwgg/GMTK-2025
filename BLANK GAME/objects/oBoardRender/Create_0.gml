init_tile_database()

while true{
	global.board_width =  irandom_range(5,9)
	global.board_height =  irandom_range(5,9)
	
	var tile_count = global.board_width * global.board_height
	
	if tile_count < 92{
		break	
	}

}

state = TILEMAP_STATE.ENTER

time = 0

global.map = generate_board(global.biom, global.board_width, global.board_height)

	
setup_board_camera()

