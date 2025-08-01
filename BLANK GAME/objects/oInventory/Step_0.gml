for (var i = 0; i< array_length(grid[currentPage]); i++){
	var _xx = 100;
	var _yy = 700;
	var _sep = 160;
	if(loop == true){
	var node = instance_create_layer(_xx+_sep*i, _yy, "Instances", nodeSpawner)
	node.nodeType = ds_list_find_value(nodes_list,i+(3*currentPage)).command_vars
	}
}
loop = false;
//this is currently creating infinite spawners, cap it at one by adding a variable and then add the controlls
