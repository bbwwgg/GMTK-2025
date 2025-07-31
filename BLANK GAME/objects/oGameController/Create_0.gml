state = player_on_board

global.biom = -1

instance_create_layer(0,0,"Instances",oCamera)
instance_create_layer(0,0,"Instances",oBoardRender)

create_entity(0,0,0)
create_entity(1,1,1)
create_entity(0,2,2)
create_entity(0,4,3)



step_command = []
current_turn = 0

get_all_entity_commands()

function switch_state(_state){
	state = _state
}