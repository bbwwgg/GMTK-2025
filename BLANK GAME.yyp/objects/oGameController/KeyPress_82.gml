//screen_transition(Room1)

if room = room_combat{
	switch_state(player_wins_board)
}else{
	switch_state(load_board)	
}