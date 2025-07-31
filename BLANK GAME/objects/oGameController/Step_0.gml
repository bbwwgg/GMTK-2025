script_execute(state)

if keyboard_check_pressed(vk_space){
	execute_step(step_command[current_turn])
	
	current_turn ++
}