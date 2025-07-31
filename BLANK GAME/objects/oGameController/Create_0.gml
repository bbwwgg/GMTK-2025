randomize()

state = player_on_board

global.biom = -1

instance_create_layer(0,0,"Instances",oCamera)
instance_create_layer(0,0,"Instances",oBoardRender)

//create_entity(irandom(global.board_width),irandom(global.board_height),0)


create_entity(0,1,1)
create_entity(0,2,1)
create_entity(0,3,1)
create_entity(0,4,1)
create_entity(0,5,1)
create_entity(0,6,1)
create_entity(0,7,1)
create_entity(1,0,0)
create_entity(1,2,2)



step_command = []
current_turn = 0


time = 0
step_delay = 15

entity_map =  noone

get_all_entity_commands()

function switch_state(_state){
	state = _state
	
	switch _state{
		case execute_step:
			time = 0
		
			var _step_commands =  step_command[current_turn]
			if is_undefined(_step_commands){return}
	
			//Entity map used to move all entities at the same time
			entity_map = ds_grid_create(global.board_width,global.board_height)
	
			conflict_squares = []
	
			for(var i = 0; i < array_length(_step_commands); i ++){
				move_prep(_step_commands[i][0],_step_commands[i][1])		
			}	
		break
	}
}