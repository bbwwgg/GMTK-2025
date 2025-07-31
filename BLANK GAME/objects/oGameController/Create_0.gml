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

get_all_entity_commands()

function switch_state(_state){
	state = _state
}