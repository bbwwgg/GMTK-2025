script_execute(state)

if keyboard_check_pressed(vk_up){
	global.biom ++
	if global.biom > 4{
		global.biom = -1
	}
	
	instance_destroy(oBoardRender)
	instance_create_layer(0,0,"Instances",oBoardRender)
}


if keyboard_check_pressed(vk_down){
	global.biom --
	if global.biom < -1{
		global.biom = 4
	}
	
	instance_destroy(oBoardRender)
	instance_create_layer(0,0,"Instances",oBoardRender)
}