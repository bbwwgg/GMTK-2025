state = player_on_board

instance_create_layer(0,0,"Instances",oCamera)
instance_create_layer(0,0,"Instances",oBoardRender)

function switch_state(_state){
	state = _state
}